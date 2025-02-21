/**
 * @description Test Data factory for Public 360 integration.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 */
@isTest
public class P360TestDataFactory {
    /**
     * @description Creates a test data instance of the `CreateCaseParameter` class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return `CreateCaseParameter` The test data instance.
     */
    public static TestCaseRoot createCaseRootTestData() {
        TestCaseRoot caseRoot = new TestCaseRoot();
        caseRoot.ArchiveCodes = createArchiveCodeParameterTestData(1);
        caseRoot.ExternalId = createExternalIdParameterTestData(1)[0];
        caseRoot.ImportedCaseNumber = '12345';
        caseRoot.SubArchive = 'SubArchName';
        caseRoot.Title = 'Case Title';
        caseRoot.UnofficialTitle = 'Case Unofficial Title';
        return caseRoot;
    }

    /**
     * @description Creates a test data instance of the `ArchiveCodeParameter` class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param count The number of test data instances to create.
     * @return `List<ArchiveCodeParameter>` The list of test data instances.
     */
    public static List<ArchiveCodeParameter> createArchiveCodeParameterTestData(
        Integer count
    ) {
        List<ArchiveCodeParameter> archiveCodeParameters = new List<ArchiveCodeParameter>();
        Integer recNumber = 60001;
        for (Integer i = 0; i < count; i++) {
            archiveCodeParameters.add(
                new ArchiveCodeParameter('recno:' + recNumber, i)
            );
            recNumber++;
        }
        return archiveCodeParameters;
    }

    /**
     * @description Creates a test data instance of the `ContactParameter` class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param count The number of test data instances to create.
     * @return `List<ContactParameter>` The list of test data instances.
     */
    public static List<ContactParameter> createContactParameterTestData(
        Integer count
    ) {
        List<ContactParameter> contactParameters = new List<ContactParameter>();
        for (Integer i = 0; i < count; i++) {
            contactParameters.add(
                new ContactParameter('RefNo-' + i, 'Test Role')
            );
        }
        return contactParameters;
    }

    /**
     * @description Creates a test data instance of the `EstateParameter` class.
     *
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param count The number of test data instances to create.
     * @return `List<EstateParameter>` The list of test data instances.
     */
    public static List<ExternalIdParameter> createExternalIdParameterTestData(
        Integer count
    ) {
        List<ExternalIdParameter> externalIdParameters = new List<ExternalIdParameter>();
        for (Integer i = 0; i < count; i++) {
            externalIdParameters.add(
                new ExternalIdParameter('EXT-' + i, 'Salesforce')
            );
        }
        return externalIdParameters;
    }

    /**
     * @description Test Case Root class extending the `AbstractCaseRoot` class.
     * This class is used for testing purposes only.
     *
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @group Public 360 Integration
     */
    public class TestCaseRoot extends AbstractCaseRoot {
        /**
         * @description Constructor for the `TestCaseRoot` class.
         *
         *
         * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
         * @since 0.1.0, February 2025
         */
        public TestCaseRoot() {
            super();
        }

        /**
         * @description
         *
         * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
         * @since 0.1.0, February 2025
         * @return String The JSON representation of the object.
         */
        public override String toJson() {
            JsonHelper helper = new JsonHelper();
            helper.writeStartObject();
            super.writeUniversalFields(helper);
            helper.writeEndObject();
            return helper.getAsString();
        }
    }
}
