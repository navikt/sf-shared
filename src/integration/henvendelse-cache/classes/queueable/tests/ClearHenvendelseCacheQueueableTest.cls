@IsTest
private class ClearHenvendelseCacheQueueableTest {
    @TestSetup
    static void makeData() {
        myTriggers.disable(MessageCacheHandler.class);
        myTriggers.disable(ThreadCacheHandler.class);
        myTriggers.disable(ConvNoteCacheHandler.class);

        Account personAccount = SharedTestDataFactory.createPersonAccount();

        SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = personAccount.Id,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );

        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(
                CRM_Account__c = personAccount.Id,
                CRM_Type__c = 'STO'
            )
        );

        SharedTestDataFactory.createRecord(
            new Message__c(
                CRM_Thread__c = thread.Id,
                CRM_Message_Text__c = 'Test'
            )
        );
    }

    @IsTest
    static void shouldCreateQueueableJob() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Test.startTest();
        ClearHenvendelseCacheQueueable queueable = new ClearHenvendelseCacheQueueable(
            new Set<Id>{ 'a1P1I0000001a1aUAA' },
            'Message__c'
        );
        System.enqueueJob(queueable);
        Test.stopTest();

        System.assertEquals(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @isTest
    static void shouldPostOneConversationNoteSuccessfully() {
        Id convNoteId = [SELECT Id FROM Conversation_Note__c LIMIT 1].Id;

        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Test.startTest();
        new ClearHenvendelseCacheQueueable(
                new Set<Id>{ convNoteId },
                'Conversation_Note__c'
            )
            .sendActorIdsToHenvendelseDbApi();

        Test.stopTest();

        System.assertEquals(
            0,
            [
                SELECT COUNT()
                FROM Application_Log__c
                WHERE Log_Level__c = 'Error'
            ]
        );
    }

    @isTest
    static void shouldLogErrorMessageWhenStatusCodeFromTheApiIs500() {
        Id convNoteId = [SELECT Id FROM Conversation_Note__c LIMIT 1].Id;

        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            500,
            'Error'
        );

        Test.startTest();
        new ClearHenvendelseCacheQueueable(
                new Set<Id>{ convNoteId },
                'Conversation_Note__c'
            )
            .sendActorIdsToHenvendelseDbApi();

        Test.stopTest();

        System.assertEquals(
            1,
            [
                SELECT COUNT()
                FROM Application_Log__c
                WHERE Log_Level__c = 'Error'
            ]
        );
    }
}
