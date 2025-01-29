@IsTest
public class MessageCacheFilterHelperTest {
    @TestSetup
    static void makeData() {
        myTriggers.disable(MessageCacheHandler.class);
        myTriggers.disable(ThreadCacheHandler.class);
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
    static void shouldReturnOneThreadIFromOneMessage() {
        myTriggers.disable(MessageCacheHandler.class);
        myTriggers.disable(ThreadCacheHandler.class);

        Id expectedThreadId = [SELECT Id FROM Thread__c LIMIT 1].Id;
        SharedTestDataFactory.createRecord(
            new Message__c(
                CRM_Thread__c = expectedThreadId,
                CRM_Message_Text__c = 'Test'
            )
        );
        List<Message__c> messages = [
            SELECT CRM_Thread__c, LastModifiedById
            FROM Message__c
        ];

        Test.startTest();
        Set<Id> result = MessageCacheFilterHelper.getRecordIdsRequiringCacheClear(
            messages
        );
        Test.stopTest();

        Assert.areEqual(1, result.size());
        Id actualThreadIdId = new List<Id>(result)[0];
        Assert.areEqual(expectedThreadId, actualThreadIdId);
    }

    @IsTest
    static void shouldNotReturnThreadIdForMessageCreatedByModiaIntegrationUser() {
        myTriggers.disable(MessageCacheHandler.class);
        myTriggers.disable(ThreadCacheHandler.class);

        Id expectedThreadId = [SELECT Id FROM Thread__c LIMIT 1].Id;
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
                new Message__c(
                    CRM_Thread__c = expectedThreadId,
                    CRM_Message_Text__c = 'Test'
                )
            );
        }

        List<Message__c> messages = [
            SELECT CRM_Thread__c, LastModifiedById
            FROM Message__c
        ];

        Test.startTest();
        Set<Id> result = MessageCacheFilterHelper.getRecordIdsRequiringCacheClear(
            messages
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }

    @IsTest
    static void shouldReturnOneActorIdWhenThreadTypeIsSto() {
        myTriggers.disable(MessageCacheHandler.class);
        myTriggers.disable(ThreadCacheHandler.class);

        Id threadId = [SELECT Id FROM Thread__c LIMIT 1].Id;

        Message__c message = (Message__c) SharedTestDataFactory.createRecord(
            new Message__c(
                CRM_Thread__c = threadId,
                CRM_Message_Text__c = 'Test'
            )
        );

        Test.startTest();
        Set<String> result = MessageCacheFilterHelper.getActorIds(
            new Set<Id>{ message.Id }
        );
        Test.stopTest();

        Assert.areEqual(1, result.size());
    }

    @IsTest
    static void shouldNotReturnActorIdWhenRelatedAccountIsBusinessAccount() {
        myTriggers.disable(MessageCacheHandler.class);
        myTriggers.disable(ThreadCacheHandler.class);

        Account account = (Account) SharedTestDataFactory.createRecord(
            new Account(Name = 'DUMMY ACCOUNT')
        );

        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(CRM_Account__c = account.Id, CRM_Type__c = 'STO')
        );

        Message__c message = (Message__c) SharedTestDataFactory.createRecord(
            new Message__c(
                CRM_Thread__c = thread.Id,
                CRM_Message_Text__c = 'Test'
            )
        );

        Test.startTest();
        Set<String> result = MessageCacheFilterHelper.getActorIds(
            new Set<Id>{ message.Id }
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }

    @IsTest
    static void shouldNotReturnActorIdWhenMessageIsAgMlonn() {
        myTriggers.disable(MessageCacheHandler.class);
        myTriggers.disable(ThreadCacheHandler.class);

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;

        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(
                CRM_Account__c = accountId,
                CRM_Thread_Type__c = 'AG_MLØNN'
            )
        );

        Message__c message = (Message__c) SharedTestDataFactory.createRecord(
            new Message__c(
                CRM_Thread__c = thread.Id,
                CRM_Message_Text__c = 'Test'
            )
        );

        Test.startTest();
        Set<String> result = MessageCacheFilterHelper.getActorIds(
            new Set<Id>{ message.Id }
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }
}
