@IsTest
public class MessageCacheHandlerTest {
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
    static void shouldCreateQueuableJobWhenMessageIsCreatedByInternalUser() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id threadId = [SELECT Id FROM Thread__c LIMIT 1].Id;
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Test.startTest();
        SharedTestDataFactory.createRecord(
            new Message__c(
                CRM_Thread__c = threadId,
                CRM_Message_Text__c = 'Test'
            )
        );
        Test.stopTest();

        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenMessageIsCreatedByExperienceCloudUser() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id threadId = [SELECT Id FROM Thread__c LIMIT 1].Id;
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        User experienceCloudUser = [
            SELECT Id
            FROM User
            WHERE AccountId = :accountId
        ];
        Test.startTest();
        System.runAs(experienceCloudUser) {
            Message__c msg = new Message__c(
                CRM_Thread__c = threadId,
                CRM_Message_Text__c = 'Test'
            );
            insert msg;
        }
        Test.stopTest();

        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenMessageIsUpdatedByInternalUser() {
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

        Test.startTest();
        msg.CRM_Read__c = true;
        update msg;
        Test.stopTest();

        Assert.areEqual(2, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenMessageIsReadByExperienceCloudUser() {
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

    @IsTest
    static void shouldNotCreateQueuableJobWhenReadByNav() {
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

        Test.startTest();
        msg.CRM_Read_By_Nav__c = true;
        update msg;
        Test.stopTest();

        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenCreatedByModiaIntegrationUser() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id threadId = [SELECT Id FROM Thread__c LIMIT 1].Id;
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;

        Test.startTest();
        System.runAs(getModiaIntegrationUser()) {
            SharedTestDataFactory.createRecord(
                new Message__c(
                    CRM_Thread__c = threadId,
                    CRM_Message_Text__c = 'Test'
                )
            );
        }

        Test.stopTest();

        Assert.areEqual(0, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenUpdatedByModiaIntegrationUser() {
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

        Test.startTest();
        System.runAs(getModiaIntegrationUser()) {
            msg.CRM_Read__c = true;
            update msg;
        }

        Test.stopTest();

        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    private static User getModiaIntegrationUser() {
        Id profileId = [
            SELECT Id
            FROM Profile
            WHERE Name = 'System Administrator'
            LIMIT 1
        ]
        .Id;
        return (User) SharedTestDataFactory.createRecord(
            new User(
                username = 'modia.integrasjon@nav.no.test',
                ProfileId = profileId
            )
        );
    }
}
