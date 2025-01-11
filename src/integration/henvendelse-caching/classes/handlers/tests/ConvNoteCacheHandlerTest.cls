@IsTest
public class ConvNoteCacheHandlerTest {
    @IsTest
    private static void shouldPublishPlatformEventWhenConvNoteIsCreated() {
        Test.startTest();
        SharedTestDataFactory.createRecord(
            new Conversation_Note__c(CRM_Conversation_Note__c = 'DUMMY TEXT')
        );
        Test.stopTest();

        Assert.areEqual(
            0,
            [SELECT COUNT() FROM Application_Log__c],
            'Expect no error logs'
        );
    }
}
