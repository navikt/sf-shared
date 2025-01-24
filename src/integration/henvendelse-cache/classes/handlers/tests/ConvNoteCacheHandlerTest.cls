@IsTest
public class ConvNoteCacheHandlerTest {
    @TestSetup
    private static void makeData() {
        SharedTestDataFactory.createExperienceCloudUser(); //New Person Account is also created
        
    }

    @IsTest
    static void shouldCreateQueuableJobWhenConvNoteIsCreatedByInternalSalesforceUser() {
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
        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenConvNoteIsUpdatedByExperienceClodUser() {
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

        Assert.areEqual(2, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenConvNoteIsUpdatedByInternalUser() {
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

        Assert.areEqual(2, [SELECT COUNT() FROM AsyncApexJob]);
    }
}