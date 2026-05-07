@IsTest
private class ClearHenvendelseCacheQueueableTest {
    @TestSetup
    static void makeData() {
        MyTriggers.disable(MessageCacheHandler.class);
        MyTriggers.disable(ThreadCacheHandler.class);
        MyTriggers.disable(ConvNoteCacheHandler.class);
        MyTriggers.disable(JournalEntryCacheHandler.class);

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

        Id convNoteId = [SELECT Id FROM Conversation_Note__c LIMIT 1].Id;

        Test.startTest();
        ClearHenvendelseCacheQueueable queueable = new ClearHenvendelseCacheQueueable(
            new Set<Id>{ convNoteId },
            null
        );
        System.enqueueJob(queueable);
        Test.stopTest();

        System.assertEquals(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldPostOneConversationNoteSuccessfullyForConversationNote() {
        Id convNoteId = [SELECT Id FROM Conversation_Note__c LIMIT 1].Id;

        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Test.startTest();
        new ClearHenvendelseCacheQueueable(new Set<Id>{ convNoteId }, null)
            .sendActorIdsToHenvendelseDbApi();
        Test.stopTest();

        Assert.areEqual(
            0,
            [
                SELECT COUNT()
                FROM Application_Log__c
                WHERE Log_Level__c = 'Error'
            ]
        );
    }

    @IsTest
    static void shouldPostOneConversationNoteSuccessfullyForThread() {
        Id threadId = [SELECT Id FROM Thread__c LIMIT 1].Id;

        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Test.startTest();
        new ClearHenvendelseCacheQueueable(null, new Set<Id>{ threadId })
            .sendActorIdsToHenvendelseDbApi();
        Test.stopTest();

        Assert.areEqual(
            0,
            [
                SELECT COUNT()
                FROM Application_Log__c
                WHERE Log_Level__c = 'Error'
            ]
        );
    }

    @IsTest
    static void shouldHandleConversationNoteAndThreadInSameExecution() {
        Id convNoteId = [SELECT Id FROM Conversation_Note__c LIMIT 1].Id;
        Id threadId = [SELECT Id FROM Thread__c LIMIT 1].Id;

        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Test.startTest();
        new ClearHenvendelseCacheQueueable(
            new Set<Id>{ convNoteId },
            new Set<Id>{ threadId }
        ).sendActorIdsToHenvendelseDbApi();
        Test.stopTest();

        Assert.areEqual(
            0,
            [
                SELECT COUNT()
                FROM Application_Log__c
                WHERE Log_Level__c = 'Error'
            ]
        );
    }

    @IsTest
    static void shouldReturnWhenNoIdsAreProvided() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Test.startTest();
        new ClearHenvendelseCacheQueueable(null, null)
            .sendActorIdsToHenvendelseDbApi();
        Test.stopTest();

        Assert.areEqual(
            0,
            [
                SELECT COUNT()
                FROM Application_Log__c
                WHERE Log_Level__c = 'Error'
            ]
        );
    }

    @IsTest
    static void shouldLogErrorMessageWhenStatusCodeFromTheApiIs500() {
        Id convNoteId = [SELECT Id FROM Conversation_Note__c LIMIT 1].Id;

        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            500,
            'Error'
        );

        Test.startTest();
        new ClearHenvendelseCacheQueueable(new Set<Id>{ convNoteId }, null)
            .sendActorIdsToHenvendelseDbApi();
        Test.stopTest();

        Assert.areEqual(
            1,
            [
                SELECT COUNT()
                FROM Application_Log__c
                WHERE Log_Level__c = 'Error'
            ]
        );
    }

    @IsTest
    static void shouldOnlyEnqueueOneJobFromDispatcher() {
        Id convNoteId = [SELECT Id FROM Conversation_Note__c LIMIT 1].Id;
        Id threadId = [SELECT Id FROM Thread__c LIMIT 1].Id;

        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Test.startTest();
        HenvendelseCacheQueueDispatcher.addConversationNoteIds(
            new Set<Id>{ convNoteId }
        );
        HenvendelseCacheQueueDispatcher.addThreadIds(
            new Set<Id>{ threadId }
        );
        Test.stopTest();

        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }
}