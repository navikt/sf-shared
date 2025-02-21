/**
 * @description Test class for `AbstractCaseRoot` abstract class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see AbstractCaseRoot
 */
@IsTest
private class AbstractCaseRootTest {
    /**
     * @description Minimal subclass of AbstractCaseRoot for test instantiation.
     * Implements the abstract toJson() method so we can test parse/write logic.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseRoot
     */
    /*@SuppressWarnings('PMD.ApexDoc')
    private class TestCaseRoot extends AbstractCaseRoot {
        public TestCaseRoot() {
            super();
        }

        public override String toJson() {
            JsonHelper helper = new JsonHelper();
            helper.writeStartObject();
            super.writeUniversalFields(helper);
            helper.writeEndObject();
            return helper.getAsString();
        }
    }*/

    /**
     * @description Positive Test: parseUniversalFields with valid data,
     * verifies that fields are set correctly.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseRoot.parseUniversalFields
     */
    @IsTest
    static void parseUniversalFieldsValidData() {
        String title = 'Case Title';
        String unofficialTitle = 'Case Unofficial Title';
        String importedCaseNumber = '12345';
        String subArchive = 'SubArchName';
        ExternalIdParameter externalId = new ExternalIdParameter(
            'EXT-1',
            'SystemX'
        );
        List<ArchiveCodeParameter> archiveCodes = new List<ArchiveCodeParameter>{
            new ArchiveCodeParameter('recno:60001', 1)
        };

        P360TestDataFactory.TestCaseRoot initialCaseRootData = P360TestDataFactory.createCaseRootTestData();

        Map<String, Object> rawMap = new Map<String, Object>{
            'ArchiveCodes' => ArchiveCodeParameter.toMapList(
                initialCaseRootData.ArchiveCodes
            ),
            'ExternalId' => initialCaseRootData.ExternalId.toMap(),
            'ImportedCaseNumber' => initialCaseRootData.ImportedCaseNumber,
            'SubArchive' => initialCaseRootData.SubArchive,
            'Title' => initialCaseRootData.Title,
            'UnofficialTitle' => initialCaseRootData.UnofficialTitle
        };

        P360TestDataFactory.TestCaseRoot caseRoot = new P360TestDataFactory.TestCaseRoot();

        System.Test.startTest();
        caseRoot.parseUniversalFields(rawMap);
        System.Test.stopTest();

        System.Assert.areEqual(
            1,
            caseRoot.ArchiveCodes.size(),
            'ArchiveCodes size mismatch'
        );
        System.Assert.areEqual(
            archiveCodes[0].ArchiveType,
            caseRoot.ArchiveCodes[0].ArchiveType,
            'ArchiveType mismatch'
        );
        System.Assert.areEqual(
            initialCaseRootData.Title,
            root.Title,
            'Title mismatch'
        );
        System.Assert.areEqual(
            unofficialTitle,
            caseRoot.UnofficialTitle,
            'UnofficialTitle mismatch'
        );
        System.Assert.areEqual(
            importedCaseNumber,
            caseRoot.ImportedCaseNumber,
            'ImportedCaseNumber mismatch'
        );
        System.Assert.areEqual(
            subArchive,
            caseRoot.SubArchive,
            'SubArchive mismatch'
        );
        System.Assert.isNotNull(
            caseRoot.ExternalId,
            'ExternalId should not be null'
        );
        System.Assert.areEqual(
            externalId.Id,
            caseRoot.ExternalId.Id,
            'ExternalId.Id mismatch'
        );
        System.Assert.areEqual(
            externalId.Type,
            caseRoot.ExternalId.Type,
            'ExternalId.Type mismatch'
        );
    }

    /**
     * @description Negative Test: parseUniversalFields missing mandatory 'Title'.
     * Confirms that field is null if not provided. The base class doesn't throw
     * an error by itself, but this simulates a negative scenario.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseRoot.parseUniversalFields
     */
    @IsTest
    static void parseUniversalFieldsMissingTitle() {
        String title = null;
        String unofficialTitle = 'Case Unofficial Title';
        String importedCaseNumber = '12345';
        String subArchive = 'SubArchName';
        ExternalIdParameter externalId = new ExternalIdParameter(
            'EXT-1',
            'SystemX'
        );
        List<ArchiveCodeParameter> archiveCodes = new List<ArchiveCodeParameter>{
            new ArchiveCodeParameter('recno:60001', 1)
        };

        Map<String, Object> rawMap = new Map<String, Object>{
            'Title' => title,
            'UnofficialTitle' => unofficialTitle,
            'ImportedCaseNumber' => importedCaseNumber,
            'SubArchive' => subArchive,
            'ExternalId' => externalId.toMap(),
            'ArchiveCodes' => ArchiveCodeParameter.toMapList(archiveCodes)
        };

        TestCaseRoot root = new TestCaseRoot();

        System.Test.startTest();
        root.parseUniversalFields(rawMap);
        System.Test.stopTest();

        System.Assert.isNull(root.Title, 'Title should be null if missing');
        System.Assert.areEqual(
            unofficialTitle,
            root.UnofficialTitle,
            'UnofficialTitle mismatch'
        );
    }

    /**
     * @description Positive Test: writeUniversalFields with all fields set,
     * verifying correct JSON output.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseRoot.writeUniversalFields
     */
    @IsTest
    static void writeUniversalFieldsValidData() {
        // Arrange
        TestCaseRoot root = new TestCaseRoot();
        root.Title = 'Case Title';
        root.UnofficialTitle = 'UnofficialTitle';
        root.ImportedCaseNumber = 'C-1001';
        root.SubArchive = 'SubArchVal';
        root.ExternalId = new ExternalIdParameter('EXT-2', 'MySystem');
        root.ArchiveCodes = new List<ArchiveCodeParameter>{
            new ArchiveCodeParameter('recno:60002', 2)
        };

        System.Test.startTest();
        String actualJson = root.toJson(); // uses super.writeUniversalFields
        System.Test.stopTest();

        Map<String, Object> parsed = (Map<String, Object>) JSON.deserializeUntyped(
            actualJson
        );

        System.Assert.areEqual(
            root.Title,
            (String) parsed.get('Title'),
            'Title mismatch in JSON'
        );
        System.Assert.areEqual(
            root.UnofficialTitle,
            (String) parsed.get('UnofficialTitle'),
            'UnofficialTitle mismatch in JSON'
        );
        System.Assert.areEqual(
            root.ImportedCaseNumber,
            (String) parsed.get('ImportedCaseNumber'),
            'ImportedCaseNumber mismatch in JSON'
        );
        System.Assert.areEqual(
            root.SubArchive,
            (String) parsed.get('SubArchive'),
            'SubArchive mismatch in JSON'
        );

        Map<String, Object> extMap = (Map<String, Object>) parsed.get(
            'ExternalId'
        );
        System.Assert.areEqual(
            root.ExternalId.Id,
            (String) extMap.get('Id'),
            'ExternalId.Id mismatch in JSON'
        );
        System.Assert.areEqual(
            root.ExternalId.Type,
            (String) extMap.get('Type'),
            'ExternalId.Type mismatch in JSON'
        );

        List<Object> archArray = (List<Object>) parsed.get('ArchiveCodes');
        System.Assert.areEqual(
            1,
            archArray.size(),
            'ArchiveCodes array size mismatch'
        );
        Map<String, Object> archItem = (Map<String, Object>) archArray[0];
        System.Assert.areEqual(
            root.ArchiveCodes[0].ArchiveType,
            (String) archItem.get('ArchiveType'),
            'ArchiveType mismatch in JSON'
        );
        System.Assert.areEqual(
            root.ArchiveCodes[0].SortOrder,
            (Integer) archItem.get('Sort'),
            'Sort mismatch in JSON'
        );
    }

    /**
     * @description Negative Test: parseUniversalFields with a non-list for ArchiveCodes,
     * expecting an exception due to casting issues.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseRoot.parseUniversalFields
     */
    @IsTest
    static void writeUniversalFieldsInvalidArchiveCodesData() {
        Map<String, Object> rawMap = new Map<String, Object>{
            'Title' => 'Case Title',
            'ExternalId' => new ExternalIdParameter('EXT-1').toMap(),
            'ArchiveCodes' => 'recno:60001'
        };

        TestCaseRoot root = new TestCaseRoot();
        Boolean isExceptionThrown = false;

        System.Test.startTest();
        try {
            root.parseUniversalFields(rawMap);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected an exception when parsing non-list ArchiveCodes'
        );
    }

    /**
     * @description Negative test: parseUniversalFields with a null map
     * verifying an exception or error scenario.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseRoot.parseUniversalFields
     */
    @IsTest
    static void parseUniversalFieldsNullMap() {
        TestCaseRoot root = new TestCaseRoot();
        Boolean isExceptionThrown = false;
        String expectedMessage = 'Map cannot be null: The parseUniversalFields() method requires a non-null map.';
        String actualMessage = '';

        System.Test.startTest();
        try {
            root.parseUniversalFields(null);
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected an exception or error when rawMap is null'
        );
        System.Assert.areEqual(
            expectedMessage,
            actualMessage,
            'Unexpected exception message'
        );
    }

    /**
     * @description Test: parseUniversalFields should assign an empty list when 'ArchiveCodes' is missing.
     * Covers the first Null Coalescing Operator (?? new List<Object>())
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseRoot.parseUniversalFields
     */
    @IsTest
    static void parseUniversalFieldsHandlesNullArchiveCodes() {
        Map<String, Object> rawMap = new Map<String, Object>{
            'Title' => 'Case Title'
        };

        TestCaseRoot root = new TestCaseRoot();

        System.Test.startTest();
        root.parseUniversalFields(rawMap);
        System.Test.stopTest();

        System.Assert.isNotNull(
            root.ArchiveCodes,
            'ArchiveCodes should not be null'
        );
        System.Assert.areEqual(
            0,
            root.ArchiveCodes.size(),
            'ArchiveCodes should be an empty list'
        );
    }

    /**
     * @description Test: parseUniversalFields should assign an empty map when 'ExternalId' is missing.
     * Covers the second Null Coalescing Operator (?? new Map<String, Object>())
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see AbstractCaseRoot.parseUniversalFields
     */
    @IsTest
    static void parseUniversalFieldsHandlesNullExternalId() {
        Map<String, Object> rawMap = new Map<String, Object>{
            'Title' => 'Case Title'
        };

        TestCaseRoot root = new TestCaseRoot();

        System.Test.startTest();
        root.parseUniversalFields(rawMap);
        System.Test.stopTest();

        System.Assert.isNotNull(
            root.ExternalId,
            'ExternalId should not be null'
        );
        System.Assert.isNull(
            root.ExternalId.Id,
            'ExternalId.Id should be null'
        );
        System.Assert.isNull(
            root.ExternalId.Type,
            'ExternalId.Type should be null'
        );
    }
}
