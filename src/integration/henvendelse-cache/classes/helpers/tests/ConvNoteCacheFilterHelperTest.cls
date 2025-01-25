@IsTest
public class ConvNoteCacheFilterHelperTest {
    @TestSetup
    private static void makeData() {
        myTriggers.disable(ConvNoteCacheHandler.class);
    }

    @IsTest
    static void shouldReturnRecordIdForConvNote() {
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
            convNotes
        );
        Test.stopTest();

        Assert.areEqual(1, result.size());
        Id actualRecordId = new List<Id>(result)[0];
        Assert.areEqual(convNotes[0].Id, actualRecordId);
    }

    @IsTest
    static void shouldNotReturnAnyRecordIdsForConvNoteCreatedByModiaIntegrationUser() {
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
            convNotes
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }

    @IsTest
    static void shouldReturnOneActorIdWhenOneConversationNoteId() {
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
