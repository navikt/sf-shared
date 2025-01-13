@IsTest
public class ConvNoteCacheFilterHelperTest {
    @TestSetup
    private static void makeData() {
        myTriggers.disable(ConvNoteCacheHandler.class);
    }

    @IsTest
    private static void shouldReturnRecordIdForConvNoteWithBehandlingskjedeId123() {
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
        Set<Id> result = ConvNoteCacheFilterHelper.getRecordIds(convNotes);
        Test.stopTest();

        Assert.areEqual(1, result.size());
        Id actualRecordId = new List<Id>(result)[0];
        Assert.areEqual(convNotes[0].Id, actualRecordId);
    }

    @IsTest
    private static void shouldNotReturnAnyRecordIdsForConvNoteCreatedByModiaIntegrationUser() {
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
        Set<Id> result = ConvNoteCacheFilterHelper.getRecordIds(convNotes);
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }

    @IsTest
    private static void shouldReturnOnePlatformEventWhenConvNoteCreatedByInternalSalesforceUser() {
        Account personAccount = SharedTestDataFactory.createPersonAccount();
        SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = personAccount.Id,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );

        List<Conversation_Note__c> convNotes = [
            SELECT
                Id,
                LastModifiedById,
                CRM_Account__r.CRM_Person__c,
                CRM_Account__r.CRM_Person__r.INT_ActorId__c
            FROM Conversation_Note__c
            WHERE CRM_Henvendelse_BehandlingskjedeId__c = '123'
        ];
        String expectedActorId = convNotes[0]
            .CRM_Account__r.CRM_Person__r.INT_ActorId__c;
        Assert.isNotNull(expectedActorId);

        Test.startTest();
        List<CacheHenvendelse__e> result = ConvNoteCacheFilterHelper.getConvNotesToBeCached(
            convNotes
        );
        Test.stopTest();

        Assert.areEqual(1, result.size());
        Assert.areEqual('123', result[0].BehandlingskjedeId__c);
        Assert.areEqual(expectedActorId, result[0].ActorId__c);
    }

    @IsTest
    private static void shouldNotRetrunPlatformEventsWhenConvNoteIsCreatedByModiaIntegrationUser() {
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
            SELECT
                Id,
                LastModifiedById,
                CRM_Account__r.CRM_Person__c,
                CRM_Account__r.CRM_Person__r.INT_ActorId__c
            FROM Conversation_Note__c
            WHERE CRM_Henvendelse_BehandlingskjedeId__c = '789'
        ];
        Assert.areEqual(1, convNotes.size());

        Test.startTest();
        List<CacheHenvendelse__e> result = ConvNoteCacheFilterHelper.getConvNotesToBeCached(
            convNotes
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }

    @IsTest
    private static void shouldNotRetrunPlatformEventsWhenAccountIsNotAPersonAccount() {
        Account employer = (Account) SharedTestDataFactory.createRecord(
            new Account()
        );
        SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = employer.Id,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '456'
            )
        );

        List<Conversation_Note__c> convNotes = [
            SELECT
                Id,
                LastModifiedById,
                CRM_Account__r.CRM_Person__c,
                CRM_Account__r.CRM_Person__r.INT_ActorId__c
            FROM Conversation_Note__c
            WHERE CRM_Henvendelse_BehandlingskjedeId__c = '456'
        ];
        Assert.areEqual(1, convNotes.size());

        Test.startTest();
        List<CacheHenvendelse__e> result = ConvNoteCacheFilterHelper.getConvNotesToBeCached(
            convNotes
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }
}
