/**
 * @description Test class for `ExternalIdParameter` class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, December 2024
 * @group Public 360 Integration
 * @see ExternalIdParameter
 */
@isTest(IsParallel=true)
private class ExternalIdParameterTest {
    /**
     * @description Test `constructor` with no parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter
     */
    @IsTest
    static void constructorEmpty() {
        ExternalIdParameter externalIdParameterDataType;

        System.Test.startTest();
        externalIdParameterDataType = new ExternalIdParameter();
        System.Test.stopTest();

        System.Assert.isNull(
            externalIdParameterDataType.Id,
            'Id should be null'
        );
        System.Assert.isNull(
            externalIdParameterDataType.Type,
            'Type should be null'
        );
    }

    /**
     * @description Test `constructor` with one parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter
     */
    @IsTest
    static void constructorWithOneParameters() {
        ExternalIdParameter externalIdParameterDataType;
        String id = 'External-ID-123';

        System.Test.startTest();
        externalIdParameterDataType = new ExternalIdParameter(id);
        System.Test.stopTest();

        System.Assert.areEqual(
            id,
            externalIdParameterDataType.Id,
            'Id fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with one parameters and expect an exception to be
     * thrown on `Id` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter
     */
    @IsTest
    static void constructorWithOneParametersAndThrowExceptionOnId() {
        ExternalIdParameter externalIdParameterDataType;
        String id = null;

        String expectedExceptionMessage = ExternalIdParameter.ID_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            externalIdParameterDataType = new ExternalIdParameter(id);
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
     * @description Test `constructor` with two parameter.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter
     */
    @IsTest
    static void constructorWithTwoParameters() {
        ExternalIdParameter externalIdParameterDataType;
        String id = 'External-ID-123';
        String type = 'Salesforce';

        System.Test.startTest();
        externalIdParameterDataType = new ExternalIdParameter(id, type);
        System.Test.stopTest();

        System.Assert.areEqual(
            id,
            externalIdParameterDataType.Id,
            'Id fields should be equal'
        );
        System.Assert.areEqual(
            type,
            externalIdParameterDataType.Type,
            'Type fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with two parameters and expect an exception to be
     * thrown on `Id` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnId() {
        ExternalIdParameter externalIdParameterDataType;
        String id = null;
        String type = 'Salesforce';

        String expectedExceptionMessage = ExternalIdParameter.ID_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            externalIdParameterDataType = new ExternalIdParameter(id, type);
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter.toJson
     */
    @isTest
    static void toJson() {
        String id = '123';
        String type = 'Salesforce';

        String expectedJsonString = '{"Id":"123","Type":"Salesforce"}';
        String actualJsonString;
        System.Test.startTest();
        ExternalIdParameter externalIdParameterDataType = new ExternalIdParameter(
            id,
            type
        );
        actualJsonString = externalIdParameterDataType.toJson();
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
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter.fromJson
     */
    @isTest
    static void fromJson() {
        ExternalIdParameter deserializedExternalIdParameterDataType;
        String id = '123';
        String type = 'Salesforce';

        ExternalIdParameter externalIdParameterDataType = new ExternalIdParameter(
            id,
            type
        );

        String jsonString = '{"Id":"123","Type":"Salesforce"}';

        System.Test.startTest();
        deserializedExternalIdParameterDataType = ExternalIdParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.assertEquals(
            externalIdParameterDataType.Id,
            deserializedExternalIdParameterDataType.Id,
            'Id fields should be equal'
        );
        System.assertEquals(
            externalIdParameterDataType.Type,
            deserializedExternalIdParameterDataType.Type,
            'Type fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter.fromJson
     */
    @isTest
    static void fromJsonWithExtraChild() {
        ExternalIdParameter deserializedExternalIdParameterDataType;
        String id = '123';
        String type = 'Salesforce';

        ExternalIdParameter externalIdParameterDataType = new ExternalIdParameter(
            id,
            type
        );

        String jsonString = '{"Id":"123","Type":"Salesforce", "ExtraChild": "Extra"}';

        System.Test.startTest();
        deserializedExternalIdParameterDataType = ExternalIdParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.assertEquals(
            externalIdParameterDataType.Id,
            deserializedExternalIdParameterDataType.Id,
            'Id fields should be equal'
        );
        System.assertEquals(
            externalIdParameterDataType.Type,
            deserializedExternalIdParameterDataType.Type,
            'Type fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with malformed JSON and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ExternalIdParameter.fromJson
     */
    @isTest
    static void fromJsonAndThrowExceptionOnMalformedJson() {
        String jsonString = '{"Id":"123","Type":"Salesforce", "MalformedJson"}';

        String actualExceptionType = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            ExternalIdParameter.fromJson(jsonString);
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter.validate
     */
    @IsTest
    static void validate() {
        ExternalIdParameter externalIdParameterDataType = new ExternalIdParameter();
        externalIdParameterDataType.Id = 'External-ID-123';

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            externalIdParameterDataType.validate();
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
     * @description Test `validate` method with missing `Id` field and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnId() {
        ExternalIdParameter externalIdParameterDataType = new ExternalIdParameter();
        externalIdParameterDataType.Id = null;

        String expectedExceptionMessage = ExternalIdParameter.ID_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            externalIdParameterDataType.validate();
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
