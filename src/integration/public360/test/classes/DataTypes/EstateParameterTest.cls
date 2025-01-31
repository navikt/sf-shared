/**
 * @description Test class for `UnregisteredContactsParameterTest` class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, January 2025
 * @group Public 360 Integration
 * @see UnregisteredContactsParameterTest
 */
@IsTest(IsParallel=true)
private class EstateParameterTest {
    /**
     * @description Test `constructor` with no parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter
     */
    @IsTest
    static void constructorEmpty() {
        EstateParameter estateParameterDataType;

        System.Test.startTest();
        estateParameterDataType = new EstateParameter();
        System.Test.stopTest();

        System.Assert.isNull(
            estateParameterDataType.Recno,
            'Recno should be null'
        );
        System.Assert.isNull(
            estateParameterDataType.ExternalId,
            'ExternalId should be null'
        );
    }

    /**
     * @description Test `constructor` with mandatory fields as parameters.
     * You can only have one of the fields set, not both. If both fields are set, an exception will
     * be thrown. In this test the `Recno` field is set and the `ExternalId` field is not set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter
     */
    @IsTest
    static void constructorWithMandatoryFieldsAsParametersWhereRecnoIsSetAndExternalIdNotSet() {
        EstateParameter estateParameterDataType;
        String recno = 'recno:1234';
        String externalId = '';

        System.Test.startTest();
        estateParameterDataType = new EstateParameter(recno, externalId);
        System.Test.stopTest();

        System.Assert.areEqual(
            recno,
            estateParameterDataType.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            externalId,
            estateParameterDataType.ExternalId,
            'ExternalId fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with mandatory fields as parameters.
     * You can only have one of the fields set, not both. If both fields are set, an exception will
     * be thrown. In this test the `ExternalId` field is set and the `Recno` field is not set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter
     */
    @IsTest
    static void constructorWithMandatoryFieldsAsParametersWhereExternalIdIsSetAndRecnoNotSet() {
        EstateParameter estateParameterDataType;
        String recno = '';
        String externalId = 'externalId1234';

        System.Test.startTest();
        estateParameterDataType = new EstateParameter(recno, externalId);
        System.Test.stopTest();

        System.Assert.areEqual(
            recno,
            estateParameterDataType.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            externalId,
            estateParameterDataType.ExternalId,
            'ExternalId fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with mandatory fields as parameters and expect an exception to be
     * thrown because it is missing or set to `null` fields.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter
     */
    @IsTest
    static void constructorWithMandatoryFieldsAsParametersAndThrowException() {
        String recno = null;
        String externalId = null;

        String expectedExceptionMessage = EstateParameter.RECNO_AND_EXTERNAL_ID_BOTH_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new EstateParameter(recno, externalId);
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
     * @description Test `constructor` with mandatory fields as parameters and expect an exception to be
     * thrown on `Recno` field because it is missing or set to `null` fields.
     * Prerequisite: `ExternalId` field is set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter
     */
    @IsTest
    static void constructorWithMandatoryFieldsAsParametersAndNoThrownExceptionOnRecno() {
        String recno = null;
        String externalId = 'externalId1234';

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new EstateParameter(recno, externalId);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.Assert.isFalse(
            isExceptionThrown,
            'Expected to have none exception thrown.'
        );
    }

    /**
     * @description Test `constructor` with mandatory fields as parameters and expect an exception to be
     * thrown on `ExternalId` field because it is missing or set to `null` fields.
     * Prerequisite: `Recno` field is set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter
     */
    @IsTest
    static void constructorWithMandatoryFieldsAsParametersAndNoThrownExceptionOnExternalId() {
        String recno = 'recno:1234';
        String externalId = null;

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new EstateParameter(recno, externalId);
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.Assert.isFalse(
            isExceptionThrown,
            'Expected to have none exception thrown.'
        );
    }

    /**
     * @description Test `toJson` method. The `Recno` field is set and the `ExternalId` field is not
     * set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.toJson
     */
    @IsTest
    static void toJsonWithRecnoSetAndExternalIdNotSet() {
        String recno = 'recno:1234';
        String externalId = '';

        String expectedJsonString =
            '{"Recno":"' +
            recno +
            '","ExternalId":"' +
            externalId +
            '"}';
        String actualJsonString;
        System.Test.startTest();
        EstateParameter estateParameterDataType = new EstateParameter(
            recno,
            externalId
        );
        estateParameterDataType.ExternalId = externalId;
        actualJsonString = estateParameterDataType.toJson();
        System.Test.stopTest();

        System.Assert.areEqual(
            expectedJsonString,
            actualJsonString,
            'toJson should return a JSON string representation of the object.'
        );
    }

    /**
     * @description Test `toJson` method. The `ExternalId` field is set and the `Recno` field is not
     * set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.toJson
     */
    @IsTest
    static void toJsonWithExternalIdSetAndRecnoNotSet() {
        String recno = '';
        String externalId = 'externalId1234';

        String expectedJsonString =
            '{"Recno":"' +
            recno +
            '","ExternalId":"' +
            externalId +
            '"}';
        String actualJsonString;
        System.Test.startTest();
        EstateParameter estateParameterDataType = new EstateParameter(
            recno,
            externalId
        );
        estateParameterDataType.ExternalId = externalId;
        actualJsonString = estateParameterDataType.toJson();
        System.Test.stopTest();

        System.Assert.areEqual(
            expectedJsonString,
            actualJsonString,
            'toJson should return a JSON string representation of the object.'
        );
    }

    /**
     * @description Test `fromJson` method. The `Recno` field is set and the `ExternalId` field is
     * not set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.fromJson
     */
    @IsTest
    static void fromJsonWithRecnoSetAndExternalIdNotSet() {
        String recno = 'recno:1234';
        String externalId = '';

        EstateParameter estateParameterDataType = new EstateParameter(
            recno,
            externalId
        );

        String jsonString =
            '{"Recno":"' +
            recno +
            '","ExternalId":"' +
            externalId +
            '"}';

        System.Test.startTest();
        EstateParameter deserializedEstateParameterDataType = EstateParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            estateParameterDataType.Recno,
            deserializedEstateParameterDataType.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            estateParameterDataType.ExternalId,
            deserializedEstateParameterDataType.ExternalId,
            'ExternalId fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method. The `ExternalId` field is set and the `Recno` field is
     * not set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.fromJson
     */
    @IsTest
    static void fromJsonWithExternalIdSetAndRecnoNotSet() {
        String recno = '';
        String externalId = 'externalId1234';

        EstateParameter estateParameterDataType = new EstateParameter(
            recno,
            externalId
        );

        String jsonString =
            '{"Recno":"' +
            recno +
            '","ExternalId":"' +
            externalId +
            '"}';

        System.Test.startTest();
        EstateParameter deserializedEstateParameterDataType = EstateParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            estateParameterDataType.Recno,
            deserializedEstateParameterDataType.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            estateParameterDataType.ExternalId,
            deserializedEstateParameterDataType.ExternalId,
            'ExternalId fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.fromJson
     */
    @IsTest
    static void fromJsonWithExtraChild() {
        String recno = '';
        String externalId = 'externalId1234';

        EstateParameter estateParameterDataType = new EstateParameter(
            recno,
            externalId
        );

        String jsonString =
            '{"Recno":"' +
            recno +
            '","ExternalId":"' +
            externalId +
            '","ExtraChild": "Extra"}';

        System.Test.startTest();
        EstateParameter deserializedEstateParameterDataType = EstateParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areNotEqual(
            null,
            deserializedEstateParameterDataType,
            'Deserialized object should not be null and should still get a valid EstateParameter object even with extra fields.'
        );
        System.Assert.areEqual(
            estateParameterDataType.Recno,
            deserializedEstateParameterDataType.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            estateParameterDataType.ExternalId,
            deserializedEstateParameterDataType.ExternalId,
            'ExternalId fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with malformed JSON and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.fromJson
     */
    @IsTest
    static void fromJsonAndThrowExceptionOnMalformedJson() {
        String jsonString = '{"Recno":"","ExternalId":"externalId1234", "MalformedJson"}';

        String actualExceptionType = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            EstateParameter.fromJson(jsonString);
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
     * @description Test `fromMap` method. The `Recno` field is set and the `ExternalId` field is
     * not set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.fromMap
     */
    @IsTest
    static void fromMapWithRecnoSetAndExternalIdNotSet() {
        String recno = 'recno:1234';
        String externalId = '';

        EstateParameter estateParameterDataType = new EstateParameter(
            recno,
            externalId
        );

        Map<String, Object> mapData = new Map<String, Object>{
            'Recno' => recno,
            'ExternalId' => externalId
        };

        System.Test.startTest();
        EstateParameter deserializedEstateParameterDataType = EstateParameter.fromMap(
            mapData
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            estateParameterDataType.Recno,
            deserializedEstateParameterDataType.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            estateParameterDataType.ExternalId,
            deserializedEstateParameterDataType.ExternalId,
            'ExternalId fields should be equal'
        );
    }

    /**
     * @description Test `fromMap` method. The `ExternalId` field is set and the `Recno` field is
     * not set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.fromJson
     */
    @IsTest
    static void fromMapWithExternalIdSetAndRecnoNotSet() {
        String recno = '';
        String externalId = 'externalId1234';

        EstateParameter estateParameterDataType = new EstateParameter(
            recno,
            externalId
        );

        Map<String, Object> mapData = new Map<String, Object>{
            'Recno' => recno,
            'ExternalId' => externalId
        };

        System.Test.startTest();
        EstateParameter deserializedEstateParameterDataType = EstateParameter.fromMap(
            mapData
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            estateParameterDataType.Recno,
            deserializedEstateParameterDataType.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            estateParameterDataType.ExternalId,
            deserializedEstateParameterDataType.ExternalId,
            'ExternalId fields should be equal'
        );
    }

    /**
     * @description Test `fromMap` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.fromMap
     */
    @IsTest
    static void fromMapWithExtraChild() {
        String recno = 'recno:1234';
        String externalId = '';

        EstateParameter estateParameterDataType = new EstateParameter(
            recno,
            externalId
        );

        Map<String, Object> mapData = new Map<String, Object>{
            'Recno' => recno,
            'ExternalId' => externalId,
            'ExtraChild' => 'Extra'
        };

        System.Test.startTest();
        EstateParameter deserializedEstateParameterDataType = EstateParameter.fromMap(
            mapData
        );
        System.Test.stopTest();

        System.Assert.areNotEqual(
            null,
            deserializedEstateParameterDataType,
            'Deserialized object should not be null and should still get a valid EstateParameter object even with extra fields.'
        );
        System.Assert.areEqual(
            estateParameterDataType.Recno,
            deserializedEstateParameterDataType.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            estateParameterDataType.ExternalId,
            deserializedEstateParameterDataType.ExternalId,
            'ExternalId fields should be equal'
        );
    }

    /**
     * @description Test `validate` method with both fields set and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.validate
     */
    @IsTest
    static void validateThrowExceptionWithBothFieldsSet() {
        EstateParameter estateParameterDataType = new EstateParameter();
        estateParameterDataType.Recno = 'recno:1234';
        estateParameterDataType.ExternalId = 'externalId1234';

        String expectedExceptionMessage = EstateParameter.RECNO_AND_EXTERNAL_ID_BOTH_NOT_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            estateParameterDataType.validate();
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
     * @description Test `validate` method with both fields set and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.validate
     */
    @IsTest
    static void validateThrowExceptionWithBothFieldsEmpty() {
        EstateParameter estateParameterDataType = new EstateParameter();
        estateParameterDataType.Recno = '';
        estateParameterDataType.ExternalId = '';

        String expectedExceptionMessage = EstateParameter.RECNO_AND_EXTERNAL_ID_BOTH_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            estateParameterDataType.validate();
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
     * @description Test `validate` method with missing `Recno` field and expect no
     * exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.validate
     */
    @IsTest
    static void validateWithRecnoAsNullAndNoException() {
        EstateParameter estateParameterDataType = new EstateParameter();
        estateParameterDataType.Recno = null;
        estateParameterDataType.ExternalId = 'externalId1234';

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            estateParameterDataType.validate();
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
     * @description Test `validate` method with missing `ExternalId` field and expect no
     * exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see EstateParameter.validate
     */
    @IsTest
    static void validateWithExternalIdAsNullAndNoException() {
        EstateParameter estateParameterDataType = new EstateParameter();
        estateParameterDataType.Recno = 'recno:1234';
        estateParameterDataType.ExternalId = null;

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            estateParameterDataType.validate();
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.Assert.isFalse(
            isExceptionThrown,
            'Expected to have a no exception thrown.'
        );
    }
}
