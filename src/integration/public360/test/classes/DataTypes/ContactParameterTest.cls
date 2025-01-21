/**
 * @description Test class for `ContactParameter` class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, January 2025
 * @group Public 360 Integration
 * @see ContactParameter
 */
@IsTest(IsParallel=true)
private class ContactParameterTest {
    /**
     * @description Test `constructor` with no parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter
     */
    @IsTest
    static void constructorEmpty() {
        ContactParameter contactParameterDataType;

        System.Test.startTest();
        contactParameterDataType = new ContactParameter();
        System.Test.stopTest();

        System.Assert.isNull(
            contactParameterDataType.ReferenceNumber,
            'ReferenceNumber should be null'
        );
        System.Assert.isNull(
            contactParameterDataType.ExternalId,
            'ExternalId should be null'
        );
        System.Assert.isNull(
            contactParameterDataType.Role,
            'Role should be null'
        );
        System.Assert.isNull(
            contactParameterDataType.IsUnofficial,
            'IsUnofficial should be null'
        );
    }

    /**
     * @description Test `constructor` with two parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter
     */
    @IsTest
    static void constructorWithTwoParameters() {
        ContactParameter contactParameterDataType;
        String referenceNumber = '12345678900';
        String role = 'Sakspart';

        System.Test.startTest();
        contactParameterDataType = new ContactParameter(referenceNumber, role);
        System.Test.stopTest();

        System.Assert.areEqual(
            referenceNumber,
            contactParameterDataType.ReferenceNumber,
            'ReferenceNumber fields should be equal'
        );
        System.Assert.areEqual(
            role,
            contactParameterDataType.Role,
            'Role fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with two parameters and expect an exception to be
     * thrown on `ReferenceNumber` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnReferenceNumber() {
        String referenceNumber = null;
        String role = 'Sakspart';

        String expectedExceptionMessage = ContactParameter.REFERENCE_NUMBER_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ContactParameter(referenceNumber, role);
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
     * thrown on `Role` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnRole() {
        String referenceNumber = '12345678900';
        String role = null;

        String expectedExceptionMessage = ContactParameter.ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ContactParameter(referenceNumber, role);
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
     * thrown on both `ReferenceNumber` and `Role` fields because they are missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnReferenceNumberAndRole() {
        String referenceNumber = null;
        String role = null;

        String expectedExceptionMessage = ContactParameter.REFERENCE_NUMBER_AND_ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ContactParameter(referenceNumber, role);
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
     * @description Test `constructor` with three parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter
     */
    @IsTest
    static void constructorWithThreeParameters() {
        ContactParameter contactParameterDataType;
        String referenceNumber = '12345678900';
        String role = 'Sakspart';
        Boolean isUnofficial = true;

        System.Test.startTest();
        contactParameterDataType = new ContactParameter(
            referenceNumber,
            role,
            isUnofficial
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            referenceNumber,
            contactParameterDataType.ReferenceNumber,
            'ReferenceNumber fields should be equal'
        );
        System.Assert.areEqual(
            role,
            contactParameterDataType.Role,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            isUnofficial,
            contactParameterDataType.IsUnofficial,
            'IsUnofficial fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with three parameters and expect an exception to be
     * thrown on `ReferenceNumber` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter
     */
    @IsTest
    static void constructorWithThreeParametersAndThrowExceptionOnReferenceNumber() {
        String referenceNumber = null;
        String role = 'Sakspart';
        Boolean isUnofficial = true;

        String expectedExceptionMessage = ContactParameter.REFERENCE_NUMBER_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ContactParameter(referenceNumber, role, isUnofficial);
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
     * @description Test `constructor` with three parameters and expect an exception to be
     * thrown on `Role` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter
     */
    @IsTest
    static void constructorWithThreeParametersAndThrowExceptionOnRole() {
        String referenceNumber = '12345678900';
        String role = null;
        Boolean isUnofficial = true;

        String expectedExceptionMessage = ContactParameter.ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ContactParameter(referenceNumber, role, isUnofficial);
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
     * @description Test `constructor` with three parameters and expect an exception to be
     * thrown on `ReferenceNumber` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter
     */
    @IsTest
    static void constructorWithThreeParametersAndThrowExceptionOnReferenceNumberAndRole() {
        String referenceNumber = null;
        String role = null;
        Boolean isUnofficial = true;

        String expectedExceptionMessage = ContactParameter.REFERENCE_NUMBER_AND_ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ContactParameter(referenceNumber, role, isUnofficial);
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
     * @since 0.1.0, January 2025
     * @see ContactParameter.toJson
     */
    @IsTest
    static void toJson() {
        String referenceNumber = '12345678900';
        String externalId = '12345678900';
        String role = 'Sakspart';
        Boolean isUnofficial = true;

        String expectedJsonString = '{"ReferenceNumber":"12345678900","ExternalId":"12345678900","Role":"Sakspart","IsUnofficial":true}';
        String actualJsonString;
        System.Test.startTest();
        ContactParameter contactParameterDataType = new ContactParameter(
            referenceNumber,
            role,
            isUnofficial
        );
        contactParameterDataType.ExternalId = externalId;
        actualJsonString = contactParameterDataType.toJson();
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
     * @since 0.1.0, January 2025
     * @see ContactParameter.fromJson
     */
    @IsTest
    static void fromJson() {
        ContactParameter deserializedContactDataType;
        String referenceNumber = '12345678900';
        String role = 'Sakspart';
        Boolean isUnofficial = true;

        ContactParameter contactParameterDataType = new ContactParameter(
            referenceNumber,
            role,
            isUnofficial
        );

        String jsonString = '{"ReferenceNumber":"12345678900","Role":"Sakspart","IsUnofficial":true}';

        System.Test.startTest();
        deserializedContactDataType = ContactParameter.fromJson(jsonString);
        System.Test.stopTest();

        System.Assert.areEqual(
            contactParameterDataType.ReferenceNumber,
            deserializedContactDataType.ReferenceNumber,
            'ReferenceNumber fields should be equal'
        );
        System.Assert.areEqual(
            contactParameterDataType.Role,
            deserializedContactDataType.Role,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            contactParameterDataType.IsUnofficial,
            deserializedContactDataType.IsUnofficial,
            'IsUnofficial fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter.fromJson
     */
    @IsTest
    static void fromJsonWithExtraChild() {
        ContactParameter deserializedContactDataType;
        String referenceNumber = '12345678900';
        String role = 'Sakspart';
        Boolean isUnofficial = true;

        ContactParameter contactParameterDataType = new ContactParameter(
            referenceNumber,
            role,
            isUnofficial
        );

        String jsonString = '{"ReferenceNumber":"12345678900","Role":"Sakspart","IsUnofficial":true, "ExtraChild": "Extra"}';

        System.Test.startTest();
        deserializedContactDataType = ContactParameter.fromJson(jsonString);
        System.Test.stopTest();

        System.Assert.areEqual(
            contactParameterDataType.ReferenceNumber,
            deserializedContactDataType.ReferenceNumber,
            'ReferenceNumber fields should be equal'
        );
        System.Assert.areEqual(
            contactParameterDataType.Role,
            deserializedContactDataType.Role,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            contactParameterDataType.IsUnofficial,
            deserializedContactDataType.IsUnofficial,
            'IsUnofficial fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with malformed JSON and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter.fromJson
     */
    @IsTest
    static void fromJsonAndThrowExceptionOnMalformedJson() {
        String jsonString = '{"ReferenceNumber":"12345678900","Role":"Sakspart","IsUnofficial":true, "MalformedJson"}';

        String actualExceptionType = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            ContactParameter.fromJson(jsonString);
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
     * @since 0.1.0, January 2025
     * @see ContactParameter.validate
     */
    @IsTest
    static void validate() {
        ContactParameter contactParameterDataType = new ContactParameter();
        contactParameterDataType.ReferenceNumber = '12345678900';
        contactParameterDataType.Role = 'Sakspart';

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            contactParameterDataType.validate();
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
     * @description Test `validate` method with missing `ReferenceNumber` field and expect an
     * exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnReferenceNumber() {
        ContactParameter contactParameterDataType = new ContactParameter();
        contactParameterDataType.ReferenceNumber = null;
        contactParameterDataType.Role = 'Sakspart';

        String expectedExceptionMessage = ContactParameter.REFERENCE_NUMBER_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            contactParameterDataType.validate();
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
     * @description Test `validate` method with missing `Role` field and expect an exception to be
     * thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnRole() {
        ContactParameter contactParameterDataType = new ContactParameter();
        contactParameterDataType.ReferenceNumber = '12345678900';
        contactParameterDataType.Role = null;

        String expectedExceptionMessage = ContactParameter.ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            contactParameterDataType.validate();
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
     * @description Test `validate` method with missing `ReferenceNumber` and `Role` fields
     * and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnReferenceNumberAndRole() {
        ContactParameter contactParameterDataType = new ContactParameter();
        contactParameterDataType.ReferenceNumber = null;
        contactParameterDataType.Role = null;

        String expectedExceptionMessage = ContactParameter.REFERENCE_NUMBER_AND_ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            contactParameterDataType.validate();
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
