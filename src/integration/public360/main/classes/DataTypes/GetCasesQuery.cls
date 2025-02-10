/**
 * @description This class is used to represent an get case query in the Public 360 API.
 * See the Public 360 API documentation for more information on the fields.
 * The class is intended to be used in conjunction with the Public 360 API.
 * Features:
 * - The class can be serialized to and deserialized from JSON.
 * - The class has a private `constructor` for use with the `fromJson` method.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @example
 *
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class GetCasesQuery implements IJsonSerializable {
    /**
     * @description The AD context user for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ADContextUser;
    /**
     * @description The maximum number of cases to return.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public Integer MaxReturnedCases;
    /**
     * @description The page number for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public Integer Page;
    /**
     * @description The sort criterion for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String SortCriterion;
    /**
     * @description The record number for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Recno;
    /**
     * @description The case number for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String CaseNumber;
    /**
     * @description The external id for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see ExternalIdParameter
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public ExternalIdParameter ExternalId;
    /**
     * @description The title for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Title;
    /**
     * @description The archive code for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ArchiveCode;
    /**
     * @description The project number for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ProjectNumber;
    /**
     * @description The category code for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String CategoryCode;
    /**
     * @description The last date for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String LastDate;
    /**
     * @description The contact reference number for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ContactReferenceNumber;
    /**
     * @description The contact external id for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ContactExternalId;
    /**
     * @description The contact recnos for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ContactRecnos;
    /**
     * @description The sub archive for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String SubArchive;
    /**
     * @description The case type for the query.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String CaseType;
    //public DateCriteriaType DateCriteria;
    //public List<AdditionalFieldParameter> AdditionalFields;

    /**
     * @description Returns a JSON representation of the object.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return `String` JSON representation of the object.
     */
    @SuppressWarnings('PMD.CognitiveComplexity, PMD.NcssMethodCount')
    public String toJson() {
        //this.validate(); // Ensure mandatory fields are present before serialization
        JsonHelper jsonHelper = new JsonHelper();
        jsonHelper.writeStartObject();
        jsonHelper.writeStringFieldIfNotNull('ADContextUser', ADContextUser);
        jsonHelper.writeIntegerFieldIfNotNull(
            'MaxReturnedCases',
            MaxReturnedCases
        );
        jsonHelper.writeIntegerFieldIfNotNull('Page', Page);
        jsonHelper.writeStringFieldIfNotNull('SortCriterion', SortCriterion);
        jsonHelper.writeStringFieldIfNotNull('Recno', Recno);
        jsonHelper.writeStringFieldIfNotNull('CaseNumber', CaseNumber);
        jsonHelper.writeNestedObject('ExternalId', ExternalId);
        jsonHelper.writeStringFieldIfNotNull('Title', Title);
        jsonHelper.writeStringFieldIfNotNull('ArchiveCode', ArchiveCode);
        jsonHelper.writeStringFieldIfNotNull('ProjectNumber', ProjectNumber);
        jsonHelper.writeStringFieldIfNotNull('CategoryCode', CategoryCode);
        jsonHelper.writeStringFieldIfNotNull('LastDate', LastDate);
        jsonHelper.writeStringFieldIfNotNull(
            'ContactReferenceNumber',
            ContactReferenceNumber
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ContactExternalId',
            ContactExternalId
        );
        jsonHelper.writeStringFieldIfNotNull('ContactRecnos', ContactRecnos);
        jsonHelper.writeStringFieldIfNotNull('SubArchive', SubArchive);
        jsonHelper.writeStringFieldIfNotNull('CaseType', CaseType);
        //jsonHelper.writeNestedObject('DateCriteria', DateCriteria);
        //jsonHelper.writeNestedObjectList('AdditionalFields', AdditionalFields);
        jsonHelper.writeEndObject();

        return jsonHelper.getAsString();
    }

    /**
     * @description Deserializes a JSON string into an `GetCasesQuery` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param jsonString JSON string to deserialize.
     * @return `GetCasesQuery` The deserialized object instance from the JSON string.
     */
    public static GetCasesQuery fromJson(String jsonString) {
        return (GetCasesQuery) JSON.deserialize(
            jsonString,
            GetCasesQuery.class
        );
    }
}
