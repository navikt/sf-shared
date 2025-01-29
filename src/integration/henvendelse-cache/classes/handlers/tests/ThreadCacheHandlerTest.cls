@IsTest
public class ThreadCacheHandlerTest {
    @TestSetup
    private static void makeData() {
        User experienceCloudUser = (User) SharedTestDataFactory.createExperienceCloudUser(); //New Person Account is also created
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;

        SharedTestDataFactory.createRecord(
            new Thread__c(
                CRM_Account__c = accountId,
                CRM_Thread_Type__c = 'STO',
                OwnerId = experienceCloudUser.Id
            )
        );
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenThreadIsCreated() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Test.startTest();
        SharedTestDataFactory.createRecord(
            new Thread__c(
                CRM_Account__c = accountId,
                CRM_Thread_Type__c = 'STO'
            )
        );
        Test.stopTest();

        Assert.areEqual(0, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenThreadIsUpdatedByInternalUser() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Thread__c thread = [
            SELECT Id, CRM_Incorrectly_Sent__c
            FROM Thread__c
            LIMIT 1
        ];

        Test.startTest();
        thread.CRM_Incorrectly_Sent__c = true;
        update thread;
        Test.stopTest();

        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenThreadIsUpdatedByExperienceCloudUser() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id threadId = [SELECT Id FROM Thread__c LIMIT 1].Id;
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Message__c msg = (Message__c) SharedTestDataFactory.createRecord(
            new Message__c(
                CRM_Thread__c = threadId,
                CRM_Message_Text__c = 'Test'
            )
        );

        User experienceCloudUser = [
            SELECT Id
            FROM User
            WHERE AccountId = :accountId
        ];
        Test.startTest();
        System.runAs(experienceCloudUser) {
            msg.CRM_Read__c = true;
            update msg;
        }

        Test.stopTest();

        Assert.areEqual(2, [SELECT COUNT() FROM AsyncApexJob]);
    }
}
