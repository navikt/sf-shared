@IsTest
public class ConvNoteCacheFilterHelperTest {
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
