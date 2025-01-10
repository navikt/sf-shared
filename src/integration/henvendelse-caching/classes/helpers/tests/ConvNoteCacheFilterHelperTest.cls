@IsTest
public class ConvNoteCacheFilterHelperTest {
    @TestSetup
    private static void makeData() {
        SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );
    }

    @IsTest
    private static void shouldReturnRecordIdForConvNoteWithBehandlingskjedeId123() {
        List<Conversation_Note__c> convNotes = [
            SELECT Id
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
}
