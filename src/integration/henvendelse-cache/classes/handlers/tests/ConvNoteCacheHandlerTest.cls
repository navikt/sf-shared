@IsTest
public class ConvNoteCacheHandlerTest {
    @TestSetup
    private static void makeData() {
        SharedTestDataFactory.createExperienceCloudUser(); //New Person Account is also created
    }

    @IsTest
    static void shouldCreateQueuableJobWhenConvNoteIsCreatedByInternalSalesforceUser() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;

        Test.startTest();
        SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = accountId,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123'
            )
        );
        Test.stopTest();
        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldCreateQueuableJobWhenConvNoteIsUpdatedByExperienceClodUser() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        User experienceCloudUser = [
            SELECT Id
            FROM User
            WHERE AccountId = :accountId
        ];
        Conversation_Note__c convNote = (Conversation_Note__c) SharedTestDataFactory.createRecord(
            new Conversation_Note__c(
                CRM_Account__c = accountId,
                CRM_Conversation_Note__c = 'DUMMY TEXT',
                CRM_Henvendelse_BehandlingskjedeId__c = '123',
                OwnerId = experienceCloudUser.Id
            )
        );

        Test.startTest();
        System.runAs(experienceCloudUser) {
            convNote.CRM_Is_Read__c = true;
            update convNote;
        }
        Test.stopTest();

        Assert.areEqual(2, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenNumbeOfApiRetriesIsUpdated() {
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
        convNote.CRM_Number_of_API_Retries__c = 7;
        update convNote;
        Test.stopTest();

        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]); //Expect one job when creating conv note, but no job should be created when upddating
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenCreatedByModiaIntegrationUser() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;

        Test.startTest();
        System.runAs(getModiaIntegrationUser()) {
            SharedTestDataFactory.createRecord(
                new Conversation_Note__c(
                    CRM_Account__c = accountId,
                    CRM_Conversation_Note__c = 'DUMMY TEXT',
                    CRM_Henvendelse_BehandlingskjedeId__c = '123'
                )
            );
        }
        Test.stopTest();

        Assert.areEqual(0, [SELECT COUNT() FROM AsyncApexJob]);
    }

    @IsTest
    static void shouldNotCreateQueuableJobWhenUpdatedByModiaIntegrationUser() {
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
        System.runAs(getModiaIntegrationUser()) {
            convNote.CRM_Incorrectly_Sent__c = true;
            update convNote;
        }
        Test.stopTest();

        Assert.areEqual(1, [SELECT COUNT() FROM AsyncApexJob]); //Expect one job when creating conv note, but no job should be created when upddating
    }

    @IsTest
    static void shoulCreateQueuableJobWhenredactionChangeFromModiaIntegrationUser() {
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
        System.runAs(getModiaIntegrationUser()) {
            convNote.STO_Sensitive_Information__c = true;
            update convNote;
        }
        Test.stopTest();

        Assert.areEqual(2, [SELECT COUNT() FROM AsyncApexJob]);
    }

    private static User getModiaIntegrationUser() {
        Id profileId = [
            SELECT Id
            FROM Profile
            WHERE Name = 'System Administrator'
            LIMIT 1
        ]
        .Id;
        return (User) SharedTestDataFactory.createRecord(
            new User(
                username = 'modia.integrasjon@nav.no.test',
                ProfileId = profileId
            )
        );
    }
}
