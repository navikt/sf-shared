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
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @example
 *
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class UpdateCaseParameter extends AbstractCaseParameterBase {
    /**
     * @description The `CaseNumber` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String CaseNumber;
    /**
     * @description The `RemoveResponsiblePerson` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public Boolean RemoveResponsiblePerson;
    /**
     * @description The `SyncCaseContacts` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <enneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public Boolean SyncCaseContacts;
    /**
     * @description The `SyncCaseEstates` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <enneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public Boolean SyncCaseEstates;

    /**
     * @description Private Constructor for the `CreateCaseParameter` class for use with the
     * fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    @TestVisible
    private UpdateCaseParameter() {
        super();
    }

    public override String toJson() {
        //this.validate(); // Ensure mandatory fields are present before serialization
        JsonHelper jsonHelper = new JsonHelper();
        jsonHelper.writeStartObject();
        //super.writeCommonFields(jsonHelper); // base fields

        jsonHelper.writeEndObject();

        return jsonHelper.getAsString();
    }
}
