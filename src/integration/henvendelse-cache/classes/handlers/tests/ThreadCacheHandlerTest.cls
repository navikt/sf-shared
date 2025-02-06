@IsTest
public class ThreadCacheHandlerTest {
    @TestSetup
    private static void makeData() {
        User experienceCloudUser = (User) SharedTestDataFactory.createExperienceCloudUser(); //New Person Account is also created
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;

        SharedTestDataFactory.createRecord(
            new Thread__c(
                CRM_Account__c = accountId,
                CRM_Thread_Type__c = 'STO',
                OwnerId = experienceCloudUser.Id
            )
        );
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenThreadIsCreated() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        Test.startTest();
        SharedTestDataFactory.createRecord(
            new Thread__c(
                CRM_Account__c = accountId,
                CRM_Thread_Type__c = 'STO'
            )
        );
        Test.stopTest();

        Assert.areEqual(0, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenFieldUpdateIsNotRelevant() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Thread__c thread = [
            SELECT Id, CRM_Conversation_Summary__c
            FROM Thread__c
            LIMIT 1
        ];

        Test.startTest();
        thread.CRM_Conversation_Summary__c = 'test';
        update thread;
        Test.stopTest();

        Assert.areEqual(0, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenCategoryIsChanged() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Thread__c thread = [
            SELECT Id, STO_Category__c
            FROM Thread__c
            LIMIT 1
        ];

        Test.startTest();
        thread.STO_Category__c = 'Helse';
        update thread;
        Test.stopTest();

        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }
}
