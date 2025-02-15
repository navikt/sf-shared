/**
 * @description This class is used to represent the result body on get case operations in the Public 360 API.
 * See the Public 360 API documentation for more information on the fields.
 * The class is intended to be used in conjunction with the Public 360 API.

 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class GetCasesResult implements IJsonSerializable {
    public List<CaseResult> Cases;
    public Integer TotalCount;
    public Integer TotalPageCount;
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
     * @description Private Constructor for the `GetCasesResult` class for use with the
     * fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    private GetCasesResult() {
    }

    /**
     * @description Returns a JSON representation of the object.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return `String` JSON representation of the object.
     */
    public String toJson() {
        /*JSONGenerator gen = JSON.createGenerator(false);
        gen.writeStartObject();
        if (Cases != null) {
            gen.writeStringField('Cases', Cases);
        }
        if (TotalCount != null) {
            gen.writeNumberField('TotalCount', TotalCount);
        }
        if (TotalPageCount != null) {
            gen.writeNumberField('TotalPageCount', TotalPageCount);
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
        gen.writeEndObject();*/

        JsonHelper jsonHelper = new JsonHelper();
        jsonHelper.writeStartObject();
        //jsonHelper.writeNestedObjectList('Cases', Cases);
        jsonHelper.writeEndObject();

        return jsonHelper.getAsString();
    }

    /**
     * @description Deserializes a JSON string into an `GetCasesResult` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param jsonString The JSON string to deserialize.
     * @return `GetCasesResult` The deserialized object instance from the JSON string.
     */
    public static GetCasesResult fromJson(String jsonString) {
        Map<String, Object> rawMap = (Map<String, Object>) JSON.deserializeUntyped(
            jsonString
        );

        GetCasesResult instance = new GetCasesResult();
        instance.Cases = new List<CaseResult>();
        List<Object> rawCases = (List<Object>) rawMap.get('Cases');
        for (Object rawCase : rawCases) {
            instance.Cases.add(CaseResult.fromJson((String) rawCase));
        }
        instance.TotalCount = (Integer) rawMap.get('TotalCount');
        instance.TotalPageCount = (Integer) rawMap.get('TotalPageCount');
        instance.Successful = (Boolean) rawMap.get('Successful');
        instance.ErrorMessage = (String) rawMap.get('ErrorMessage');
        instance.ErrorDetails = (String) rawMap.get('ErrorDetails');

        return instance;
    }

    /**
     * @description Deserializes a Map into an `GetCasesResult` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param mapData The Map to deserialize.
     * @return `GetCasesResult` The deserialized object instance from the Map.
     */
    public static GetCasesResult fromMap(Map<String, Object> mapData) {
        GetCasesResult getCasesResult = new GetCasesResult();
        getCasesResult.Cases = new List<CaseResult>();
        List<Object> rawCases = (List<Object>) mapData.get('Cases');
        for (Object rawCase : rawCases) {
            getCasesResult.Cases.add(
                CaseResult.fromMap((Map<String, Object>) rawCase)
            );
        }
        getCasesResult.TotalCount = (Integer) mapData.get('TotalCount');
        getCasesResult.TotalPageCount = (Integer) mapData.get('TotalPageCount');
        getCasesResult.Successful = (Boolean) mapData.get('Successful');
        getCasesResult.ErrorMessage = (String) mapData.get('ErrorMessage');
        getCasesResult.ErrorDetails = (String) mapData.get('ErrorDetails');

        return getCasesResult;
    }
}
