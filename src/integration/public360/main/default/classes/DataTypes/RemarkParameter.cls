/**
 * @description This class is used to represent a remark parameter in the Public 360 API.
 * See the Public 360 API documentation for more information on the fields.
 * The class is intended to be used in conjunction with the Public 360 API.
 * Features:
 * - The class can be serialized to and deserialized from JSON.
 * - The class also has a `validation` method to ensure that mandatory fields are set.
 * - The class has a private `constructor` for use with the `fromJson` method.
 * - The class has a custom exception class for use with the `validation` method.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, NAV
 * @since 0.1.0, January 2025
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @example
 * RemarkParameter remarkParameterDataType = new RemarkParameter('Remark Title', 'RemarkType');
 * remarkParameterDataType.Content = 'Remark Content';
 * String json = remarkParameterDataType.toJson();
 * RemarkParameter deserializedRemarkParameterDataType = RemarkParameter.fromJson(json);
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class RemarkParameter {
    /**
     * @description Error messages for the `RemarkParameter` class and the `Title` field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String TITLE_BLANK_ERROR_MESSAGE = 'The Title field is mandatory.';
    /**
     * @description Error messages for the `RemarkParameter` class and the `RemarkType` field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String REMARK_TYPE_BLANK_ERROR_MESSAGE = 'The RemarkType field is mandatory.';
    /**
     * @description Error messages for the `RemarkParameter` class and the `Title` and `RemarkType` fields.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String TITLE_AND_REMARK_TYPE_BLANK_ERROR_MESSAGE = 'Both Title and RemarkType fields are mandatory.';

    /**
     * @description The `Title` field of the remark.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Title;
    /**
     * @description The `Content` field of the remark.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Content;
    /**
     * @description The `RemarkType` field of the remark.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String RemarkType;

    /**
     * @description Private Constructor for the `RemarkParameter` class for use with the fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    private RemarkParameter() {
    }

    /**
     * @description Constructor for the `RemarkParameter` class with mandatory fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param title The remark title - See Public 360 API documentation for details.
     * @param remarkType The remark type of teh remark - See Public 360 API documentation for details.
     */
    public RemarkParameter(String title, String remarkType) {
        this.Title = title;
        this.RemarkType = remarkType;
        this.validate();
    }

    /**
     * @description Constructor for the `RemarkParameter` class with all fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param title The remark title - See Public 360 API documentation for details.
     * @param remarkType The remark type of teh remark - See Public 360 API documentation for details.
     * @param content The remark content - See Public 360 API documentation for details.
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public RemarkParameter(String title, String remarkType, String content) {
        this(title, remarkType);
        this.Content = content;
    }

    /**
     * @description Returns a JSON representation of the object.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @return `String` JSON representation of the object.
     */
    public String toJson() {
        JSONGenerator gen = JSON.createGenerator(false);
        gen.writeStartObject();
        if (Title != null) {
            gen.writeStringField('Title', Title);
        }
        if (Content != null) {
            gen.writeStringField('Content', Content);
        }
        if (RemarkType != null) {
            gen.writeStringField('RemarkType', RemarkType);
        }
        gen.writeEndObject();

        return gen.getAsString();
    }

    /**
     * @description Deserializes a JSON string into an `RemarkParameter` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param jsonString JSON string to deserialize.
     * @return `RemarkParameter` The deserialized object instance from the JSON string.
     */
    public static RemarkParameter fromJson(String jsonString) {
        return (RemarkParameter) JSON.deserialize(
            jsonString,
            RemarkParameter.class
        );
    }

    /**
     * @description Validates the object to ensuring it has the mandatory fields set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @exception RemarkParameterException
     */
    @TestVisible
    private void validate() {
        Boolean isTitleBlank = String.isBlank(this.Title);
        Boolean isRemarkTypeBlank = String.isBlank(this.RemarkType);

        if (isTitleBlank && isRemarkTypeBlank) {
            throw new RemarkParameterException(
                TITLE_AND_REMARK_TYPE_BLANK_ERROR_MESSAGE
            );
        }
        if (isTitleBlank) {
            throw new RemarkParameterException(TITLE_BLANK_ERROR_MESSAGE);
        }
        if (isRemarkTypeBlank) {
            throw new RemarkParameterException(REMARK_TYPE_BLANK_ERROR_MESSAGE);
        }
    }

    /**
     * @description Custom exception class for the `RemarkParameter` class.
     * Thrown when mandatory fields are missing.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @group Public 360 Integration
     */
    public class RemarkParameterException extends Exception {
    }
}
