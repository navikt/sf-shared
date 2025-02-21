/**
 * @description This class is used to represent an create case parameter in the Public 360 API.
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
 *
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class CreateCaseParameter extends AbstractCaseParameterBase {
    /**
     * @description The `ClosedDate` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public Datetime ClosedDate;
    /**
     * @description The `CaseType` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String CaseType;
    /**
     * @description The `DefaultValueSet` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String DefaultValueSet;

    /**
     * @description Private Constructor for the `CreateCaseParameter` class for use with the
     * fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    @TestVisible
    private CreateCaseParameter() {
        super();
    }

    /**
     * @description Constructor for the `CreateCaseParameter` class with mandatory fields as
     * parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param title The title of the case - See Public 360 API documentation for details.
     */
    public CreateCaseParameter(String title) {
        this();
        this.Title = title;
        //this.validate();
    }

    /**
     * @description Returns a JSON representation of the object.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @return `String` JSON representation of the object.
     */
    public override String toJson() {
        //this.validate(); // Ensure mandatory fields are present before serialization
        JsonHelper jsonHelper = new JsonHelper();
        jsonHelper.writeStartObject();
        super.writeCaseParameterFields(jsonHelper); // base fields

        jsonHelper.writeStringFieldIfNotNull(
            'ClosedDate',
            P360Helper.getDatetimeFormatGMT(this.ClosedDate)
        );
        jsonHelper.writeStringFieldIfNotNull('CaseType', this.CaseType);
        jsonHelper.writeStringFieldIfNotNull(
            'DefaultValueSet',
            this.DefaultValueSet
        );
        jsonHelper.writeEndObject();

        return jsonHelper.getAsString();
    }

    /**
     * @description Deserializes a JSON string into an `ArchiveCodeParameter` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @param jsonString JSON string to deserialize.
     * @return `ArchiveCodeParameter` The deserialized object instance from the JSON string.
     */
    public static CreateCaseParameter fromJson(String jsonString) {
        Map<String, Object> rawMap = (Map<String, Object>) JSON.deserializeUntyped(
            jsonString
        );

        CreateCaseParameter instance = new CreateCaseParameter();
        instance.parseCaseParameterFields(rawMap);

        instance.ClosedDate = (Datetime) JSON.deserialize(
            '"' + rawMap.get('ClosedDate') + '"',
            Datetime.class
        );
        instance.CaseType = (String) rawMap.get('CaseType');
        instance.DefaultValueSet = (String) rawMap.get('DefaultValueSet');
        instance.Category = (String) rawMap.get('Category');
        instance.DefaultValueSet = (String) rawMap.get('DefaultValueSet');

        return instance;
    }
}
