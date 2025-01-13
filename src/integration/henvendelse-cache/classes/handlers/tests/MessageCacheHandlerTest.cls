@IsTest
public class MessageCacheHandlerTest {
    @TestSetup
    private static void makeData() {
        User experienceCloudUser = (User) SharedTestDataFactory.createExperienceCloudUser(); //New Person Account is also created
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;

        SharedTestDataFactory.createRecord(
            new Thread__c(
                CRM_Account__c = accountId,
                CRM_Type__c = 'STO',
                OwnerId = experienceCloudUser.Id
            )
        );
    }

    @IsTest
    static void shouldPublishPlatformEventWhenMessageIsCreatedByInternalUser() {
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

        Assert.areEqual(
            0,
            [SELECT COUNT() FROM Application_Log__c],
            'Expect no error logs'
        );
    }

    @IsTest
    static void shouldPublishPlatformEventWhenMessageIsCreatedByExperienceCloudUser() {
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

        Assert.areEqual(
            0,
            [SELECT COUNT() FROM Application_Log__c],
            'Expect no error logs'
        );
    }

    @IsTest
    static void shouldPublishPlatformEventWhenMessageIsUpdatedByInternalUser() {
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

        Assert.areEqual(
            0,
            [SELECT COUNT() FROM Application_Log__c],
            'Expect no error logs'
        );
    }

    @IsTest
    static void shouldPublishPlatformEventWhenMessageIsUpdatedByExperienceCloudUser() {
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

        Assert.areEqual(
            0,
            [SELECT COUNT() FROM Application_Log__c],
            'Expect no error logs'
        );
    }
}
