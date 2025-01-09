@IsTest
public class ConvNoteCacheHandlerTest {
    @TestSetup
    static void makeData() {
        CRM_HENV_TestDataFactory.createRecord(
            new Common_Code__c(CRM_Code_Set__c = 'Tema', CRM_Code__c = 'DAG')
        );
    }

    @IsTest
    private static void shouldPublishPlatformEventWithoutAnyErrors() {
        Test.startTest();
        CRM_HENV_TestDataFactory.createRecord(
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
