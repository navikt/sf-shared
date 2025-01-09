@IsTest
public class ConvNoteMirroringQueueableTest {
    @TestSetup
    static void makeData() {
        CRM_HENV_TestDataFactory.createRecord(
            new Common_Code__c(CRM_Code_Set__c = 'Tema', CRM_Code__c = 'DAG')
        );
        myTriggers.disable(ConvNoteMirroringHandler.class);
        CRM_HENV_TestDataFactory.createRecord(
            new Conversation_Note__c(CRM_Conversation_Note__c = 'DUMMY TEXT')
        );
        CRM_HENV_TestDataFactory.createRecord(
            new Conversation_Note__c(CRM_Conversation_Note__c = 'DUMMY TEXT 2')
        );
    }

    @isTest
    static void shouldPostOneConversationNoteSuccessfully() {
        Set<Id> convNoteIds = getConversationNoteIds(1);

        ApiMock.setTestMock(
            HenvendelseMirroringCalloutService.SERVICES.POST_HENVENDELSE_MIRRORING_API.name(),
            200,
            'OK'
        );

        Test.startTest();
        Boolean result = new ConvNoteMirroringQueueable(convNoteIds)
            .getAndInitiatePostForAllRelatedConversationNotes();
        System.enqueueJob(new ConvNoteMirroringQueueable(convNoteIds));

        Test.stopTest();

        Assert.areEqual(true, result, 'Post to db should be successful');
    }

    @isTest
    static void shouldPostTwoConversationNoteSuccessfully() {
        Set<Id> convNoteIds = getConversationNoteIds(2);

        ApiMock.setTestMock(
            HenvendelseMirroringCalloutService.SERVICES.POST_HENVENDELSE_MIRRORING_API.name(),
            200,
            'OK'
        );

        Test.startTest();
        Boolean result = new ConvNoteMirroringQueueable(convNoteIds)
            .getAndInitiatePostForAllRelatedConversationNotes();
        System.enqueueJob(new ConvNoteMirroringQueueable(convNoteIds));

        Test.stopTest();

        Assert.areEqual(true, result, 'Post to db should be successful');
    }

    @isTest
    static void shouldRetrunFalseWhenApiReturns500StatusCode() {
        Set<Id> convNoteIds = getConversationNoteIds(1);

        ApiMock.setTestMock(
            HenvendelseMirroringCalloutService.SERVICES.POST_HENVENDELSE_MIRRORING_API.name(),
            500,
            'Internal error'
        );

        Test.startTest();
        Boolean result = new ConvNoteMirroringQueueable(convNoteIds)
            .getAndInitiatePostForAllRelatedConversationNotes();
        System.enqueueJob(new ConvNoteMirroringQueueable(convNoteIds));

        Test.stopTest();

        Assert.areEqual(false, result, 'Post to db is not successful');
        Assert.areEqual(
            2,
            [SELECT COUNT() FROM Application_Log__c],
            'Expect error to be logged'
        );
    }

    private static set<Id> getConversationNoteIds(Integer numberOfRecords) {
        Set<Id> conversationNoteIds = new Set<Id>();
        for (Conversation_Note__c convNote : [
            SELECT
                Id,
                Name,
                CRM_HenvendelseId__c,
                CRM_Henvendelse_BehandlingskjedeId__c,
                CRM_Account__r.CRM_Person__r.INT_ActorId__c,
                CRM_Account__r.CRM_Person__r.Name,
                CRM_Theme_Group_Code__c,
                CRM_Theme_Code__c,
                CRM_Office_Restriction__c,
                CRM_Read_Date__c,
                CRM_Date_Time_Registered__c,
                CRM_Conversation_Note__c,
                CRM_Created_By_Ident__c,
                CRM_Office_Restriction_Activated_By__c,
                CRM_Office_Restriction_Date__c,
                CRM_Incorrectly_Sent_Activated_By__c,
                CRM_Incorrectly_Sent_Date__c,
                CRM_Incorrectly_Sent__c,
                CRM_Disposal_Datetime__c,
                CRM_Communication_Channel__c,
                CRM_Created_By_NAV_Unit__c,
                CRM_Original_Person_GT__c,
                CRM_Original_Person_NAV_Unit__c,
                STO_Sensitive_Information__c,
                CRM_API_Reference__c
            FROM Conversation_Note__c
            LIMIT :numberOfRecords
        ]) {
            conversationNoteIds.add(convNote.Id);
        }
        return conversationNoteIds;
    }
}
