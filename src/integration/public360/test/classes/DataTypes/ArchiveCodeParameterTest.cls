/**
 * @description Test class for `ArchiveCodeParameter` class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, December 2024
 * @group Public 360 Integration
 * @see ArchiveCodeParameter
 */
@IsTest(IsParallel=true)
private class ArchiveCodeParameterTest {
    /**
     * @description Test `constructor` with no parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnArchiveType() {
        String archiveType = null;
        Integer sortOrder = 1;

        String expectedExceptionMessage = ArchiveCodeParameter.ARCHIVE_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ArchiveCodeParameter(archiveType, sortOrder);
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnSortOrder() {
        String archiveType = 'Salesforce';
        Integer sortOrder = null;

        String expectedExceptionMessage = ArchiveCodeParameter.SORT_ORDER_NULL_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ArchiveCodeParameter(archiveType, sortOrder);
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnBothArchiveTypeAndSortOrder() {
        String archiveType = null;
        Integer sortOrder = null;

        String expectedExceptionMessage = ArchiveCodeParameter.ARCHIVE_TYPE_AND_SORT_ORDER_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ArchiveCodeParameter(archiveType, sortOrder);
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithFourParametersAndThrowExceptionOnArchiveType() {
        String archiveType = null;
        Integer sortOrder = 1;
        String archiveCode = '123';
        Boolean isManualText = true;

        String expectedExceptionMessage = ArchiveCodeParameter.ARCHIVE_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ArchiveCodeParameter(
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithFourParametersAndThrowExceptionOnSortOrder() {
        String archiveType = 'Salesforce';
        Integer sortOrder = null;
        String archiveCode = '123';
        Boolean isManualText = true;

        String expectedExceptionMessage = ArchiveCodeParameter.SORT_ORDER_NULL_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ArchiveCodeParameter(
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter
     */
    @IsTest
    static void constructorWithFourParametersAndThrowExceptionOnBothArchiveTypeAndSortOrder() {
        String archiveType = null;
        Integer sortOrder = null;
        String archiveCode = '123';
        Boolean isManualText = true;

        String expectedExceptionMessage = ArchiveCodeParameter.ARCHIVE_TYPE_AND_SORT_ORDER_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new ArchiveCodeParameter(
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter.toJson
     */
    @IsTest
    static void toJson() {
        String archiveCode = '123';
        String archiveType = 'Salesforce';
        Integer sortOrder = 1;
        Boolean isManualText = true;

        String expectedJsonString =
            '{"ArchiveCode":"' +
            archiveCode +
            '","ArchiveType":"' +
            archiveType +
            '","Sort":' +
            sortOrder +
            ',"IsManualText":' +
            isManualText +
            '}';
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
     * @description Ensures `toJson` omits null fields rather than serializing them.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.toJson
     */
    @IsTest
    static void toJsonWithNullFields() {
        String archiveType = 'recno:60001';
        Integer sortOrder = 1;

        ArchiveCodeParameter param = new ArchiveCodeParameter(
            archiveType,
            sortOrder
        );
        param.IsManualText = null;
        param.ArchiveCode = null;

        System.Test.startTest();
        String actualJson = param.toJson();
        System.Test.stopTest();

        Map<String, Object> parsed = (Map<String, Object>) JSON.deserializeUntyped(
            actualJson
        );

        System.Assert.areEqual(
            archiveType,
            parsed.get('ArchiveType'),
            'Expected ArchiveType to be "' + archiveType + '"'
        );
        System.Assert.areEqual(
            sortOrder,
            parsed.get('Sort'),
            'Expected Sort to be ' + sortOrder
        );
        System.Assert.isFalse(
            parsed.containsKey('ArchiveCode'),
            'ArchiveCode key should not be present in the JSON'
        );
        System.Assert.isFalse(
            parsed.containsKey('IsManualText'),
            'IsManualText key should not be present in the JSON'
        );
    }

    /**
     * @description Verifies that `toJsonList` returns "[]" when the input list is null.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.toJsonList
     */
    @IsTest
    static void toJsonListWithNullList() {
        List<ArchiveCodeParameter> nullList = null;

        System.Test.startTest();
        String resultJson = ArchiveCodeParameter.toJsonList(nullList);
        System.Test.stopTest();

        System.Assert.areEqual(
            '[]',
            resultJson,
            'Null list should produce an empty JSON array "[]"'
        );
    }

    /**
     * @description Verifies that `toJsonList` returns "[]" when the input list is empty.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.toJsonList
     */
    @IsTest
    static void toJsonListWithEmptyList() {
        List<ArchiveCodeParameter> emptyList = new List<ArchiveCodeParameter>();

        System.Test.startTest();
        String resultJson = ArchiveCodeParameter.toJsonList(emptyList);
        System.Test.stopTest();

        System.Assert.areEqual(
            '[]',
            resultJson,
            'Empty list should produce an empty JSON array "[]"'
        );
    }

    /**
     * @description Verifies `toJsonList` with a single ArchiveCodeParameter item.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.toJsonList
     */
    @IsTest
    static void toJsonListWithOneItem() {
        String archiveCode = '123';
        String archiveType = 'Salesforce';
        Integer sortOrder = 1;
        Boolean isManualText = true;

        ArchiveCodeParameter singleItem = new ArchiveCodeParameter(
            archiveType,
            sortOrder,
            archiveCode,
            isManualText
        );
        List<ArchiveCodeParameter> items = new List<ArchiveCodeParameter>{
            singleItem
        };

        System.Test.startTest();
        String resultJson = ArchiveCodeParameter.toJsonList(items);
        System.Test.stopTest();

        System.Assert.isNotNull(resultJson, 'Should produce non-null JSON');

        List<Object> parsedArray = (List<Object>) JSON.deserializeUntyped(
            resultJson
        );
        System.Assert.areEqual(
            1,
            parsedArray.size(),
            'Should have exactly one item in the array'
        );

        Map<String, Object> parsedObj = (Map<String, Object>) parsedArray[0];

        System.Assert.areEqual(
            archiveType,
            (String) parsedObj.get('ArchiveType'),
            'ArchiveType mismatch'
        );
        System.Assert.areEqual(
            sortOrder,
            (Integer) parsedObj.get('Sort'),
            'Sort mismatch'
        );
        System.Assert.areEqual(
            archiveCode,
            (String) parsedObj.get('ArchiveCode'),
            'ArchiveCode mismatch'
        );
        System.Assert.areEqual(
            isManualText,
            (Boolean) parsedObj.get('IsManualText'),
            'IsManualText mismatch'
        );
    }

    /**
     * @description Verifies `toJsonList` with multiple ArchiveCodeParameter items.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.toJsonList
     */
    @IsTest
    static void toJsonListWithMultipleItems() {
        String archiveCodeItem1 = '123';
        String archiveTypeItem1 = 'Salesforce';
        Integer sortOrderItem1 = 1;
        Boolean isManualTextItem1 = true;

        String archiveCodeItem2 = '987';
        String archiveTypeItem2 = 'Test';
        Integer sortOrderItem2 = 2;
        Boolean isManualTextItem2 = false;

        ArchiveCodeParameter item1 = new ArchiveCodeParameter(
            archiveTypeItem1,
            sortOrderItem1,
            archiveCodeItem1,
            isManualTextItem1
        );
        ArchiveCodeParameter item2 = new ArchiveCodeParameter(
            archiveTypeItem2,
            sortOrderItem2,
            archiveCodeItem2,
            isManualTextItem2
        );
        List<ArchiveCodeParameter> items = new List<ArchiveCodeParameter>{
            item1,
            item2
        };

        System.Test.startTest();
        String resultJson = ArchiveCodeParameter.toJsonList(items);
        System.Test.stopTest();

        System.Assert.isNotNull(resultJson, 'Should produce non-null JSON');

        List<Object> parsedArray = (List<Object>) JSON.deserializeUntyped(
            resultJson
        );
        System.Assert.areEqual(
            2,
            parsedArray.size(),
            'Should have 2 items in the array'
        );

        Map<String, Object> firstObj = (Map<String, Object>) parsedArray[0];
        System.Assert.areEqual(
            archiveTypeItem1,
            (String) firstObj.get('ArchiveType'),
            'Item1 ArchiveType mismatch'
        );
        System.Assert.areEqual(
            sortOrderItem1,
            (Integer) firstObj.get('Sort'),
            'Item1 Sort mismatch'
        );
        System.Assert.areEqual(
            archiveCodeItem1,
            (String) firstObj.get('ArchiveCode'),
            'Item1 ArchiveCode mismatch'
        );
        System.Assert.areEqual(
            isManualTextItem1,
            (Boolean) firstObj.get('IsManualText'),
            'Item1 IsManualText mismatch'
        );

        Map<String, Object> secondObj = (Map<String, Object>) parsedArray[1];
        System.Assert.areEqual(
            archiveTypeItem2,
            (String) secondObj.get('ArchiveType'),
            'Item2 ArchiveType mismatch'
        );
        System.Assert.areEqual(
            sortOrderItem2,
            (Integer) secondObj.get('Sort'),
            'Item2 Sort mismatch'
        );
        System.Assert.areEqual(
            archiveCodeItem2,
            (String) secondObj.get('ArchiveCode'),
            'Item2 ArchiveCode mismatch'
        );
        System.Assert.areEqual(
            isManualTextItem2,
            (Boolean) secondObj.get('IsManualText'),
            'Item2 IsManualText mismatch'
        );
    }

    /**
     * @description Test `fromJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter.fromJson
     */
    @IsTest
    static void fromJson() {
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

        String jsonString =
            '{"ArchiveCode":"' +
            archiveCode +
            '","ArchiveType":"' +
            archiveType +
            '","Sort":' +
            sortOrder +
            ',"IsManualText":' +
            isManualText +
            '}';

        System.Test.startTest();
        ArchiveCodeParameter deserializedArchiveCodeDataType = ArchiveCodeParameter.fromJson(
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
     * @description Ensures `fromJson` handles missing fields by setting them to null.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.fromJson
     */
    @IsTest
    static void fromJsonWithMissingFields() {
        String archiveType = 'recno:60001';
        Integer sortOrder = 1;

        String jsonString =
            '{"ArchiveType":"' +
            archiveType +
            '","Sort":' +
            sortOrder +
            '}';

        System.Test.startTest();
        ArchiveCodeParameter result = ArchiveCodeParameter.fromJson(jsonString);
        System.Test.stopTest();

        System.Assert.areEqual(
            archiveType,
            result.ArchiveType,
            'ArchiveType mismatch'
        );
        System.Assert.areEqual(
            sortOrder,
            result.SortOrder,
            'SortOrder mismatch'
        );
        System.Assert.isNull(
            result.ArchiveCode,
            'ArchiveCode should be null when missing from JSON'
        );
        System.Assert.isNull(
            result.IsManualText,
            'IsManualText should be null when missing from JSON'
        );
    }

    /**
     * @description Test `fromJson` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ArchiveCodeParameter.fromJson
     */
    @IsTest
    static void fromJsonWithExtraChild() {
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

        String jsonString =
            '{"ArchiveCode":"' +
            archiveCode +
            '","ArchiveType":"' +
            archiveType +
            '","Sort":' +
            sortOrder +
            ',"IsManualText":' +
            isManualText +
            ', "ExtraChild": "Extra"}';

        System.Test.startTest();
        ArchiveCodeParameter deserializedArchiveCodeDataType = ArchiveCodeParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areNotEqual(
            null,
            deserializedArchiveCodeDataType,
            'Deserialized object should not be null and should still get a valid ArchiveCodeParameter object even with extra fields.'
        );
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
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
     * @description Confirms `fromJson` throws an exception when fields have invalid types.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.fromJson
     */
    @IsTest
    static void fromJsonWithInvalidFieldType() {
        String jsonString = '{"ArchiveType":"recno:60001","Sort":"oops"}';

        Boolean isExceptionThrown = false;
        String exceptionTypeName = '';
        try {
            ArchiveCodeParameter.fromJson(jsonString);
        } catch (Exception ex) {
            isExceptionThrown = true;
            exceptionTypeName = ex.getTypeName();
        }

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected an exception for invalid field type'
        );
        System.Assert.areEqual(
            'System.TypeException',
            exceptionTypeName,
            'Expected TypeException'
        );
    }

    /**
     * @description Test `fromMap` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ArchiveCodeParameter.fromMap
     */
    @IsTest
    static void fromMap() {
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

        Map<String, Object> mapData = new Map<String, Object>{
            'ArchiveCode' => archiveCode,
            'ArchiveType' => archiveType,
            'Sort' => sortOrder,
            'IsManualText' => isManualText
        };

        System.Test.startTest();
        ArchiveCodeParameter deserializedArchiveCodeDataType = ArchiveCodeParameter.fromMap(
            mapData
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
     * @description Test `fromMap` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ArchiveCodeParameter.fromMap
     */
    @IsTest
    static void fromMapWithExtraChild() {
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

        Map<String, Object> mapData = new Map<String, Object>{
            'ArchiveCode' => archiveCode,
            'ArchiveType' => archiveType,
            'Sort' => sortOrder,
            'IsManualText' => isManualText,
            'ExtraChild' => 'Extra'
        };

        System.Test.startTest();
        ArchiveCodeParameter deserializedArchiveCodeDataType = ArchiveCodeParameter.fromMap(
            mapData
        );
        System.Test.stopTest();

        System.Assert.areNotEqual(
            null,
            deserializedArchiveCodeDataType,
            'Deserialized object should not be null and should still get a valid ArchiveCodeParameter object even with extra fields.'
        );
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
     * @description Verifies that `fromMapList` returns an empty list when the input is null.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.fromMapList
     */
    @IsTest
    static void testFromMapListWithNull() {
        List<Map<String, Object>> nullList = null;

        System.Test.startTest();
        List<ArchiveCodeParameter> result = ArchiveCodeParameter.fromMapList(
            nullList
        );
        System.Test.stopTest();

        System.Assert.isNotNull(
            result,
            'Should never return null, even if input is null'
        );
        System.Assert.areEqual(
            0,
            result.size(),
            'Null input should yield an empty list'
        );
    }

    /**
     * @description Verifies that `fromMapList` returns an empty list when the input is an empty
     * list.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.fromMapList
     */
    @IsTest
    static void fromMapListWithEmptyList() {
        List<Map<String, Object>> emptyList = new List<Map<String, Object>>();

        System.Test.startTest();
        List<ArchiveCodeParameter> result = ArchiveCodeParameter.fromMapList(
            emptyList
        );
        System.Test.stopTest();

        System.Assert.isNotNull(result, 'Should not return null');
        System.Assert.areEqual(
            0,
            result.size(),
            'Empty input should yield an empty list'
        );
    }

    /**
     * @description Verifies `fromMapList` with a single map containing all necessary fields.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.fromMapList
     */
    @IsTest
    static void fromMapListWithOneMap() {
        String archiveCode = 'B32';
        String archiveType = 'recno:60001';
        Integer sortOrder = 1;
        Boolean isManualText = false;

        Map<String, Object> singleItemMap = new Map<String, Object>{
            'ArchiveType' => archiveType,
            'Sort' => sortOrder,
            'ArchiveCode' => archiveCode,
            'IsManualText' => isManualText
        };
        List<Map<String, Object>> mapList = new List<Map<String, Object>>{
            singleItemMap
        };

        System.Test.startTest();
        List<ArchiveCodeParameter> result = ArchiveCodeParameter.fromMapList(
            mapList
        );
        System.Test.stopTest();

        System.Assert.areEqual(1, result.size(), 'Should have exactly 1 item');

        ArchiveCodeParameter acp = result[0];
        System.Assert.areEqual(
            archiveType,
            acp.ArchiveType,
            'ArchiveType mismatch'
        );
        System.Assert.areEqual(sortOrder, acp.SortOrder, 'Sort mismatch');
        System.Assert.areEqual(
            archiveCode,
            acp.ArchiveCode,
            'ArchiveCode mismatch'
        );
        System.Assert.areEqual(
            isManualText,
            acp.IsManualText,
            'IsManualText mismatch'
        );
    }

    /**
     * @description Verifies `fromMapList` with multiple valid maps.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.fromMapList
     */
    @IsTest
    static void fromMapListWithMultipleMaps() {
        String archiveCodeItem1 = 'B32';
        String archiveTypeItem1 = 'recno:60001';
        Integer sortOrderItem1 = 1;
        Boolean isManualTextItem1 = false;

        String archiveCodeItem2 = 'B33';
        String archiveTypeItem2 = 'recno:60002';
        Integer sortOrderItem2 = 2;
        Boolean isManualTextItem2 = true;

        Map<String, Object> item1 = new Map<String, Object>{
            'ArchiveType' => archiveTypeItem1,
            'Sort' => sortOrderItem1,
            'ArchiveCode' => archiveCodeItem1,
            'IsManualText' => isManualTextItem1
        };
        Map<String, Object> item2 = new Map<String, Object>{
            'ArchiveType' => archiveTypeItem2,
            'Sort' => sortOrderItem2,
            'ArchiveCode' => archiveCodeItem2,
            'IsManualText' => isManualTextItem2
        };
        List<Map<String, Object>> mapList = new List<Map<String, Object>>{
            item1,
            item2
        };

        System.Test.startTest();
        List<ArchiveCodeParameter> result = ArchiveCodeParameter.fromMapList(
            mapList
        );
        System.Test.stopTest();

        System.Assert.areEqual(2, result.size(), 'Should have 2 items');

        ArchiveCodeParameter first = result[0];
        System.Assert.areEqual(
            archiveTypeItem1,
            first.ArchiveType,
            'Item1 ArchiveType mismatch'
        );
        System.Assert.areEqual(
            sortOrderItem1,
            first.SortOrder,
            'Item1 Sort mismatch'
        );
        System.Assert.areEqual(
            archiveCodeItem1,
            first.ArchiveCode,
            'Item1 ArchiveCode mismatch'
        );
        System.Assert.areEqual(
            isManualTextItem1,
            first.IsManualText,
            'Item1 IsManualText mismatch'
        );

        ArchiveCodeParameter second = result[1];
        System.Assert.areEqual(
            archiveTypeItem2,
            second.ArchiveType,
            'Item2 ArchiveType mismatch'
        );
        System.Assert.areEqual(
            sortOrderItem2,
            second.SortOrder,
            'Item2 Sort mismatch'
        );
        System.Assert.areEqual(
            archiveCodeItem2,
            second.ArchiveCode,
            'Item2 ArchiveCode mismatch'
        );
        System.Assert.areEqual(
            isManualTextItem2,
            second.IsManualText,
            'Item2 IsManualText mismatch'
        );
    }

    /**
     * @description Verifies `fromMapList` handles a null map in the list without error,
     * simply skipping that item.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.fromMapList
     */
    @IsTest
    static void fromMapListWithNullMapInList() {
        String archiveType = 'recno:60001';
        Integer sortOrder = 1;

        Map<String, Object> validItem = new Map<String, Object>{
            'ArchiveType' => archiveType,
            'Sort' => sortOrder
        };
        List<Map<String, Object>> mapList = new List<Map<String, Object>>{
            null, // a null map
            validItem
        };

        System.Test.startTest();
        List<ArchiveCodeParameter> result = ArchiveCodeParameter.fromMapList(
            mapList
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            1,
            result.size(),
            'Only one item should be created (the null map is skipped)'
        );
        System.Assert.areEqual(
            archiveType,
            result[0].ArchiveType,
            'ArchiveType mismatch'
        );
        System.Assert.areEqual(sortOrder, result[0].SortOrder, 'Sort mismatch');
        System.Assert.isNull(
            result[0].ArchiveCode,
            'ArchiveCode should be null if not provided'
        );
        System.Assert.isNull(
            result[0].IsManualText,
            'IsManualText should be null if not provided'
        );
    }

    /**
     * @description Test round trip of `ArchiveCodeParameter` data type.
     * Ensures that a `toJson()` -> `fromJson()` round-trip returns the same data.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ArchiveCodeParameter.toJson
     * @see ArchiveCodeParameter.fromJson
     */
    @IsTest
    static void roundTrip() {
        ArchiveCodeParameter original = new ArchiveCodeParameter(
            'recno:60001',
            1,
            'B32',
            false
        );

        System.Test.startTest();
        String json = original.toJson();
        ArchiveCodeParameter roundTripped = ArchiveCodeParameter.fromJson(json);
        System.Test.stopTest();

        System.Assert.areEqual(
            original.ArchiveType,
            roundTripped.ArchiveType,
            'ArchiveType mismatch in round trip'
        );
        System.Assert.areEqual(
            original.SortOrder,
            roundTripped.SortOrder,
            'SortOrder mismatch in round trip'
        );
        System.Assert.areEqual(
            original.ArchiveCode,
            roundTripped.ArchiveCode,
            'ArchiveCode mismatch in round trip'
        );
        System.Assert.areEqual(
            original.IsManualText,
            roundTripped.IsManualText,
            'IsManualText mismatch in round trip'
        );
    }

    /**
     * @description Test `validate` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
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
