/**
 * @description Test class for `ArchiveCodeParameter` class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, NAV
 * @since 0.1.0, December 2024
 * @group Public 360 Integration
 * @see ArchiveCodeParameter
 */
@IsTest(IsParallel=true)
private class ArchiveCodeParameterTest {
    /**
     * @description Test `constructor` with no parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorEmpty() {
        ArchiveCodeParameter archiveCodeParameterDataType;

        System.Test.startTest();
        archiveCodeParameterDataType = new ArchiveCodeParameter();
        System.Test.stopTest();

        System.Assert.isNull(
            archiveCodeParameterDataType.ArchiveType,
            'ArchiveType should be null'
        );
        System.Assert.isNull(
            archiveCodeParameterDataType.ArchiveCode,
            'ArchiveCode should be null'
        );
        System.Assert.isNull(
            archiveCodeParameterDataType.SortOrder,
            'SortOrder should be null'
        );
        System.Assert.isNull(
            archiveCodeParameterDataType.IsManualText,
            'IsManualText should be null'
        );
    }

    /**
     * @description Test `constructor` with two parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithTwoParameters() {
        ArchiveCodeParameter archiveCodeParameterDataType;
        String archiveType = 'Salesforce';
        Integer sortOrder = 1;

        System.Test.startTest();
        archiveCodeParameterDataType = new ArchiveCodeParameter(
            archiveType,
            sortOrder
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            archiveType,
            archiveCodeParameterDataType.ArchiveType,
            'ArchiveType fields should be equal'
        );
        System.Assert.areEqual(
            sortOrder,
            archiveCodeParameterDataType.SortOrder,
            'SortOrder fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with two parameters and expect an exception to be
     * thrown on `ArchiveType` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnArchiveType() {
        ArchiveCodeParameter archiveCodeParameterDataType;
        String archiveType = null;
        Integer sortOrder = 1;

        String expectedExceptionMessage = ArchiveCodeParameter.ARCHIVE_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            archiveCodeParameterDataType = new ArchiveCodeParameter(
                archiveType,
                sortOrder
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with two parameters and expect an exception to be
     * thrown on `SortOrder` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnSortOrder() {
        ArchiveCodeParameter archiveCodeParameterDataType;
        String archiveType = 'Salesforce';
        Integer sortOrder = null;

        String expectedExceptionMessage = ArchiveCodeParameter.SORT_ORDER_NULL_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            archiveCodeParameterDataType = new ArchiveCodeParameter(
                archiveType,
                sortOrder
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with two parameters and expect an exception to be
     * thrown on both `ArchiveType` and `SortOrder` fields because they are missing or set
     * to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnBothArchiveTypeAndSortOrder() {
        ArchiveCodeParameter archiveCodeParameterDataType;
        String archiveType = null;
        Integer sortOrder = null;

        String expectedExceptionMessage = ArchiveCodeParameter.ARCHIVE_TYPE_AND_SORT_ORDER_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            archiveCodeParameterDataType = new ArchiveCodeParameter(
                archiveType,
                sortOrder
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with four parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithFourParameters() {
        ArchiveCodeParameter archiveCodeParameterDataType;
        String archiveType = 'Salesforce';
        Integer sortOrder = 1;
        String archiveCode = '123';
        Boolean isManualText = true;

        System.Test.startTest();
        archiveCodeParameterDataType = new ArchiveCodeParameter(
            archiveType,
            sortOrder,
            archiveCode,
            isManualText
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            archiveType,
            archiveCodeParameterDataType.ArchiveType,
            'ArchiveType fields should be equal'
        );
        System.Assert.areEqual(
            sortOrder,
            archiveCodeParameterDataType.SortOrder,
            'SortOrder fields should be equal'
        );
        System.Assert.areEqual(
            archiveCode,
            archiveCodeParameterDataType.ArchiveCode,
            'ArchiveCode fields should be equal'
        );
        System.Assert.areEqual(
            isManualText,
            archiveCodeParameterDataType.IsManualText,
            'IsManualText fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with four parameters and expect an exception to be
     * thrown on `ArchiveType` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithFourParametersAndThrowExceptionOnArchiveType() {
        ArchiveCodeParameter archiveCodeParameterDataType;
        String archiveType = null;
        Integer sortOrder = 1;
        String archiveCode = '123';
        Boolean isManualText = true;

        String expectedExceptionMessage = ArchiveCodeParameter.ARCHIVE_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            archiveCodeParameterDataType = new ArchiveCodeParameter(
                archiveType,
                sortOrder,
                archiveCode,
                isManualText
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with four parameters and expect an exception to be
     * thrown on `SortOrder` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithFourParametersAndThrowExceptionOnSortOrder() {
        ArchiveCodeParameter archiveCodeParameterDataType;
        String archiveType = 'Salesforce';
        Integer sortOrder = null;
        String archiveCode = '123';
        Boolean isManualText = true;

        String expectedExceptionMessage = ArchiveCodeParameter.SORT_ORDER_NULL_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            archiveCodeParameterDataType = new ArchiveCodeParameter(
                archiveType,
                sortOrder,
                archiveCode,
                isManualText
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with four parameters and expect an exception to be
     * thrown on both `ArchiveType` and `SortOrder` fields because they are missing or set
     * to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithFourParametersAndThrowExceptionOnBothArchiveTypeAndSortOrder() {
        ArchiveCodeParameter archiveCodeParameterDataType;
        String archiveType = null;
        Integer sortOrder = null;
        String archiveCode = '123';
        Boolean isManualText = true;

        String expectedExceptionMessage = ArchiveCodeParameter.ARCHIVE_TYPE_AND_SORT_ORDER_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            archiveCodeParameterDataType = new ArchiveCodeParameter(
                archiveType,
                sortOrder,
                archiveCode,
                isManualText
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `toJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter.toJson
     */
    @IsTest
    static void toJson() {
        String archiveCode = '123';
        String archiveType = 'Salesforce';
        Integer sortOrder = 1;
        Boolean isManualText = true;

        String expectedJsonString = '{"ArchiveCode":"123","ArchiveType":"Salesforce","Sort":1,"IsManualText":true}';
        String actualJsonString;
        System.Test.startTest();
        ArchiveCodeParameter archiveCodeParameterDataType = new ArchiveCodeParameter(
            archiveType,
            sortOrder,
            archiveCode,
            isManualText
        );
        actualJsonString = archiveCodeParameterDataType.toJson();
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter.fromJson
     */
    @IsTest
    static void fromJson() {
        ArchiveCodeParameter deserializedArchiveCodeDataType;
        String archiveCode = '123';
        String archiveType = 'Salesforce';
        Integer sortOrder = 1;
        Boolean isManualText = true;

        ArchiveCodeParameter archiveCodeParameterDataType = new ArchiveCodeParameter(
            archiveType,
            sortOrder,
            archiveCode,
            isManualText
        );

        String jsonString = '{"ArchiveCode":"123","ArchiveType":"Salesforce","Sort":1,"IsManualText":true}';

        System.Test.startTest();
        deserializedArchiveCodeDataType = ArchiveCodeParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            archiveCodeParameterDataType.ArchiveCode,
            deserializedArchiveCodeDataType.ArchiveCode,
            'ArchiveCode fields should be equal'
        );
        System.Assert.areEqual(
            archiveCodeParameterDataType.ArchiveType,
            deserializedArchiveCodeDataType.ArchiveType,
            'ArchiveType fields should be equal'
        );
        System.Assert.areEqual(
            archiveCodeParameterDataType.SortOrder,
            deserializedArchiveCodeDataType.SortOrder,
            'SortOrder fields should be equal'
        );
        System.Assert.areEqual(
            archiveCodeParameterDataType.IsManualText,
            deserializedArchiveCodeDataType.IsManualText,
            'IsManualText fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter.fromJson
     */
    @IsTest
    static void fromJsonWithExtraChild() {
        ArchiveCodeParameter deserializedArchiveCodeDataType;
        String archiveCode = '123';
        String archiveType = 'Salesforce';
        Integer sortOrder = 1;
        Boolean isManualText = true;

        ArchiveCodeParameter archiveCodeParameterDataType = new ArchiveCodeParameter(
            archiveType,
            sortOrder,
            archiveCode,
            isManualText
        );

        String jsonString = '{"ArchiveCode":"123","ArchiveType":"Salesforce","Sort":1,"IsManualText":true, "ExtraChild": "Extra"}';

        System.Test.startTest();
        deserializedArchiveCodeDataType = ArchiveCodeParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            archiveCodeParameterDataType.ArchiveCode,
            deserializedArchiveCodeDataType.ArchiveCode,
            'ArchiveCode fields should be equal'
        );
        System.Assert.areEqual(
            archiveCodeParameterDataType.ArchiveType,
            deserializedArchiveCodeDataType.ArchiveType,
            'ArchiveType fields should be equal'
        );
        System.Assert.areEqual(
            archiveCodeParameterDataType.SortOrder,
            deserializedArchiveCodeDataType.SortOrder,
            'SortOrder fields should be equal'
        );
        System.Assert.areEqual(
            archiveCodeParameterDataType.IsManualText,
            deserializedArchiveCodeDataType.IsManualText,
            'IsManualText fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with malformed JSON and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, January 2025
     * @see ArchiveCodeParameter.fromJson
     */
    @isTest
    static void fromJsonAndThrowExceptionOnMalformedJson() {
        String jsonString = '{"ArchiveCode":"123","ArchiveType":"Salesforce","Sort":1,"IsManualText":true, "MalformedJson"}';

        String actualExceptionType = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            ArchiveCodeParameter.fromJson(jsonString);
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionType = ex.getTypeName();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            'System.JSONException',
            actualExceptionType,
            'Expected exception type should be equal to actual exception type.'
        );
    }

    /**
     * @description Test `validate` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter.validate
     */
    @IsTest
    static void validate() {
        ArchiveCodeParameter archiveCodeParameterDataType = new ArchiveCodeParameter();
        archiveCodeParameterDataType.ArchiveType = 'Salesforce';
        archiveCodeParameterDataType.SortOrder = 1;

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            archiveCodeParameterDataType.validate();
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.Assert.isFalse(
            isExceptionThrown,
            'Expected to have a no exception thrown.'
        );
    }

    /**
     * @description Test `validate` method with missing `ArchiveType` field and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnArchiveType() {
        ArchiveCodeParameter archiveCodeParameterDataType = new ArchiveCodeParameter();
        archiveCodeParameterDataType.ArchiveType = null;
        archiveCodeParameterDataType.SortOrder = 1;

        String expectedExceptionMessage = ArchiveCodeParameter.ARCHIVE_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            archiveCodeParameterDataType.validate();
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `validate` method with missing `SortOrder` field and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnSortOrder() {
        ArchiveCodeParameter archiveCodeParameterDataType = new ArchiveCodeParameter();
        archiveCodeParameterDataType.ArchiveType = 'salesforce';
        archiveCodeParameterDataType.SortOrder = null;

        String expectedExceptionMessage = ArchiveCodeParameter.SORT_ORDER_NULL_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            archiveCodeParameterDataType.validate();
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `validate` method with missing `ArchiveType` and `SortOrder` fields
     * and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnBothArchiveTypeAndSortOrder() {
        ArchiveCodeParameter archiveCodeParameterDataType = new ArchiveCodeParameter();
        archiveCodeParameterDataType.ArchiveType = null;
        archiveCodeParameterDataType.SortOrder = null;

        String expectedExceptionMessage = ArchiveCodeParameter.ARCHIVE_TYPE_AND_SORT_ORDER_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            archiveCodeParameterDataType.validate();
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }
}
