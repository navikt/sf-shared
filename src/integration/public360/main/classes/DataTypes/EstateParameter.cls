/**
 * @description This class is used to represent an estate parameter in the Public 360 API.
 * See the Public 360 API documentation for more information on the fields.
 * The class is intended to be used in conjunction with the Public 360 API.
 * Features:
 * - The class can be serialized to and deserialized from JSON.
 * - The class also has a `validation` method to ensure that mandatory fields are set.
 * - The class has a private `constructor` for use with the `fromJson` method.
 * - The class has a custom exception class for use with the `validation` method.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, January 2025
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @example
 * EstateParameter estateParameter = new EstateParameter('recno:1234', null);
 * String json = estateParameter.toJson();
 * EstateParameter deserializedEstateParameter = EstateParameter.fromJson(json);
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class EstateParameter implements IJsonSerializable {
    /**
     * @description Error messages for the `EstateParameter` class and the `Recno` and `ExternalId`
     * fields. Either the `Recno` or `ExternalId` field need to have a valid value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String RECNO_AND_EXTERNAL_ID_BOTH_BLANK_ERROR_MESSAGE = 'A valid "Recno" or "ExternalId" is required. Please provide at least one.';
    /**
     * @description Error messages for the `EstateParameter` class and the `Recno` and `ExternalId`
     * fields. Either the `Recno` or `ExternalId` field need to be blank as only one can be set at a
     * time.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String RECNO_AND_EXTERNAL_ID_BOTH_NOT_BLANK_ERROR_MESSAGE = 'Only one of "Recno" or "ExternalId" can be set. Please clear one field.';

    /**
     * @description The `Recno` field of the estate.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String Recno;
    /**
     * @description The `ExternalId` field of the estate.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String ExternalId;

    /**
     * @description Private Constructor for the `EstateParameter` class for use with the fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    private EstateParameter() {
    }

    /**
     * @description Constructor for the `EstateParameter` class with mandatory fields as parameters.
     * Either the `Recno` or `ExternalId` field need to have a valid value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param recno The recno of the estate - See Public 360 API documentation for details.
     * @param externalId The external id of the estate - See Public 360 API documentation for details.
     */
    public EstateParameter(String recno, String externalId) {
        this.Recno = recno;
        this.ExternalId = externalId;
        this.validate();
    }

    /**
     * @description Returns a JSON representation of the object.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @return `String` JSON representation of the object.
     */
    public String toJson() {
        this.validate(); // Ensure mandatory fields are present before serialization
        JSONGenerator gen = JSON.createGenerator(false);
        gen.writeStartObject();
        if (Recno != null) {
            gen.writeStringField('Recno', Recno);
        }
        if (ExternalId != null) {
            gen.writeStringField('ExternalId', ExternalId);
        }
        gen.writeEndObject();

        return gen.getAsString();
    }

    /**
     * @description Serializes a list of `EstateParameter` objects into a single JSON array string.
     * Example result:
     * [
     *   {},
     *   {}
     * ]
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param items The list of EstateParameter objects to serialize.
     * @return A JSON string representing the array of archive code objects.
     */
    public static String toJsonList(List<EstateParameter> items) {
        if (items == null || items.isEmpty()) {
            return '[]';
        }

        JsonHelper jsonHelper = new JsonHelper();
        jsonHelper.writeObjectListAsRootArray(items);

        return jsonHelper.getAsString();
    }

    /**
     * @description Deserializes a JSON string into an `EstateParameter` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param jsonString The JSON string to deserialize.
     * @return `EstateParameter` The deserialized object instance from the JSON string.
     */
    public static EstateParameter fromJson(String jsonString) {
        return (EstateParameter) JSON.deserialize(
            jsonString,
            EstateParameter.class
        );
    }

    /**
     * @description Deserializes a Map into an `EstateParameter` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param mapData The Map to deserialize.
     * @return `EstateParameter` The deserialized object instance from the Map.
     */
    public static EstateParameter fromMap(Map<String, Object> mapData) {
        EstateParameter estateParameter = new EstateParameter();
        estateParameter.Recno = (String) mapData.get('Recno');
        estateParameter.ExternalId = (String) mapData.get('ExternalId');

        return estateParameter;
    }

    /**
     * @description Validates the object to ensuring it has the mandatory fields set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @exception EstateParameterException
     */
    @TestVisible
    private void validate() {
        Boolean isRecnoBlank = String.isBlank(this.Recno);
        Boolean isExternalIdBlank = String.isBlank(this.ExternalId);

        if (isRecnoBlank && isExternalIdBlank) {
            throw new EstateParameterException(
                EstateParameter.RECNO_AND_EXTERNAL_ID_BOTH_BLANK_ERROR_MESSAGE
            );
        }
        if (!isRecnoBlank && !isExternalIdBlank) {
            throw new EstateParameterException(
                EstateParameter.RECNO_AND_EXTERNAL_ID_BOTH_NOT_BLANK_ERROR_MESSAGE
            );
        }
    }

    /**
     * @description Custom exception class for the `EstateParameterException` class.
     * Thrown when mandatory fields are missing.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @group Public 360 Integration
     */
    public class EstateParameterException extends Exception {
    }
}
