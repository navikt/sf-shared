@IsTest
public class ConvNoteCacheHandlerTest {
    @TestSetup
    private static void makeData() {
        SharedTestDataFactory.createExperienceCloudUser(); //New Person Account is also created
    }

    @IsTest
    static void shouldPublishPlatformEventWhenConvNoteIsCreated() {
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;

        Test.startTest();
        SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = accountId,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
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
    static void shouldPublishPlatformEventWhenConvNoteIsUpdatedByExperienceCloudUser() {
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        User experienceCloudUser = [
            SELECT Id
            FROM User
            WHERE AccountId = :accountId
        ];
        Conversation_Note__c convNote = (Conversation_Note__c) SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = accountId,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123',
                OwnerId = experienceCloudUser.Id
            )
        );

        Test.startTest();
        System.runAs(experienceCloudUser) {
            convNote.CRM_Is_Read__c = true;
            update convNote;
        }
        Test.stopTest();

        Assert.areEqual(
            0,
            [SELECT COUNT() FROM Application_Log__c],
            'Expect no error logs'
        );
    }

    @IsTest
    static void shouldPublishPlatformEventWhenConvNoteIsUpdatedByInternalUser() {
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Conversation_Note__c convNote = (Conversation_Note__c) SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = accountId,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );

        Test.startTest();
        convNote.CRM_Is_Read__c = true;
        update convNote;
        Test.stopTest();

        Assert.areEqual(
            0,
            [SELECT COUNT() FROM Application_Log__c],
            'Expect no error logs'
        );
    }
}
