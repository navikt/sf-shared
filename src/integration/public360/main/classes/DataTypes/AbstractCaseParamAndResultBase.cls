/**
 * @description This class extends `AbstractCaseRoot` to include additional fields that are
 * shared by both “parameter” classes and “result” classes. By placing these mid-level fields and
 * methods here, we minimize duplication for any classes that share these common fields
 *
 * This multi-layer inheritance approach ensures DRY (Don’t Repeat Yourself) design,
 * grouping fields and logic where they’re truly shared, while keeping code for unique
 * fields separated in the subclasses that require them.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @example
 * public class CaseResult extends AbstractCaseParamAndResultBase {
 *
 *     public static CaseResult fromJson(String jsonString) {
 *         Map<String, Object> rawMap = (Map<String, Object>) JSON.deserializeUntyped(
 *             jsonString
 *         );
 *
 *         CaseResult instance = new CaseResult();
 *         instance.parseParamAndResultFields(rawMap);
 *
 *         // Parse additional fields unique to this class.
 *         return instance;
 *     }
 *
 *     public override String toJson() {
 *         JsonHelper jsonHelper = new JsonHelper();
 *         jsonHelper.writeStartObject();
 *         super.writeParamAndResultFields(jsonHelper);
 *
 *         // Write additional fields unique to this class.
 *         jsonHelper.writeEndObject();
 *
 *         return jsonHelper.getAsString();
 *     }
 * }
 */
@SuppressWarnings('PMD.FieldNamingConventions, PMD.TooManyFields')
public abstract class AbstractCaseParamAndResultBase extends AbstractCaseRoot {
    /**
     * @description The `AccessGroup` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String AccessGroup;
    /**
     * @description The `Contacts` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public List<ContactParameter> Contacts;
    /**
     * @description The `eArchiveXMLFragment` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String eArchiveXMLFragment;
    /**
     * @description The `Keywords` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public List<String> Keywords;
    /**
     * @description The `Notes` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Notes;
    /**
     * @description The `Paragraph` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Paragraph;
    /**
     * @description The `ReferringCases` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public List<String> ReferringCases;
    /**
     * @description The `Remarks` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see RemarkParameter
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public List<RemarkParameter> Remarks;
    /**
     * @description The `Status` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Status;

    /**
     * @description Abstract Constructor for the `AbstractCaseParamAndResultBase` class.
     * This constructor is protected to prevent instantiation of the abstract class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    protected AbstractCaseParamAndResultBase() {
        super();
    }

    /**
     * @description This method is used to deserialize the common fields of the object from a map.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param rawMap The map to deserialize.
     */
    @TestVisible
    protected void parseParamAndResultFields(Map<String, Object> rawMap) {
        if (rawMap == null) {
            throw new AbstractCaseParamAndResultBaseException(
                'Map cannot be null: The parseParamAndResultFields() method requires a non-null map.'
            );
        }

        super.parseUniversalFields(rawMap);

        this.AccessGroup = (String) rawMap.get('AccessGroup');
        this.Contacts = new List<ContactParameter>();
        List<Object> rawContacts = (List<Object>) rawMap.get('Contacts') ??
            new List<Object>();
        for (Object rawContact : rawContacts) {
            this.Contacts.add(
                ContactParameter.fromMap((Map<String, Object>) rawContact)
            );
        }
        this.eArchiveXMLFragment = (String) rawMap.get('eArchiveXMLFragment');
        this.Keywords = new List<String>();
        List<Object> rawKeywords = (List<Object>) rawMap.get('Keywords') ??
            new List<Object>();
        for (Object rawKeyword : rawKeywords) {
            this.Keywords.add((String) rawKeyword);
        }
        this.Notes = (String) rawMap.get('Notes');
        this.Paragraph = (String) rawMap.get('Paragraph');
        this.ReferringCases = new List<String>();
        List<Object> rawReferringCases = (List<Object>) rawMap.get(
            'ReferringCases'
        ) ?? new List<Object>();
        for (Object rawReferringCase : rawReferringCases) {
            this.ReferringCases.add((String) rawReferringCase);
        }
        this.Remarks = new List<RemarkParameter>();
        List<Object> rawRemarks = (List<Object>) rawMap.get('Remarks') ??
            new List<Object>();
        for (Object rawRemark : rawRemarks) {
            this.Remarks.add(
                RemarkParameter.fromMap((Map<String, Object>) rawRemark)
            );
        }
        this.Status = (String) rawMap.get('Status');
    }

    /**
     * @description This method is used to serialize the common fields of the object into a JSON
     * string.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param jsonHelper The `JsonHelper` instance to use for serialization.
     * @see JsonHelper
     */
    @TestVisible
    protected void writeParamAndResultFields(JsonHelper jsonHelper) {
        super.writeUniversalFields(jsonHelper);

        jsonHelper.writeStringFieldIfNotNull('AccessGroup', this.AccessGroup);
        jsonHelper.writeNestedObjectList('Contacts', this.Contacts);
        jsonHelper.writeStringFieldIfNotNull(
            'eArchiveXMLFragment',
            this.eArchiveXMLFragment
        );
        jsonHelper.writeStringListIfNotEmpty('Keywords', this.Keywords);
        jsonHelper.writeStringFieldIfNotNull('Notes', this.Notes);
        jsonHelper.writeStringFieldIfNotNull('Paragraph', this.Paragraph);
        jsonHelper.writeStringListIfNotEmpty(
            'ReferringCases',
            this.ReferringCases
        );
        jsonHelper.writeNestedObjectList('Remarks', this.Remarks);
        jsonHelper.writeStringFieldIfNotNull('Status', this.Status);
    }

    /**
     * @description This method is used to serialize the object into a JSON string.
     * Abstract method forcing children to define how to build final JSON
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return `String` JSON representation of the object.
     * @see IJsonSerializable
     */
    public override abstract String toJson();

    /**
     * @description Custom exception class for the `AbstractCaseParamAndResultBase` class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @group Public 360 Integration
     */
    public class AbstractCaseParamAndResultBaseException extends Exception {
    }
}
