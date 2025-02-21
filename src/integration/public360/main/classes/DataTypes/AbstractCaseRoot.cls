/**
 * @description This abstract class defines the core (root) fields and common logic
 * shared by all “Case”-related classes in the Public 360 integration domain.
 *
 * This class acts as a foundational layer in a multi-layer inheritance model, ensuring
 * the codebase remains DRY (Don’t Repeat Yourself) and clean by gathering truly universal
 * logic into one place.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @see IJsonSerializable
 * @example
 * public class CaseBase extends AbstractCaseRoot {
 *
 *     public static CaseBase fromJson(String jsonString) {
 *         Map<String, Object> rawMap = (Map<String, Object>) JSON.deserializeUntyped(
 *             jsonString
 *         );
 *
 *         CaseBase instance = new CaseBase();
 *         instance.parseParamAndResultFields(rawMap);
 *
 *         // Parse additional fields unique to this class.
 *         return instance;
 *     }
 *
 *     public override String toJson() {
 *         JsonHelper jsonHelper = new JsonHelper();
 *         jsonHelper.writeStartObject();
 *         super.writeUniversalFields(jsonHelper);
 *
 *         // Write additional fields unique to this class.
 *         jsonHelper.writeEndObject();
 *
 *         return jsonHelper.getAsString();
 *     }
 * }
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public abstract class AbstractCaseRoot implements IJsonSerializable {
    /**
     * @description The `ArchiveCodes` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public List<ArchiveCodeParameter> ArchiveCodes;
    /**
     * @description The `ExternalId` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public ExternalIdParameter ExternalId;
    /**
     * @description The `ImportedCaseNumber` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ImportedCaseNumber;
    /**
     * @description The `SubArchive` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String SubArchive;
    /**
     * @description The `Title` field of the create case parameter data type.
     * This is a mandatory field.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Title;
    /**
     * @description The `UnofficialTitle` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String UnofficialTitle;

    /**
     * @description Protected constructor for the `AbstractCaseRoot` class.
     * This constructor is protected to prevent instantiation of the abstract class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    protected AbstractCaseRoot() {
    }

    /**
     * @description Parses the universal fields from a map (deserialized JSON).
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param rawMap The map to deserialize.
     */
    @TestVisible
    protected void parseUniversalFields(Map<String, Object> rawMap) {
        if (rawMap == null) {
            throw new AbstractCaseRootException(
                'Map cannot be null: The parseUniversalFields() method requires a non-null map.'
            );
        }

        this.ArchiveCodes = new List<ArchiveCodeParameter>();
        List<Object> rawArchiveCodes = (List<Object>) rawMap.get(
            'ArchiveCodes'
        ) ?? new List<Object>();
        for (Object rawArchiveCode : rawArchiveCodes) {
            this.ArchiveCodes.add(
                ArchiveCodeParameter.fromMap(
                    (Map<String, Object>) rawArchiveCode
                )
            );
        }
        this.ExternalId = ExternalIdParameter.fromMap(
            (Map<String, Object>) rawMap.get('ExternalId') ??
                new Map<String, Object>()
        );
        this.ImportedCaseNumber = (String) rawMap.get('ImportedCaseNumber');
        this.SubArchive = (String) rawMap.get('SubArchive');
        this.Title = (String) rawMap.get('Title');
        this.UnofficialTitle = (String) rawMap.get('UnofficialTitle');
    }

    /**
     * @description Writes the universal fields to JSON via JsonHelper.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param jsonHelper The JsonHelper instance to write to.
     */
    @TestVisible
    protected void writeUniversalFields(JsonHelper jsonHelper) {
        jsonHelper.writeNestedObjectList('ArchiveCodes', this.ArchiveCodes);
        jsonHelper.writeNestedObject('ExternalId', this.ExternalId);
        jsonHelper.writeStringFieldIfNotNull(
            'ImportedCaseNumber',
            this.ImportedCaseNumber
        );
        jsonHelper.writeStringFieldIfNotNull('SubArchive', this.SubArchive);
        jsonHelper.writeStringFieldIfNotNull('Title', this.Title);
        jsonHelper.writeStringFieldIfNotNull(
            'UnofficialTitle',
            this.UnofficialTitle
        );
    }

    /**
     * @description Each subclass must provide its own final JSON output.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return String The JSON representation of the object.
     */
    public abstract String toJson();

    /**
     * @description Custom exception class for the `AbstractCaseRoot` class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @group Public 360 Integration
     */
    public class AbstractCaseRootException extends Exception {
    }
}
