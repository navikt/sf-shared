/**
 * @description Test class for `CaseOperationResultTest` class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see CaseOperationResult
 */
@isTest
private class CaseOperationResultTest {
    /**
     * @description Test `constructor` with no parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see CaseOperationResult
     */
    @IsTest
    static void constructorEmpty() {
        CaseOperationResult caseOperationResult;

        System.Test.startTest();
        caseOperationResult = new CaseOperationResult();
        System.Test.stopTest();

        System.Assert.isNull(caseOperationResult.Recno, 'Recno should be null');
        System.Assert.isNull(
            caseOperationResult.CaseNumber,
            'CaseNumber should be null'
        );
        System.Assert.isNull(
            caseOperationResult.ImportedCaseNumber,
            'ImportedCaseNumber should be null'
        );
        System.Assert.isNull(caseOperationResult.UID, 'UID should be null');
        System.Assert.isNull(
            caseOperationResult.UIDOrigin,
            'UIDOrigin should be null'
        );
        System.Assert.isNull(
            caseOperationResult.Successful,
            'Successful should be null'
        );
        System.Assert.isNull(
            caseOperationResult.ErrorMessage,
            'ErrorMessage should be null'
        );
        System.Assert.isNull(
            caseOperationResult.ErrorDetails,
            'ErrorDetails should be null'
        );
    }

    /**
     * @description Test `toJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see CaseOperationResult.toJson
     */
    @IsTest
    static void toJson() {
        String recno = 'recno:1234';
        String caseNumber = 'caseNumber';
        String importedCaseNumber = 'importedCaseNumber';
        String uid = 'uid';
        String uidOrigin = 'uidOrigin';
        Boolean successful = true;
        String errorMessage = 'Error Message';
        String errorDetails = 'Error Details';

        String expectedJsonString =
            '{"Recno":"' +
            recno +
            '","CaseNumber":"' +
            caseNumber +
            '","ImportedCaseNumber":"' +
            importedCaseNumber +
            '","UID":"' +
            uid +
            '","UIDOrigin":"' +
            uidOrigin +
            '","Successful":' +
            successful +
            ',"ErrorMessage":"' +
            errorMessage +
            '","ErrorDetails":"' +
            errorDetails +
            '"}';
        String actualJsonString;
        System.Test.startTest();
        CaseOperationResult caseOperationResult = new CaseOperationResult();
        caseOperationResult.Recno = recno;
        caseOperationResult.CaseNumber = caseNumber;
        caseOperationResult.ImportedCaseNumber = importedCaseNumber;
        caseOperationResult.UID = uid;
        caseOperationResult.UIDOrigin = uidOrigin;
        caseOperationResult.Successful = successful;
        caseOperationResult.ErrorMessage = errorMessage;
        caseOperationResult.ErrorDetails = errorDetails;

        actualJsonString = caseOperationResult.toJson();
        System.Test.stopTest();

        System.Assert.areEqual(
            expectedJsonString,
            actualJsonString,
            'toJson should return a JSON string representation of the object.'
        );
    }

    /**
     * @description Test `fromJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see CaseOperationResult.fromJson
     */
    @IsTest
    static void fromJson() {
        String recno = 'recno:1234';
        String caseNumber = 'caseNumber';
        String importedCaseNumber = 'importedCaseNumber';
        String uid = 'uid';
        String uidOrigin = 'uidOrigin';
        Boolean successful = true;
        String errorMessage = 'Error Message';
        String errorDetails = 'Error Details';

        CaseOperationResult caseOperationResultDataType = new CaseOperationResult();
        caseOperationResultDataType.Recno = recno;
        caseOperationResultDataType.CaseNumber = caseNumber;
        caseOperationResultDataType.ImportedCaseNumber = importedCaseNumber;
        caseOperationResultDataType.UID = uid;
        caseOperationResultDataType.UIDOrigin = uidOrigin;
        caseOperationResultDataType.Successful = successful;
        caseOperationResultDataType.ErrorMessage = errorMessage;
        caseOperationResultDataType.ErrorDetails = errorDetails;

        String jsonString =
            '{"Recno":"' +
            recno +
            '","CaseNumber":"' +
            caseNumber +
            '","ImportedCaseNumber":"' +
            importedCaseNumber +
            '","UID":"' +
            uid +
            '","UIDOrigin":"' +
            uidOrigin +
            '","Successful":' +
            successful +
            ',"ErrorMessage":"' +
            errorMessage +
            '","ErrorDetails":"' +
            errorDetails +
            '"}';

        System.Test.startTest();
        CaseOperationResult deserializedCaseOperationResult = CaseOperationResult.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            caseOperationResultDataType.Recno,
            deserializedCaseOperationResult.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            caseOperationResultDataType.CaseNumber,
            deserializedCaseOperationResult.CaseNumber,
            'CaseNumber fields should be equal'
        );
        System.Assert.areEqual(
            caseOperationResultDataType.ImportedCaseNumber,
            deserializedCaseOperationResult.ImportedCaseNumber,
            'ImportedCaseNumber fields should be equal'
        );
        System.Assert.areEqual(
            caseOperationResultDataType.UID,
            deserializedCaseOperationResult.UID,
            'UID fields should be equal'
        );
        System.Assert.areEqual(
            caseOperationResultDataType.UIDOrigin,
            deserializedCaseOperationResult.UIDOrigin,
            'UIDOrigin fields should be equal'
        );
        System.Assert.areEqual(
            caseOperationResultDataType.Successful,
            deserializedCaseOperationResult.Successful,
            'Successful fields should be equal'
        );
        System.Assert.areEqual(
            caseOperationResultDataType.ErrorMessage,
            deserializedCaseOperationResult.ErrorMessage,
            'ErrorMessage fields should be equal'
        );
        System.Assert.areEqual(
            caseOperationResultDataType.ErrorDetails,
            deserializedCaseOperationResult.ErrorDetails,
            'ErrorDetails fields should be equal'
        );
    }
}
