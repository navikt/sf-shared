@IsTest
private class AbstractCaseParamAndResultBaseTest {
    /**
     * @description A minimal subclass of `AbstractCaseParamAndResultBase` so we can instantiate and
     * test its methods.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParamAndResultBase
     */
    @SuppressWarnings('PMD.ApexDoc')
    private class TestCaseParamAndResult extends AbstractCaseParamAndResultBase {
        public TestCaseParamAndResult() {
            super();
        }

        public override String toJson() {
            JsonHelper helper = new JsonHelper();
            helper.writeStartObject();
            super.writeParamAndResultFields(helper);
            helper.writeEndObject();
            return helper.getAsString();
        }
    }

    /**
     * @description Positive test: parseParamAndResultFields with valid data
     * verifies that fields are set properly.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParamAndResultBase.parseParamAndResultFields
     */
    @IsTest
    static void parseParamAndResultFieldsValidData() {
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
        String eArchiveXMLFragment = 'XMLFragment-abc';
        List<String> keywords = new List<String>{ 'keyword1', 'keyword2' };
        String notes = 'Some notes';
        String paragraph = 'Some paragraph';
        List<String> referringCases = new List<String>{ 'Case1', 'Case2' };
        List<RemarkParameter> remarks = new List<RemarkParameter>{
            new RemarkParameter('Remark1', 'RemarkType1'),
            new RemarkParameter('Remark2', 'RemarkType2')
        };
        String status = 'Open';

        Map<String, Object> rawMap = new Map<String, Object>{
            // Fields from AbstractCaseRoot
            'Title' => title,
            'ArchiveCodes' => ArchiveCodeParameter.toMapList(archiveCodes),
            // Fields from AbstractCaseParamAndResultBase
            'AccessGroup' => AccessGroup,
            'Contacts' => ContactParameter.toMapList(contacts),
            'eArchiveXMLFragment' => eArchiveXMLFragment,
            'Keywords' => keywords,
            'Notes' => notes,
            'Paragraph' => paragraph,
            'ReferringCases' => referringCases,
            'Remarks' => RemarkParameter.toMapList(remarks),
            'Status' => status
        };

        TestCaseParamAndResult testObj = new TestCaseParamAndResult();

        System.Test.startTest();
        testObj.parseParamAndResultFields(rawMap);
        System.Test.stopTest();

        // Fields from AbstractCaseRoot
        System.Assert.areEqual(title, testObj.Title, 'Title mismatch');
        System.Assert.areEqual(
            archiveCodes.size(),
            testObj.ArchiveCodes.size(),
            'ArchiveCodes size mismatch'
        );
        System.Assert.areEqual(
            archiveCodes[0].archiveType,
            testObj.ArchiveCodes[0].archiveType,
            'ArchiveCodes[0].archiveType mismatch'
        );
        System.Assert.areEqual(
            archiveCodes[0].SortOrder,
            testObj.ArchiveCodes[0].SortOrder,
            'ArchiveCodes[0].archiveType mismatch'
        );
        // Fields from AbstractCaseParamAndResultBase
        System.Assert.areEqual(
            accessGroup,
            testObj.AccessGroup,
            'AccessGroup mismatch'
        );
        System.Assert.areEqual(
            contacts.size(),
            testObj.Contacts.size(),
            'Contacts size mismatch'
        );
        System.Assert.areEqual(
            contacts[0].ReferenceNumber,
            testObj.Contacts[0].ReferenceNumber,
            'Contacts[0].ReferenceNumber mismatch'
        );
        System.Assert.areEqual(
            contacts[0].Role,
            testObj.Contacts[0].Role,
            'Contacts[0].Role mismatch'
        );
        System.Assert.areEqual(
            eArchiveXMLFragment,
            testObj.eArchiveXMLFragment,
            'eArchiveXMLFragment mismatch'
        );
        System.Assert.areEqual(
            keywords.size(),
            testObj.Keywords.size(),
            'Keywords size mismatch'
        );
        System.Assert.areEqual(
            keywords[0],
            testObj.Keywords[0],
            'Keyword[0] mismatch'
        );
        System.Assert.areEqual(
            keywords[1],
            testObj.Keywords[1],
            'Keyword[1] mismatch'
        );
        System.Assert.areEqual(notes, testObj.Notes, 'Notes mismatch');
        System.Assert.areEqual(
            paragraph,
            testObj.Paragraph,
            'Paragraph mismatch'
        );
        System.Assert.areEqual(
            referringCases.size(),
            testObj.ReferringCases.size(),
            'ReferringCases size mismatch'
        );
        System.Assert.areEqual(
            referringCases[0],
            testObj.ReferringCases[0],
            'ReferringCases[0] mismatch'
        );
        System.Assert.areEqual(
            referringCases[1],
            testObj.ReferringCases[1],
            'ReferringCases[1] mismatch'
        );
        System.Assert.areEqual(
            remarks.size(),
            testObj.Remarks.size(),
            'Remarks size mismatch'
        );
        System.Assert.areEqual(
            remarks[0].Title,
            testObj.Remarks[0].Title,
            'Remarks[0].Title mismatch'
        );
        System.Assert.areEqual(
            remarks[0].RemarkType,
            testObj.Remarks[0].RemarkType,
            'Remarks[0].RemarkType mismatch'
        );
        System.Assert.areEqual(
            remarks[1].Title,
            testObj.Remarks[1].Title,
            'Remarks[1].Title mismatch'
        );
        System.Assert.areEqual(
            remarks[1].RemarkType,
            testObj.Remarks[1].RemarkType,
            'Remarks[1].RemarkType mismatch'
        );
        System.Assert.areEqual(status, testObj.Status, 'Status mismatch');
    }

    /**
     * @description Negative test: parseParamAndResultFields with invalid data type
     * for `Contacts`. We expect a runtime casting issue.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParamAndResultBase.parseParamAndResultFields
     */
    @IsTest
    static void parseParamAndResultFieldsInvalidContacts() {
        Map<String, Object> rawMap = new Map<String, Object>{
            'Contacts' => 999 // Not a list => invalid
        };
        TestCaseParamAndResult testObj = new TestCaseParamAndResult();
        Boolean isExceptionThrown = false;
        String exceptionType = '';

        System.Test.startTest();
        try {
            testObj.parseParamAndResultFields(rawMap);
        } catch (Exception ex) {
            isExceptionThrown = true;
            exceptionType = ex.getTypeName();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected an exception for invalid Contacts data'
        );
        System.Assert.areEqual(
            'System.TypeException',
            exceptionType,
            'Expected a System.TypeException'
        );
    }

    /**
     * @description Positive test: writeParamAndResultFields with all fields set
     * verifies correct JSON output.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParamAndResultBase.writeParamAndResultFields
     */
    @IsTest
    static void writeParamAndResultFieldsValidData() {
        TestCaseParamAndResult testObj = new TestCaseParamAndResult();
        // Fields from AbstractCaseRoot
        testObj.Title = 'RootTitle';
        // Fields from AbstractCaseParamAndResultBase
        testObj.AccessGroup = 'AG-9999';
        testObj.eArchiveXMLFragment = 'SomeXMLFragment';
        testObj.Keywords = new List<String>{ 'kw1', 'kw2' };
        testObj.Notes = 'A note';
        testObj.Paragraph = 'A paragraph';
        testObj.ReferringCases = new List<String>{ 'CaseA', 'CaseB' };
        testObj.Remarks = new List<RemarkParameter>{
            new RemarkParameter(
                'remarkTitle1',
                'remarkContent1',
                'remarkType1'
            ),
            new RemarkParameter('remarkTitle2', 'remarkContent2', 'remarkType2')
        };
        testObj.Status = 'Closed';

        System.Test.startTest();
        String jsonOutput = testObj.toJson();
        System.Test.stopTest();

        Map<String, Object> parsed = (Map<String, Object>) JSON.deserializeUntyped(
            jsonOutput
        );

        System.Assert.areEqual(
            testObj.Title,
            (String) parsed.get('Title'),
            'Title mismatch in JSON'
        );
        System.Assert.areEqual(
            testObj.AccessGroup,
            (String) parsed.get('AccessGroup'),
            'AccessGroup mismatch in JSON'
        );
        System.Assert.areEqual(
            testObj.eArchiveXMLFragment,
            (String) parsed.get('eArchiveXMLFragment'),
            'eArchiveXMLFragment mismatch in JSON'
        );
        List<Object> keywordList = (List<Object>) parsed.get('Keywords');
        System.Assert.areEqual(
            testObj.Keywords.size(),
            keywordList.size(),
            'Keywords size mismatch in JSON'
        );
        System.Assert.areEqual(
            testObj.Keywords[0],
            (String) keywordList[0],
            'Keywords[0] mismatch'
        );
        System.Assert.areEqual(
            testObj.Keywords[1],
            (String) keywordList[1],
            'Keywords[1] mismatch'
        );
        System.Assert.areEqual(
            testObj.Notes,
            (String) parsed.get('Notes'),
            'Notes mismatch in JSON'
        );
        System.Assert.areEqual(
            testObj.Paragraph,
            (String) parsed.get('Paragraph'),
            'Paragraph mismatch in JSON'
        );
        List<Object> referringCasesList = (List<Object>) parsed.get(
            'ReferringCases'
        );
        System.Assert.areEqual(
            testObj.ReferringCases.size(),
            referringCasesList.size(),
            'ReferringCases size mismatch in JSON'
        );
        System.Assert.areEqual(
            testObj.ReferringCases[0],
            (String) referringCasesList[0],
            'ReferringCases[0] mismatch'
        );
        System.Assert.areEqual(
            testObj.ReferringCases[1],
            (String) referringCasesList[1],
            'ReferringCases[1] mismatch'
        );
        List<Object> remarksList = (List<Object>) parsed.get('Remarks');
        System.Assert.areEqual(
            testObj.Remarks.size(),
            remarksList.size(),
            'Remarks array size mismatch in JSON'
        );
        Map<String, Object> firstRemark = (Map<String, Object>) remarksList[0];
        System.Assert.areEqual(
            testObj.Remarks[0].Title,
            (String) firstRemark.get('Title'),
            'Remarks[0].Title mismatch'
        );
        Map<String, Object> secondRemark = (Map<String, Object>) remarksList[1];
        System.Assert.areEqual(
            testObj.Remarks[1].Title,
            (String) secondRemark.get('Title'),
            'Remarks[1].Title mismatch'
        );
        System.Assert.areEqual(
            testObj.Status,
            (String) parsed.get('Status'),
            'Status mismatch in JSON'
        );
    }

    /**
     * @description Negative test: parseParamAndResultFields with a null map.
     * We expect an exception or partial parse error.
     *
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParamAndResultBase.parseParamAndResultFields
     */
    @IsTest
    static void parseParamAndResultFieldsNullMap() {
        TestCaseParamAndResult testObj = new TestCaseParamAndResult();
        Boolean isExceptionThrown = false;
        String expectedMessage = 'Map cannot be null: The parseParamAndResultFields() method requires a non-null map.';
        String actualMessage = '';

        System.Test.startTest();
        try {
            testObj.parseParamAndResultFields(null);
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected an exception for null map input'
        );
        System.Assert.areEqual(
            expectedMessage,
            actualMessage,
            'Unexpected exception message'
        );
    }

    /**
     * @description Test: parseUniversalFields should assign an empty list when 'Contacts' is missing.
     * Covers the first Null Coalescing Operator (?? new List<Object>())
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParamAndResultBase.parseParamAndResultFields
     */
    @IsTest
    static void parseUniversalFieldsHandlesNullContacts() {
        Map<String, Object> rawMap = new Map<String, Object>{
            'Title' => 'Case Title'
        };

        TestCaseParamAndResult testObj = new TestCaseParamAndResult();

        System.Test.startTest();
        testObj.parseParamAndResultFields(rawMap);
        System.Test.stopTest();

        System.Assert.isNotNull(
            testObj.Contacts,
            'Contacts should not be null'
        );
        System.Assert.areEqual(
            0,
            testObj.Contacts.size(),
            'Contacts should be an empty list'
        );
    }

    /**
     * @description Test: parseUniversalFields should assign an empty list when 'Keywords' is missing.
     * Covers the first Null Coalescing Operator (?? new List<Object>())
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParamAndResultBase.parseParamAndResultFields
     */
    @IsTest
    static void parseUniversalFieldsHandlesNullKeywords() {
        Map<String, Object> rawMap = new Map<String, Object>{
            'Title' => 'Case Title'
        };

        TestCaseParamAndResult testObj = new TestCaseParamAndResult();

        System.Test.startTest();
        testObj.parseParamAndResultFields(rawMap);
        System.Test.stopTest();

        System.Assert.isNotNull(
            testObj.Keywords,
            'Keywords should not be null'
        );
        System.Assert.areEqual(
            0,
            testObj.Keywords.size(),
            'Keywords should be an empty list'
        );
    }

    /**
     * @description Test: parseUniversalFields should assign an empty list when 'ReferringCases' is missing.
     * Covers the first Null Coalescing Operator (?? new List<Object>())
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParamAndResultBase.parseParamAndResultFields
     */
    @IsTest
    static void parseUniversalFieldsHandlesNullReferringCases() {
        Map<String, Object> rawMap = new Map<String, Object>{
            'Title' => 'Case Title'
        };

        TestCaseParamAndResult testObj = new TestCaseParamAndResult();

        System.Test.startTest();
        testObj.parseParamAndResultFields(rawMap);
        System.Test.stopTest();

        System.Assert.isNotNull(
            testObj.ReferringCases,
            'ReferringCases should not be null'
        );
        System.Assert.areEqual(
            0,
            testObj.ReferringCases.size(),
            'ReferringCases should be an empty list'
        );
    }

    /**
     * @description Test: parseUniversalFields should assign an empty list when 'Remarks' is missing.
     * Covers the first Null Coalescing Operator (?? new List<Object>())
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseParamAndResultBase.parseParamAndResultFields
     */
    @IsTest
    static void parseUniversalFieldsHandlesNullRemarks() {
        Map<String, Object> rawMap = new Map<String, Object>{
            'Title' => 'Case Title'
        };

        TestCaseParamAndResult testObj = new TestCaseParamAndResult();

        System.Test.startTest();
        testObj.parseParamAndResultFields(rawMap);
        System.Test.stopTest();

        System.Assert.isNotNull(testObj.Remarks, 'Remarks should not be null');
        System.Assert.areEqual(
            0,
            testObj.Remarks.size(),
            'Remarks should be an empty list'
        );
    }
}
