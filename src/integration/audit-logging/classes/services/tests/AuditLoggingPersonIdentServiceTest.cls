@IsTest
private class AuditLoggingPersonIdentServiceTest {
    @TestSetup
    static void makeData() {
        List<Account> accounts = new List<Account>{
            new Account(
                Name = 'Test Account 1',
                INT_PersonIdent__c = '1234567890'
            ),
            new Account(
                Name = 'Test Account 2',
                INT_PersonIdent__c = '0987654321'
            )
        };
        insert accounts;
    }

    @IsTest
    static void shouldReturnTwoPersonIdentsWhenToRecordIdsAsInput() {
        // Arrange
        AuditLoggingPersonIdentService.PersonIdentRequest request = new AuditLoggingPersonIdentService.PersonIdentRequest();
        request.objectName = 'Account';
        request.personIdentField = 'INT_PersonIdent__c';
        request.recordIds = new List<Id>{
            [SELECT Id FROM Account WHERE Name = 'Test Account 1']
            .Id,
            [SELECT Id FROM Account WHERE Name = 'Test Account 2']
            .Id
        };
        system.debug(JSON.serialize(request));
        RestContext.request = new RestRequest();
        RestContext.request.requestBody = Blob.valueOf(JSON.serialize(request));

        // Act
        Test.startTest();
        RestContext.response = new RestResponse();
        AuditLoggingPersonIdentService.getPersonIdents();
        Test.stopTest();

        // Assert
        Assert.areEqual(200, RestContext.response.statusCode);
        String responseBody = RestContext.response.responseBody.toString();
        Assert.areNotEqual(null, responseBody);

        Assert.areEqual(
            '[{"recordId":"' +
                request.recordIds[0] +
                '","personIdent":"1234567890"},{"recordId":"' +
                request.recordIds[1] +
                '","personIdent":"0987654321"}]',
            responseBody
        );
    }
}
