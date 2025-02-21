@SuppressWarnings('PMD.NcssMethodCount')
@IsTest
private class AbstractCaseParameterBaseTest {
    /**
     * @description Holds the initial Test Case Parameter test data for the test class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see TestCaseParameter
     */
    private static TestCaseParameter initialTestCaseParameter;
    /**
     * @description Holds the initial Test Case Parameter JSON string for the test class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     */
    private static String initialJsonString;

    /**
     * @description Minimal subclass of AbstractCaseParameterBase for test instantiation.
     * Implements the abstract toJson() method so we can test parse/write logic.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParameterBase
     */
    @SuppressWarnings('PMD.ApexDoc')
    private class TestCaseParameter extends AbstractCaseParameterBase {
        public TestCaseParameter() {
            super();
        }

        public override String toJson() {
            JsonHelper helper = new JsonHelper();
            helper.writeStartObject();
            super.writeCaseParameterFields(helper);
            helper.writeEndObject();
            return helper.getAsString();
        }
    }

    /**
     * @description Creates common test data for the test class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    private static void createTestData() {
        initialTestCaseParameter = new TestCaseParameter();
        // Fields from AbstractCaseRoot
        initialTestCaseParameter.Title = 'Case Title';
        initialTestCaseParameter.ArchiveCodes = new List<ArchiveCodeParameter>{
            new ArchiveCodeParameter('recno:60001', 1)
        };
        // Fields from AbstractCaseParamAndResultBase
        initialTestCaseParameter.AccessGroup = 'AG-12345';
        initialTestCaseParameter.Contacts = new List<ContactParameter>{
            new ContactParameter('RefNum1', 'ContactRole1')
        };
        // Fields from AbstractCaseParameterBase
        initialTestCaseParameter.AccessCode = 'AC-123';
        initialTestCaseParameter.ADContextUser = 'ADUser01';
        initialTestCaseParameter.Category = 'Legal';
        initialTestCaseParameter.Estates = new List<EstateParameter>{
            new EstateParameter('recno:1234', null)
        };
        initialTestCaseParameter.FiledOnPaper = true;
        initialTestCaseParameter.JournalUnit = 'JU-789';
        initialTestCaseParameter.ProgressPlanId = 'PP-456';
        String project = 'ProjectX';
        String responsibleEnterpriseNumber = 'EN-5555';
        String responsibleEnterpriseRecno = 'ER-8888';
        String responsiblePersonEmail = 'person@example.com';
        String responsiblePersonIdNumber = 'ID-9999';
        String responsiblePersonRecno = 'PR-7777';
        String responsiblePersonUserId = 'User-1234';
        String scrapCode = 'SC-321';
        String startDate = P360Helper.getDatetimeFormatGMT(Datetime.now());
        List<UnregisteredContactsParameter> unregisteredContacts = new List<UnregisteredContactsParameter>{
            new UnregisteredContactsParameter('Contact Name', 'Contact Role')
        };
    }

    /**
     * @description Positive Test: parseCaseParameterFields with valid data.
     * Ensures all fields are correctly populated from a valid map.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParameterBase.parseCaseParameterFields
     */
    @IsTest
    static void parseCaseParameterFieldsValidData() {
        // Fields from AbstractCaseRoot
        String title = 'Case Title';
        List<ArchiveCodeParameter> archiveCodes = new List<ArchiveCodeParameter>{
            new ArchiveCodeParameter('recno:60001', 1)
        };
        // Fields from AbstractCaseParamAndResultBase
        String accessGroup = 'AG-12345';
        List<ContactParameter> contacts = new List<ContactParameter>{
            new ContactParameter('RefNum1', 'ContactRole1')
        };
        // Fields from AbstractCaseParameterBase
        String accessCode = 'AC-123';
        String adContextUser = 'ADUser01';
        String category = 'Legal';
        List<EstateParameter> estates = new List<EstateParameter>{
            new EstateParameter('recno:1234', null)
        };
        Boolean filedOnPaper = true;
        String journalUnit = 'JU-789';
        String progressPlanId = 'PP-456';
        String project = 'ProjectX';
        String responsibleEnterpriseNumber = 'EN-5555';
        String responsibleEnterpriseRecno = 'ER-8888';
        String responsiblePersonEmail = 'person@example.com';
        String responsiblePersonIdNumber = 'ID-9999';
        String responsiblePersonRecno = 'PR-7777';
        String responsiblePersonUserId = 'User-1234';
        String scrapCode = 'SC-321';
        String startDate = P360Helper.getDatetimeFormatGMT(Datetime.now());
        List<UnregisteredContactsParameter> unregisteredContacts = new List<UnregisteredContactsParameter>{
            new UnregisteredContactsParameter('Contact Name', 'Contact Role')
        };

        Map<String, Object> rawMap = new Map<String, Object>{
            // Fields from AbstractCaseRoot
            'Title' => title,
            'ArchiveCodes' => ArchiveCodeParameter.toMapList(archiveCodes),
            // Fields from AbstractCaseParamAndResultBase
            'AccessGroup' => accessGroup,
            'Contacts' => ContactParameter.toMapList(contacts),
            // Fields from AbstractCaseParameterBase
            'AccessCode' => accessCode,
            'ADContextUser' => adContextUser,
            'Category' => category,
            'Estates' => EstateParameter.toMapList(estates),
            'FiledOnPaper' => filedOnPaper,
            'JournalUnit' => journalUnit,
            'ProgressPlanId' => progressPlanId,
            'Project' => project,
            'ResponsibleEnterpriseNumber' => responsibleEnterpriseNumber,
            'ResponsibleEnterpriseRecno' => responsibleEnterpriseRecno,
            'ResponsiblePersonEmail' => responsiblePersonEmail,
            'ResponsiblePersonIdNumber' => responsiblePersonIdNumber,
            'ResponsiblePersonRecno' => responsiblePersonRecno,
            'ResponsiblePersonUserId' => responsiblePersonUserId,
            'ScrapCode' => scrapCode,
            'StartDate' => startDate,
            'UnregisteredContacts' => UnregisteredContactsParameter.toMapList(
                unregisteredContacts
            )
        };

        TestCaseParameter param = new TestCaseParameter();

        System.Test.startTest();
        param.parseCaseParameterFields(rawMap);
        System.Test.stopTest();

        // Fields from AbstractCaseRoot
        System.Assert.areEqual(title, param.Title, 'Title mismatch');
        System.Assert.isNotNull(
            param.ArchiveCodes,
            'ArchiveCodes should not be null'
        );
        System.Assert.areEqual(
            archiveCodes.size(),
            param.ArchiveCodes.size(),
            'ArchiveCodes size mismatch'
        );
        System.Assert.areEqual(
            archiveCodes[0].ArchiveType,
            param.ArchiveCodes[0].ArchiveType,
            'ArchiveCode ArchiveType mismatch'
        );
        System.Assert.areEqual(
            archiveCodes[0].SortOrder,
            param.ArchiveCodes[0].SortOrder,
            'ArchiveCode SortOrder mismatch'
        );
        // Fields from AbstractCaseParamAndResultBase
        System.Assert.areEqual(
            accessGroup,
            param.AccessGroup,
            'AccessGroup mismatch'
        );
        System.Assert.isNotNull(param.Contacts, 'Contacts should not be null');
        System.Assert.areEqual(
            contacts.size(),
            param.Contacts.size(),
            'Contacts size mismatch'
        );
        System.Assert.areEqual(
            contacts[0].ReferenceNumber,
            param.Contacts[0].ReferenceNumber,
            'Contact ReferenceNumber mismatch'
        );
        System.Assert.areEqual(
            contacts[0].Role,
            param.Contacts[0].Role,
            'Contact Role mismatch'
        );
        // Fields from AbstractCaseParameterBase
        System.Assert.areEqual(
            accessCode,
            param.AccessCode,
            'AccessCode mismatch'
        );
        System.Assert.areEqual(
            adContextUser,
            param.ADContextUser,
            'ADContextUser mismatch'
        );
        System.Assert.areEqual(category, param.Category, 'Category mismatch');
        System.Assert.isNotNull(param.Estates, 'Estates should not be null');
        System.Assert.areEqual(
            estates.size(),
            param.Estates.size(),
            'Estates size mismatch'
        );
        System.Assert.areEqual(
            estates[0].Recno,
            param.Estates[0].Recno,
            'Estate Recno mismatch'
        );
        System.Assert.isTrue(param.FiledOnPaper, 'FiledOnPaper should be true');
        System.Assert.areEqual(
            journalUnit,
            param.JournalUnit,
            'JournalUnit mismatch'
        );
        System.Assert.areEqual(
            progressPlanId,
            param.ProgressPlanId,
            'ProgressPlanId mismatch'
        );
        System.Assert.areEqual(project, param.Project, 'Project mismatch');
        System.Assert.areEqual(
            responsibleEnterpriseNumber,
            param.ResponsibleEnterpriseNumber,
            'ResponsibleEnterpriseNumber mismatch'
        );
        System.Assert.areEqual(
            responsibleEnterpriseRecno,
            param.ResponsibleEnterpriseRecno,
            'ResponsibleEnterpriseRecno mismatch'
        );
        System.Assert.areEqual(
            responsiblePersonEmail,
            param.ResponsiblePersonEmail,
            'ResponsiblePersonEmail mismatch'
        );
        System.Assert.areEqual(
            responsiblePersonIdNumber,
            param.ResponsiblePersonIdNumber,
            'ResponsiblePersonIdNumber mismatch'
        );
        System.Assert.areEqual(
            responsiblePersonRecno,
            param.ResponsiblePersonRecno,
            'ResponsiblePersonRecno mismatch'
        );
        System.Assert.areEqual(
            responsiblePersonUserId,
            param.ResponsiblePersonUserId,
            'ResponsiblePersonUserId mismatch'
        );
        System.Assert.areEqual(
            scrapCode,
            param.ScrapCode,
            'ScrapCode mismatch'
        );
        System.Assert.isNotNull(
            param.StartDate,
            'StartDate should not be null'
        );
        System.Assert.isNotNull(
            param.UnregisteredContacts,
            'UnregisteredContacts should not be null'
        );
        System.Assert.areEqual(
            unregisteredContacts.size(),
            param.UnregisteredContacts.size(),
            'UnregisteredContacts size mismatch'
        );
        System.Assert.areEqual(
            unregisteredContacts[0].ContactName,
            param.UnregisteredContacts[0].ContactName,
            'UnregisteredContact ContactName mismatch'
        );
        System.Assert.areEqual(
            unregisteredContacts[0].Role,
            param.UnregisteredContacts[0].Role,
            'UnregisteredContact Role mismatch'
        );
    }

    /**
     * @description Negative Test: parseCaseParameterFields should handle missing optional fields.
     * Ensure optional fields are null when not present in the input map.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParameterBase.parseCaseParameterFields
     */
    @IsTest
    static void parseCaseParameterFieldsHandlesMissingOptionalFields() {
        Map<String, Object> rawMap = new Map<String, Object>{};

        TestCaseParameter param = new TestCaseParameter();

        System.Test.startTest();
        param.parseCaseParameterFields(rawMap);
        System.Test.stopTest();

        System.Assert.isNull(param.AccessCode, 'AccessCode mismatch');
        System.Assert.isNull(
            param.ADContextUser,
            'ADContextUser should be null'
        );
        System.Assert.isNull(param.Category, 'Category should be null');
        System.Assert.isNull(param.Estates, 'Estates should be null');
        System.Assert.isNull(param.FiledOnPaper, 'FiledOnPaper should be null');
        System.Assert.isNull(param.JournalUnit, 'JournalUnit should be null');
        System.Assert.isNull(
            param.ProgressPlanId,
            'ProgressPlanId should be null'
        );
        System.Assert.isNull(param.Project, 'Project should be null');
        System.Assert.isNull(
            param.ResponsibleEnterpriseNumber,
            'ResponsibleEnterpriseNumber should be null'
        );
        System.Assert.isNull(
            param.ResponsibleEnterpriseRecno,
            'ResponsibleEnterpriseRecno should be null'
        );
        System.Assert.isNull(
            param.ResponsiblePersonEmail,
            'ResponsiblePersonEmail should be null'
        );
        System.Assert.isNull(
            param.ResponsiblePersonIdNumber,
            'ResponsiblePersonIdNumber should be null'
        );
        System.Assert.isNull(
            param.ResponsiblePersonRecno,
            'ResponsiblePersonRecno should be null'
        );
        System.Assert.isNull(
            param.ResponsiblePersonUserId,
            'ResponsiblePersonUserId should be null'
        );
        System.Assert.isNull(param.ScrapCode, 'ScrapCode should be null');
        System.Assert.isNull(param.StartDate, 'StartDate should be null');
        System.Assert.isNull(
            param.UnregisteredContacts,
            'UnregisteredContacts should be null'
        );
    }

    /**
     * @description Positive Test: writeCaseParameterFields serializes correctly.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParameterBase.writeCaseParameterFields
     */
    @IsTest
    static void writeCaseParameterFieldsValidData() {
        TestCaseParameter param = new TestCaseParameter();
        // Fields from AbstractCaseRoot
        param.Title = 'Case Title';
        param.ArchiveCodes = new List<ArchiveCodeParameter>{
            new ArchiveCodeParameter('recno:60001', 1)
        };
        // Fields from AbstractCaseParamAndResultBase
        param.AccessGroup = 'AG-12345';
        param.Contacts = new List<ContactParameter>{
            new ContactParameter('RefNum1', 'ContactRole1')
        };
        // Fields from AbstractCaseParameterBase
        param.AccessCode = 'AC-999';
        param.ADContextUser = 'ADUser99';
        param.Category = 'Finance';
        param.FiledOnPaper = false;
        param.StartDate = Datetime.now();
        param.Remarks = new List<RemarkParameter>{
            new RemarkParameter('Remark1', 'RemarkType1')
        };
        param.Status = 'Closed';
        param.Estates = new List<EstateParameter>{
            new EstateParameter('recno:12345', 'EstateName')
        };
        param.JournalUnit = 'JU-123';
        param.ProgressPlanId = 'PP-123';
        param.Project = 'ProjectY';
        param.ResponsibleEnterpriseNumber = 'EN-123';
        param.ResponsibleEnterpriseRecno = 'ER-123';
        param.ResponsiblePersonEmail = 'person@example.com';
        param.ResponsiblePersonIdNumber = 'ID-123';
        param.ResponsiblePersonRecno = 'PR-123';
        param.ResponsiblePersonUserId = 'User-123';
        param.ScrapCode = 'SC-123';
        param.UnregisteredContacts = new List<UnregisteredContactsParameter>{
            new UnregisteredContactsParameter('ContactName', 'ContactRole')
        };

        System.Test.startTest();
        String jsonOutput = param.toJson();
        System.Test.stopTest();

        Map<String, Object> parsed = (Map<String, Object>) JSON.deserializeUntyped(
            jsonOutput
        );
        System.Assert.areEqual(
            'AC-999',
            parsed.get('AccessCode'),
            'AccessCode mismatch in JSON'
        );
        System.Assert.areEqual(
            'ADUser99',
            parsed.get('ADContextUser'),
            'ADContextUser mismatch in JSON'
        );
        System.Assert.areEqual(
            'Finance',
            parsed.get('Category'),
            'Category mismatch in JSON'
        );
        System.Assert.isFalse(
            (Boolean) parsed.get('FiledOnPaper'),
            'FiledOnPaper should be false'
        );
        System.Assert.isNotNull(
            parsed.get('StartDate'),
            'StartDate should not be null in JSON'
        );
    }

    /**
     * @description Negative Test: parseCaseParameterFields should handle invalid data types.
     */
    @IsTest
    static void parseCaseParameterFields_InvalidDataTypes_ShouldThrowException() {
        // Arrange: rawMap with incorrect data type for FiledOnPaper
        Map<String, Object> rawMap = new Map<String, Object>{
            'AccessCode' => 'AC-123',
            'FiledOnPaper' => 'INVALID_DATA_TYPE'
        };

        TestCaseParameter param = new TestCaseParameter();
        Boolean isExceptionThrown = false;

        // Act
        System.Test.startTest();
        try {
            param.parseCaseParameterFields(rawMap);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        // Assert
        System.Assert.isTrue(
            isExceptionThrown,
            'Expected an exception when parsing invalid data type'
        );
    }

    /**
     * @description Negative Test: parseCaseParameterFields should handle null input map.
     */
    @IsTest
    static void parseCaseParameterFields_NullMap_ShouldThrowException() {
        TestCaseParameter param = new TestCaseParameter();
        Boolean isExceptionThrown = false;

        // Act
        System.Test.startTest();
        try {
            param.parseCaseParameterFields(null);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        // Assert
        System.Assert.isTrue(
            isExceptionThrown,
            'Expected an exception when input map is null'
        );
    }
}
