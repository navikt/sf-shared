/**
 * @description This class is used to represent an external id parameter for the public360 API,
 * See the Public 360 API documentation for more information on the fields.
 * The class is intended to be used in conjunction with the Public 360 API.
 * Features:
 * - The class can be serialized to and deserialized from JSON.
 * - The class also has a `validation` method to ensure that mandatory fields are set.
 * - The class has a private `constructor` for use with the `fromJson` method.
 * - The class has a custom exception class for use with the `validation` method.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, December 2024
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @example
 * ExternalIdParameter externalId = new ExternalIdParameter('External-ID-123');
 * externalId.Type = 'External-ID-Type-123';
 * String json = externalId.toJson();
 * ExternalIdParameter deserializedExternalId = ExternalIdParameter.fromJson(json);
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class ExternalIdParameter {
    /**
     * @description Error message for the `ExternalIdParameter` class and the `Id` field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String ID_BLANK_ERROR_MESSAGE = 'The Id field is mandatory.';

    /**
     * @description The `Id` field of the external id.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String Id;
    /**
     * @description The `Type` field of the external id.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String Type;

    /**
     * @description Private Constructor for the `ExternalIdParameter` class for use with the `fromJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see ExternalIdParameter.fromJson
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    private ExternalIdParameter() {
    }

    /**
     * @description Constructor for the `ExternalIdParameter` class with mandatory fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param id The external id - See Public 360 API documentation for details.
     */
    public ExternalIdParameter(String id) {
        this.Id = id;
        this.validate();
    }

    /**
     * @description Constructor for the `ExternalIdParameter` class with all fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param id The external id - See Public 360 API documentation for details.
     * @param type The type of the external id - See Public 360 API documentation for details.
     */
    public ExternalIdParameter(String id, String type) {
        this.Id = id;
        this.Type = type;
        this.validate();
    }

    /**
     * @description Returns a JSON representation of the `ExternalIdParameter` object.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @return `String` JSON representation of the object.
     */
    public String toJson() {
        this.validate(); // Ensure mandatory fields are present before serialization
        JSONGenerator gen = JSON.createGenerator(false);
        gen.writeStartObject();
        if (Id != null) {
            gen.writeStringField('Id', Id);
        }
        if (Type != null) {
            gen.writeStringField('Type', Type);
        }
        gen.writeEndObject();

        return gen.getAsString();
    }

    /**
     *@description Deserializes a JSON string into an `ExternalIdParameter` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @param jsonString The JSON string to deserialize.
     * @return `ExternalIdParameter` The deserialized object instance from the JSON string.
     */
    public static ExternalIdParameter fromJson(String jsonString) {
        return (ExternalIdParameter) JSON.deserialize(
            jsonString,
            ExternalIdParameter.class
        );
    }

    /**
     * @description Validates the object to ensuring it has the mandatory fields set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @exception ExternalIdParameterException
     */
    @TestVisible
    private void validate() {
        if (String.isBlank(this.Id)) {
            throw new ExternalIdParameterException(
                'The Id field is mandatory.'
            );
        }
    }

    /**
     * @description Custom exception for the `ExternalIdParameter` class.
     * Thrown when mandatory fields are missing.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @group Public 360 Integration
     */
    public class ExternalIdParameterException extends Exception {
    }
}
