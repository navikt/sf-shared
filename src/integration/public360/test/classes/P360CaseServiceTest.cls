/**
 * @description Test class for P360CaseService class.
 *
 * @author Kenneth Soerensen (kenneth.sorensen@nav.com), NAV
 * @since 0.1.0, December 2024
 * @group Public 360 Integration
 * @see P360CaseService
 */
@isTest
private class P360CaseServiceTest {
    @isTest
    static void createCase() {
        P360CaseService caseService = new P360CaseService(
            'NavPublic360Integration'
        );

        CreateCaseParameter createCaseParameter = new CreateCaseParameter(
            'title'
        );

        System.Test.startTest();
        caseService.createCase(createCaseParameter);
        System.Test.stopTest();

        System.Assert.areEqual(
            P360CaseService.CaseOperation.CREATE_CASE,
            caseService.operationType,
            'The operation type should be set to CreateCase.'
        );
        System.Assert.areEqual(
            createCaseParameter.toJson(),
            caseService.requestBody,
            'The request body should be set to the JSON representation of the CreateCaseParameter object.'
        );
    }

    @IsTest
    static void methodName() {
        P360CaseService caseService = new P360CaseService(
            'NavPublic360Integration'
        );

        CreateCaseParameter createCaseParameter = new CreateCaseParameter(
            'title'
        );
        caseService.createCase(createCaseParameter);

        SingleRequestMock mock = new SingleRequestMock(
            200,
            'OK',
            caseService.requestBody,
            new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, mock);

        Test.startTest();
        caseService.send();
        Test.stopTest();

        System.debug(caseService.operationResponse.getBody());

        System.Assert.areEqual(
            200,
            caseService.operationResponse.getStatusCode(),
            'The status code should be 200.'
        );
        System.Assert.areEqual(
            'OK',
            caseService.operationResponse.getStatus(),
            'The status should be OK.'
        );
        System.Assert.areEqual(
            caseService.requestBody,
            caseService.operationResponse.getBody(),
            'The response body should be the same as the request body.'
        );
    }
}
