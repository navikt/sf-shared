/**
 * @description Test class for `ExternalIdParameter` class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, NAV
 * @since 0.1.0, December 2024
 * @group Public 360 Integration
 * @see ExternalIdParameter
 */
@isTest
private class ExternalIdParameterTest {
    /**
     * @description Test `constructor` with no parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter
     */
    @IsTest
    static void constructorEmpty() {
        ExternalIdParameter externalIdParameterDataType;

        System.Test.startTest();
        System.runAs(P360TestUtility.minimumAccessAPIOnlyIntegrations()) {
            externalIdParameterDataType = new ExternalIdParameter();
        }
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter
     */
    @IsTest
    static void constructorWithOneParameters() {
        ExternalIdParameter externalIdParameterDataType;
        String id = 'External-ID-123';

        System.Test.startTest();
        System.runAs(P360TestUtility.minimumAccessAPIOnlyIntegrations()) {
            externalIdParameterDataType = new ExternalIdParameter(id);
        }
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter
     */
    @IsTest
    static void constructorWithOneParametersAndThrowExceptionOnId() {
        ExternalIdParameter externalIdParameterDataType;
        String id = null;

        String expectedExceptionMessage = 'The Id field is mandatory.';
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        System.runAs(P360TestUtility.minimumAccessAPIOnlyIntegrations()) {
            try {
                externalIdParameterDataType = new ExternalIdParameter(id);
            } catch (Exception ex) {
                isExceptionThrown = true;
                actualExceptionMessage = ex.getMessage();
            }
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter
     */
    @IsTest
    static void constructorWithTwoParameters() {
        ExternalIdParameter externalIdParameterDataType;
        String id = 'External-ID-123';
        String type = 'Salesforce';

        System.Test.startTest();
        System.runAs(P360TestUtility.minimumAccessAPIOnlyIntegrations()) {
            externalIdParameterDataType = new ExternalIdParameter(id, type);
        }
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnId() {
        ExternalIdParameter externalIdParameterDataType;
        String id = null;
        String type = 'Salesforce';

        String expectedExceptionMessage = 'The Id field is mandatory.';
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        System.runAs(P360TestUtility.minimumAccessAPIOnlyIntegrations()) {
            try {
                externalIdParameterDataType = new ExternalIdParameter(id, type);
            } catch (Exception ex) {
                isExceptionThrown = true;
                actualExceptionMessage = ex.getMessage();
            }
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
     * @see ExternalIdParameter.toJson
     */
    @isTest
    static void toJson() {
        ExternalIdParameter externalIdParameterDataType = new ExternalIdParameter();
        externalIdParameterDataType.Id = '123';
        externalIdParameterDataType.Type = 'Salesforce';

        String jsonString = '{"Id":"123","Type":"Salesforce"}';

        System.Assert.areEqual(
            jsonString,
            externalIdParameterDataType.toJson(),
            'toJson should return a JSON string representation of the object.'
        );
    }

    /**
     * @description Test `fromJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter.fromJson
     */
    @isTest
    static void fromJson() {
        ExternalIdParameter externalIdParameterDataType = new ExternalIdParameter();
        externalIdParameterDataType.Id = '123';
        externalIdParameterDataType.Type = 'Salesforce';

        String jsonString = '{"Id":"123","Type":"Salesforce"}';
        ExternalIdParameter deserializedExternalIdParameterDataType = ExternalIdParameter.fromJson(
            jsonString
        );

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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter.fromJson
     */
    @isTest
    static void fromJsonWithExtraChild() {
        ExternalIdParameter externalIdParameterDataType = new ExternalIdParameter();
        externalIdParameterDataType.Id = '123';
        externalIdParameterDataType.Type = 'Salesforce';

        String jsonString = '{"Id":"123","Type":"Salesforce", "ExtraChild": "Extra"}';
        ExternalIdParameter deserializedExternalIdParameterDataType = ExternalIdParameter.fromJson(
            jsonString
        );

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
     * @description Test `validate` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter.validate
     */
    @IsTest
    static void validate() {
        String id = 'External-ID-123';

        ExternalIdParameter externalIdParameterDataType = new ExternalIdParameter(
            id
        );

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        System.runAs(P360TestUtility.minimumAccessAPIOnlyIntegrations()) {
            try {
                externalIdParameterDataType.validate();
            } catch (Exception ex) {
                isExceptionThrown = true;
            }
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnId() {
        ExternalIdParameter externalIdParameterDataType = new ExternalIdParameter();
        externalIdParameterDataType.Id = null;

        String expectedExceptionMessage = 'The Id field is mandatory.';
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        System.runAs(P360TestUtility.minimumAccessAPIOnlyIntegrations()) {
            try {
                externalIdParameterDataType.validate();
            } catch (Exception ex) {
                isExceptionThrown = true;
                actualExceptionMessage = ex.getMessage();
            }
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
