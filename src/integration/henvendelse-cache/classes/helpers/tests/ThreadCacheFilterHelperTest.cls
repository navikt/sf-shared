@IsTest
public class ThreadCacheFilterHelperTest {
    @TestSetup
    static void makeData() {
        myTriggers.disable(MessageCacheHandler.class);
        myTriggers.disable(ThreadCacheHandler.class);
        User experienceCloudUser = (User) SharedTestDataFactory.createExperienceCloudUser(); //New Person Account is also created
    }

    @IsTest
    static void shouldReturnOneThreadWhenOneThreadIsCreated() {
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Id experienceCloudUserId = [
            SELECT Id
            FROM User
            WHERE AccountId = :accountId
        ]
        .Id;
        SharedTestDataFactory.createRecord(
            new Thread__c(
                CRM_Account__c = accountId,
                CRM_Type__c = 'STO',
                OwnerId = experienceCloudUserId
            )
        );
        List<Thread__c> threads = [SELECT Id, LastModifiedById FROM Thread__c];
        Test.startTest();
        Set<Id> result = ThreadCacheFilterHelper.getRecordIdsRequiringCacheClear(
            threads
        );
        Test.stopTest();

        Assert.areEqual(1, result.size());
        Id actualThreadIdId = new List<Id>(result)[0];
        Assert.areEqual(threads[0].Id, actualThreadIdId);
    }

    @IsTest
    static void shouldNotReturnThreadIdForThreadCreatedByModiaIntegrationUser() {
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Id experienceCloudUserId = [
            SELECT Id
            FROM User
            WHERE AccountId = :accountId
        ]
        .Id;

        //Create record as Modia Integration User
        Id profileId = [
            SELECT Id
            FROM Profile
            WHERE Name = 'System Administrator'
            LIMIT 1
        ]
        .Id;
        User modiaIntegrationUser = (User) SharedTestDataFactory.createRecord(
            new User(
                username = 'modia.integrasjon@nav.no.test',
                ProfileId = profileId
            )
        );

        System.runAs(modiaIntegrationUser) {
            SharedTestDataFactory.createRecord(
                new Thread__c(
                    CRM_Account__c = accountId,
                    CRM_Type__c = 'STO',
                    OwnerId = experienceCloudUserId
                )
            );
        }

        List<Thread__c> threads = [SELECT Id, LastModifiedById FROM Thread__c];
        Test.startTest();
        Set<Id> result = ThreadCacheFilterHelper.getRecordIdsRequiringCacheClear(
            threads
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }
}
