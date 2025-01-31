@IsTest
public class ConvNoteCacheFilterHelperTest {
    @IsTest
    static void shouldReturnRecordIdForConvNote() {
        myTriggers.disable(ConvNoteCacheHandler.class);

        Account personAccount = SharedTestDataFactory.createPersonAccount();
        SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = personAccount.Id,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );

        List<Conversation_Note__c> convNotes = [
            SELECT Id, LastModifiedById
            FROM Conversation_Note__c
            WHERE CRM_Henvendelse_BehandlingskjedeId__c = '123'
        ];

        Test.startTest();
        Set<Id> result = ConvNoteCacheFilterHelper.getRecordIdsRequiringCacheClear(
            convNotes,
            false //record is created
        );
        Test.stopTest();

        Assert.areEqual(1, result.size());
        Id actualRecordId = new List<Id>(result)[0];
        Assert.areEqual(convNotes[0].Id, actualRecordId);
    }

    @IsTest
    static void shouldNotReturnAnyRecordIdsForConvNoteCreatedByModiaIntegrationUser() {
        myTriggers.disable(ConvNoteCacheHandler.class);

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

        Account personAccount = SharedTestDataFactory.createPersonAccount();

        System.runAs(modiaIntegrationUser) {
            SharedTestDataFactory.createRecord(
                new Conversation_Note__c(
                    CRM_Account__c = personAccount.Id,
                    CRM_Conversation_Note__c = 'DUMMY TEXT',
                    CRM_Henvendelse_BehandlingskjedeId__c = '789'
                )
            );
        }

        List<Conversation_Note__c> convNotes = [
            SELECT Id, LastModifiedById
            FROM Conversation_Note__c
            WHERE CRM_Henvendelse_BehandlingskjedeId__c = '789'
        ];

        Test.startTest();
        Set<Id> result = ConvNoteCacheFilterHelper.getRecordIdsRequiringCacheClear(
            convNotes,
            false //record is created
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }

    @IsTest
    static void shouldReturnOneRecordIdForConvNoteUpdatedByModiaIntegrationUser() {
        myTriggers.disable(ConvNoteCacheHandler.class);

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

        Account personAccount = SharedTestDataFactory.createPersonAccount();

        System.runAs(modiaIntegrationUser) {
            SharedTestDataFactory.createRecord(
                new Conversation_Note__c(
                    CRM_Account__c = personAccount.Id,
                    CRM_Conversation_Note__c = 'DUMMY TEXT',
                    CRM_Henvendelse_BehandlingskjedeId__c = '789'
                )
            );
        }

        List<Conversation_Note__c> convNotes = [
            SELECT Id, LastModifiedById
            FROM Conversation_Note__c
            WHERE CRM_Henvendelse_BehandlingskjedeId__c = '789'
        ];

        Test.startTest();
        Set<Id> result = ConvNoteCacheFilterHelper.getRecordIdsRequiringCacheClear(
            convNotes,
            true //record is updated
        );
        Test.stopTest();

        Assert.areEqual(1, result.size());
    }

    @IsTest
    static void shouldReturnOneActorIdWhenOneConversationNoteId() {
        myTriggers.disable(ConvNoteCacheHandler.class);

        Account personAccount = SharedTestDataFactory.createPersonAccount();
        Conversation_Note__c convNote = (Conversation_Note__c) SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = personAccount.Id,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );

        Test.startTest();
        Set<String> result = ConvNoteCacheFilterHelper.getActorIds(
            new Set<Id>{ convNote.Id }
        );
        Test.stopTest();

        Assert.areEqual(1, result.size());
    }

    @IsTest
    static void shouldNotReturnOneActorIdWhenRelatedAccountIsBusinessAccount() {
        myTriggers.disable(ConvNoteCacheHandler.class);

        Account account = (Account) SharedTestDataFactory.createRecord(
            new Account(Name = 'DUMMY ACCOUNT')
        );
        Conversation_Note__c convNote = (Conversation_Note__c) SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = account.Id,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );

        Test.startTest();
        Set<String> result = ConvNoteCacheFilterHelper.getActorIds(
            new Set<Id>{ convNote.Id }
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }
}
