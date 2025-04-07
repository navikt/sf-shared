@IsTest
public class JournalEntryCacheHandlerTest {
    @TestSetup
    private static void makeData() {
        SharedTestDataFactory.createPersonAccount();
    }

    @IsTest
    static void shouldCreateQueuableJobWhenJournalEntryForConvNoteIsCreated() {
        myTriggers.disable(ConvNoteCacheHandler.class);
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Conversation_Note__c convNote = (Conversation_Note__c) SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = accountId,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );

        Test.startTest();
        SharedTestDataFactory.createRecord(
            new Journal_Entry__c(CRM_Conversation_Note__c = convNote.Id)
        );
        Test.stopTest();
        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenJournalEntryWithPostTypeNotatForThreadIsCreated() {
        myTriggers.disable(ConvNoteCacheHandler.class);
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(CRM_Account__c = accountId, CRM_Type__c = 'STO')
        );

        Test.startTest();
        SharedTestDataFactory.createRecord(
            new Journal_Entry__c(
                CRM_Thread__c = thread.Id,
                CRM_Journal_Post_Type__c = 'Notat'
            )
        );
        Test.stopTest();
        Assert.areEqual(0, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shoulCreateQueuableJobWhenJournalEntryWithPostInngaaendeForThreadIsCreated() {
        myTriggers.disable(ConvNoteCacheHandler.class);
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(CRM_Account__c = accountId, CRM_Type__c = 'STO')
        );

        Test.startTest();
        SharedTestDataFactory.createRecord(
            new Journal_Entry__c(
                CRM_Thread__c = thread.Id,
                CRM_Journal_Post_Type__c = 'INNGAAENDE'
            )
        );
        Test.stopTest();
        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shoulCreateQueuableJobWhenJournalEntryWithPostUtgaaendeForThreadIsCreated() {
        myTriggers.disable(ConvNoteCacheHandler.class);
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(CRM_Account__c = accountId, CRM_Type__c = 'STO')
        );

        Test.startTest();
        SharedTestDataFactory.createRecord(
            new Journal_Entry__c(
                CRM_Thread__c = thread.Id,
                CRM_Journal_Post_Type__c = 'UTGAAENDE'
            )
        );
        Test.stopTest();
        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenJournalEntryForThreadIsUpdatedWithStatusCompleted() {
        myTriggers.disable(ConvNoteCacheHandler.class);
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(CRM_Account__c = accountId, CRM_Type__c = 'STO')
        );

        Journal_Entry__c journalEntry = (Journal_Entry__c) SharedTestDataFactory.createRecord(
            new Journal_Entry__c()
        );

        Test.startTest();
        journalEntry.CRM_Thread__c = thread.Id;
        journalEntry.Journal_Entry_Status__c = 'Completed';
        update journalEntry;

        Test.stopTest();
        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenJournalEntryForThreadIsUpdatedWithoutChangingStatus() {
        myTriggers.disable(ConvNoteCacheHandler.class);
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(CRM_Account__c = accountId, CRM_Type__c = 'STO')
        );

        Journal_Entry__c journalEntry = (Journal_Entry__c) SharedTestDataFactory.createRecord(
            new Journal_Entry__c()
        );

        Test.startTest();
        journalEntry.CRM_Thread__c = thread.Id;
        update journalEntry;

        Test.stopTest();
        Assert.areEqual(0, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenJournalEntryForConvNoteIsUpdated() {
        myTriggers.disable(ConvNoteCacheHandler.class);
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Conversation_Note__c convNote = (Conversation_Note__c) SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = accountId,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );

        Journal_Entry__c journalEntry = (Journal_Entry__c) SharedTestDataFactory.createRecord(
            new Journal_Entry__c()
        );

        Test.startTest();
        journalEntry.CRM_Conversation_Note__c = convNote.Id;
        update journalEntry;

        Test.stopTest();
        Assert.areEqual(0, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenJournalEntryIdIsUpdatedForThread() {
        myTriggers.disable(ConvNoteCacheHandler.class);
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(CRM_Account__c = accountId, CRM_Type__c = 'STO')
        );

        Journal_Entry__c journalEntry = (Journal_Entry__c) SharedTestDataFactory.createRecord(
            new Journal_Entry__c(CRM_Thread__c = thread.Id)
        );

        Test.startTest();
        journalEntry.Journal_Entry_ID__c = '123';
        update journalEntry;

        Test.stopTest();
        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenJournalEntryIsCreatedByModia() {
        myTriggers.disable(ConvNoteCacheHandler.class);
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Conversation_Note__c convNote = (Conversation_Note__c) SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = accountId,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );

        Test.startTest();
        System.runAs(SharedTestDataFactory.createModiaIntegrationUser()) {
            SharedTestDataFactory.createRecord(
                new Journal_Entry__c(CRM_Conversation_Note__c = convNote.Id)
            );
        }
        Test.stopTest();
        Assert.areEqual(0, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenJournalEntryIsUpdatedByModiaIntegrationUser() {
        myTriggers.disable(ConvNoteCacheHandler.class);
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(CRM_Account__c = accountId, CRM_Type__c = 'STO')
        );

        Journal_Entry__c journalEntry = (Journal_Entry__c) SharedTestDataFactory.createRecord(
            new Journal_Entry__c()
        );

        Test.startTest();
        System.runAs(SharedTestDataFactory.createModiaIntegrationUser()) {
            journalEntry.CRM_Thread__c = thread.Id;
            journalEntry.Journal_Entry_Status__c = 'Completed';
            update journalEntry;
        }

        Test.stopTest();
        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }
}
