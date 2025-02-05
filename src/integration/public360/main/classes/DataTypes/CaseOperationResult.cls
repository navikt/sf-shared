/**
 * @description This class is used to represent the result body on case operations in the Public 360 API.
 * See the Public 360 API documentation for more information on the fields.
 * The class is intended to be used in conjunction with the Public 360 API.
 * Features:
 * - The class can be serialized to and deserialized from JSON.
 * - The class also has a `validation` method to ensure that mandatory fields are set.
 * - The class has a private `constructor` for use with the `fromJson` method.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class CaseOperationResult implements IJsonSerializable {
    /**
     * @description The `Recno` field of the case operation result.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    public String Recno;
    /**
     * @description The `CaseNumber` field of the case operation result.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    public String CaseNumber;
    /**
     * @description The `ImportedCaseNumber` field of the case operation result.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    public String ImportedCaseNumber;
    /**
     * @description The `UID` field of the case operation result.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    public String UID;
    /**
     * @description The `UIDOrigin` field of the case operation result.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    public String UIDOrigin;
    /**
     * @description The `Successful` field of the case operation result.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    public Boolean Successful;
    /**
     * @description The `ErrorMessage` field of the case operation result.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    public String ErrorMessage;
    /**
     * @description The `ErrorDetails` field of the case operation result.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    public String ErrorDetails;

    /**
     * @description Private Constructor for the `CaseOperationResult` class for use with the
     * fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    private CaseOperationResult() {
    }

    /**
     * @description Returns a JSON representation of the object.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return `String` JSON representation of the object.
     */
    public String toJson() {
        JSONGenerator gen = JSON.createGenerator(false);
        gen.writeStartObject();
        if (Recno != null) {
            gen.writeStringField('Recno', Recno);
        }
        if (CaseNumber != null) {
            gen.writeStringField('CaseNumber', CaseNumber);
        }
        if (ImportedCaseNumber != null) {
            gen.writeStringField('ImportedCaseNumber', ImportedCaseNumber);
        }
        if (UID != null) {
            gen.writeStringField('UID', UID);
        }
        if (UIDOrigin != null) {
            gen.writeStringField('UIDOrigin', UIDOrigin);
        }
        if (Successful != null) {
            gen.writeBooleanField('Successful', Successful);
        }
        if (ErrorMessage != null) {
            gen.writeStringField('ErrorMessage', ErrorMessage);
        }
        if (ErrorDetails != null) {
            gen.writeStringField('ErrorDetails', ErrorDetails);
        }
        gen.writeEndObject();

        return gen.getAsString();
    }

    /**
     * @description Deserializes a JSON string into an `CaseOperationResult` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param jsonString The JSON string to deserialize.
     * @return `CaseOperationResult` The deserialized object instance from the JSON string.
     */
    public static CaseOperationResult fromJson(String jsonString) {
        return (CaseOperationResult) JSON.deserialize(
            jsonString,
            CaseOperationResult.class
        );
    }

    /**
     * @description Deserializes a Map into an `CaseOperationResult` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param mapData The Map to deserialize.
     * @return `CaseOperationResult` The deserialized object instance from the Map.
     */
    public static CaseOperationResult fromMap(Map<String, Object> mapData) {
        CaseOperationResult caseOperationResult = new CaseOperationResult();
        caseOperationResult.Recno = (String) mapData.get('Recno');
        caseOperationResult.CaseNumber = (String) mapData.get('CaseNumber');
        caseOperationResult.ImportedCaseNumber = (String) mapData.get(
            'ImportedCaseNumber'
        );
        caseOperationResult.UID = (String) mapData.get('UID');
        caseOperationResult.UIDOrigin = (String) mapData.get('UIDOrigin');
        caseOperationResult.Successful = (Boolean) mapData.get('Successful');
        caseOperationResult.ErrorMessage = (String) mapData.get('ErrorMessage');
        caseOperationResult.ErrorDetails = (String) mapData.get('ErrorDetails');

        return caseOperationResult;
    }
}
