/**
 * @description Test class for RemarkParameter class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, January 2025
 * @group Public 360 Integration
 * @see RemarkParameter
 */
@isTest(IsParallel=true)
private class RemarkParameterTest {
    /**
     * @description Test `constructor` with no parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter
     */
    @IsTest
    static void constructorEmpty() {
        RemarkParameter remarkParameterDataType;

        System.Test.startTest();
        remarkParameterDataType = new RemarkParameter();
        System.Test.stopTest();

        System.Assert.isNull(
            remarkParameterDataType.Title,
            'Title should be null'
        );
        System.Assert.isNull(
            remarkParameterDataType.RemarkType,
            'RemarkType should be null'
        );
    }

    /**
     * @description Test `constructor` with two parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter
     */
    @IsTest
    static void constructorWithTwoParameters() {
        RemarkParameter remarkParameterDataType;
        String title = 'Remark Title';
        String remarkType = 'RemarkType';

        System.Test.startTest();
        remarkParameterDataType = new RemarkParameter(title, remarkType);
        System.Test.stopTest();

        System.Assert.areEqual(
            title,
            remarkParameterDataType.Title,
            'Title fields should be equal'
        );
        System.Assert.areEqual(
            remarkType,
            remarkParameterDataType.RemarkType,
            'RemarkType fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with two parameters and expect an exception to be
     * thrown on `Title` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnTitle() {
        String title = null;
        String remarkType = 'RemarkType';

        String expectedExceptionMessage = RemarkParameter.TITLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new RemarkParameter(title, remarkType);
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
     * thrown on `RemarkType` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnRemarkType() {
        String title = 'Remark Title';
        String remarkType = null;

        String expectedExceptionMessage = RemarkParameter.REMARK_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new RemarkParameter(title, remarkType);
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
     * thrown on both `Title` and `RemarkType` fields because they are missing or set
     * to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter
     */
    @IsTest
    static void constructorWithTwoParametersAndThrowExceptionOnBothTitleAndRemarkType() {
        String title = null;
        String remarkType = null;

        String expectedExceptionMessage = RemarkParameter.TITLE_AND_REMARK_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new RemarkParameter(title, remarkType);
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
     * @see RemarkParameter
     */
    @IsTest
    static void constructorWithThreeParameters() {
        RemarkParameter remarkParameterDataType;
        String title = 'Remark Title';
        String remarkType = 'RemarkType';
        String content = 'Remark Content';

        System.Test.startTest();
        remarkParameterDataType = new RemarkParameter(
            title,
            remarkType,
            content
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            title,
            remarkParameterDataType.Title,
            'Title fields should be equal'
        );
        System.Assert.areEqual(
            remarkType,
            remarkParameterDataType.RemarkType,
            'RemarkType fields should be equal'
        );
        System.Assert.areEqual(
            content,
            remarkParameterDataType.Content,
            'Content fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with three parameters and expect an exception to be
     * thrown on `Title` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter
     */
    @IsTest
    static void constructorWithThreeParametersAndThrowExceptionOnTitle() {
        String title = null;
        String remarkType = 'RemarkType';
        String content = 'Remark Content';

        String expectedExceptionMessage = RemarkParameter.TITLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new RemarkParameter(title, remarkType, content);
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
     * thrown on `RemarkType` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter
     */
    @IsTest
    static void constructorWithThreeParametersAndThrowExceptionOnRemarkType() {
        String title = 'Remark Title';
        String remarkType = null;
        String content = 'Remark Content';

        String expectedExceptionMessage = RemarkParameter.REMARK_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new RemarkParameter(title, remarkType, content);
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
     * thrown on `Title` and `RemarkType` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter
     */
    @IsTest
    static void constructorWithThreeParametersAndThrowExceptionOnTitleAndRemarkType() {
        String title = null;
        String remarkType = null;
        String content = 'Remark Content';

        String expectedExceptionMessage = RemarkParameter.TITLE_AND_REMARK_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new RemarkParameter(title, remarkType, content);
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter.toJson
     */
    @isTest
    static void toJson() {
        String title = 'Remark Title';
        String content = 'Remark Content';
        String remarkType = 'RemarkType';

        String expectedJsonString =
            '{"Title":"' +
            title +
            '","Content":"' +
            content +
            '","RemarkType":"' +
            remarkType +
            '"}';
        String actualJsonString;
        System.Test.startTest();
        RemarkParameter remarkParameterDataType = new RemarkParameter(
            title,
            remarkType,
            content
        );
        actualJsonString = remarkParameterDataType.toJson();
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter.toJson
     */
    @isTest
    static void fromJson() {
        String title = 'Remark Title';
        String remarkType = 'RemarkType';
        String content = 'Remark Content';

        RemarkParameter remarkParameterDataType = new RemarkParameter(
            title,
            remarkType,
            content
        );

        String jsonString =
            '{"Title":"' +
            title +
            '","Content":"' +
            content +
            '","RemarkType":"' +
            remarkType +
            '"}';

        System.Test.startTest();
        RemarkParameter deserializedRemarkDataType = RemarkParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            remarkParameterDataType.Title,
            deserializedRemarkDataType.Title,
            'Title fields should be equal'
        );
        System.Assert.areEqual(
            remarkParameterDataType.Content,
            deserializedRemarkDataType.Content,
            'Content fields should be equal'
        );
        System.Assert.areEqual(
            remarkParameterDataType.RemarkType,
            deserializedRemarkDataType.RemarkType,
            'RemarkType fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter.toJson
     */
    @isTest
    static void fromJsonWithExtraChild() {
        String title = 'Remark Title';
        String remarkType = 'RemarkType';
        String content = 'Remark Content';

        RemarkParameter remarkParameterDataType = new RemarkParameter(
            title,
            remarkType,
            content
        );

        String jsonString =
            '{"Title":"' +
            title +
            '","Content":"' +
            content +
            '","RemarkType":"' +
            remarkType +
            '", "ExtraChild": "Extra"}';

        System.Test.startTest();
        RemarkParameter deserializedRemarkDataType = RemarkParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            remarkParameterDataType.Title,
            deserializedRemarkDataType.Title,
            'Title fields should be equal'
        );
        System.Assert.areEqual(
            remarkParameterDataType.Content,
            deserializedRemarkDataType.Content,
            'Content fields should be equal'
        );
        System.Assert.areEqual(
            remarkParameterDataType.RemarkType,
            deserializedRemarkDataType.RemarkType,
            'RemarkType fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with malformed JSON and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter.fromJson
     */
    @isTest
    static void fromJsonAndThrowExceptionOnMalformedJson() {
        String jsonString = '{"Title":"Remark Title","Content":"Remark Content","RemarkType":"RemarkType", "MalformedJson"}';

        String actualExceptionType = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            RemarkParameter.fromJson(jsonString);
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
     * @description Test `fromMap` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see RemarkParameter.fromMap
     */
    @isTest
    static void fromMap() {
        String title = 'Remark Title';
        String content = 'Remark Content';
        String remarkType = 'RemarkType';

        RemarkParameter remarkParameterDataType = new RemarkParameter(
            title,
            remarkType,
            content
        );

        Map<String, Object> mapData = new Map<String, Object>{
            'Title' => title,
            'Content' => content,
            'RemarkType' => remarkType
        };
        System.Test.startTest();
        RemarkParameter deserializedRemarkParameterDataType = RemarkParameter.fromMap(
            mapData
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            remarkParameterDataType.Title,
            deserializedRemarkParameterDataType.Title,
            'Title fields should be equal'
        );
        System.Assert.areEqual(
            remarkParameterDataType.Content,
            deserializedRemarkParameterDataType.Content,
            'Content fields should be equal'
        );
        System.Assert.areEqual(
            remarkParameterDataType.RemarkType,
            deserializedRemarkParameterDataType.RemarkType,
            'RemarkType fields should be equal'
        );
    }

    /**
     * @description Test `fromMap` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see RemarkParameter.fromMap
     */
    @isTest
    static void fromMapWithExtraChild() {
        String title = 'Remark Title';
        String content = 'Remark Content';
        String remarkType = 'RemarkType';

        RemarkParameter remarkParameterDataType = new RemarkParameter(
            title,
            remarkType,
            content
        );

        Map<String, Object> mapData = new Map<String, Object>{
            'Title' => title,
            'Content' => content,
            'RemarkType' => remarkType,
            'ExtraChild' => 'Extra'
        };
        System.Test.startTest();
        RemarkParameter deserializedRemarkParameterDataType = RemarkParameter.fromMap(
            mapData
        );
        System.Test.stopTest();

        System.Assert.areNotEqual(
            null,
            deserializedRemarkParameterDataType,
            'Deserialized object should not be null and should still get a valid RemarkParameter object even with extra fields.'
        );
        System.Assert.areEqual(
            remarkParameterDataType.Title,
            deserializedRemarkParameterDataType.Title,
            'Title fields should be equal'
        );
        System.Assert.areEqual(
            remarkParameterDataType.Content,
            deserializedRemarkParameterDataType.Content,
            'Content fields should be equal'
        );
        System.Assert.areEqual(
            remarkParameterDataType.RemarkType,
            deserializedRemarkParameterDataType.RemarkType,
            'RemarkType fields should be equal'
        );
    }

    /**
     * @description Test `validate` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter.validate
     */
    @IsTest
    static void validate() {
        RemarkParameter remarkParameterDataType = new RemarkParameter();
        remarkParameterDataType.Title = 'Remark Title';
        remarkParameterDataType.RemarkType = 'RemarkType';

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            remarkParameterDataType.validate();
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
     * @description Test `validate` method with missing `Title` field and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnTitle() {
        RemarkParameter remarkParameterDataType = new RemarkParameter();
        remarkParameterDataType.Title = null;
        remarkParameterDataType.RemarkType = 'RemarkType';

        String expectedExceptionMessage = RemarkParameter.TITLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            remarkParameterDataType.validate();
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
     * @description Test `validate` method with missing `RemarkType` field and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnRemarkType() {
        RemarkParameter remarkParameterDataType = new RemarkParameter();
        remarkParameterDataType.Title = 'Remark Title';
        remarkParameterDataType.RemarkType = null;

        String expectedExceptionMessage = RemarkParameter.REMARK_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            remarkParameterDataType.validate();
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
     * @description Test `validate` method with missing `Title` and `RemarkType` field
     * and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnTitleAndRemarkType() {
        RemarkParameter remarkParameterDataType = new RemarkParameter();
        remarkParameterDataType.Title = null;
        remarkParameterDataType.RemarkType = null;

        String expectedExceptionMessage = RemarkParameter.TITLE_AND_REMARK_TYPE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            remarkParameterDataType.validate();
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
