/**
 * @description This class is used to represent an archive code parameter in the Public 360 API.
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
 * ArchiveCodeParameter archiveCode = new ArchiveCodeParameter('recno:60001', 1);
 * archiveCode.ArchiveCode = 'B32';
 * archiveCode.IsManualText = false;
 * String json = archiveCode.toJson();
 * ArchiveCodeParameter deserializedArchiveCode = ArchiveCodeParameter.fromJson(json);
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class ArchiveCodeParameter implements IJsonSerializable {
    /**
     * @description Error messages for the `ArchiveCodeParameter` class and the `ArchiveType` field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String ARCHIVE_TYPE_BLANK_ERROR_MESSAGE = 'The ArchiveType field is mandatory.';
    /**
     * @description Error messages for the `ArchiveCodeParameter` class and the `SortOrder` field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String SORT_ORDER_NULL_ERROR_MESSAGE = 'The SortOrder field is mandatory.';
    /**
     * @description Error messages for the `ArchiveCodeParameter` class and the `ArchiveType` and `SortOrder` fields.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String ARCHIVE_TYPE_AND_SORT_ORDER_BLANK_ERROR_MESSAGE = 'Both ArchiveType and SortOrder fields are mandatory.';

    /**
     * @description The `ArchiveCode` field of the archive code.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String ArchiveCode;
    /**
     * @description The `ArchiveType` field of the archive code.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String ArchiveType;
    /**
     * @description The `SortOrder` field of the archive code.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public Integer SortOrder;
    /**
     * @description The `IsManualText` field of the archive code.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public Boolean IsManualText;

    /**
     * @description Private Constructor for the `ArchiveCodeParameter` class for use with the fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    private ArchiveCodeParameter() {
    }

    /**
     * @description Constructor for the `ArchiveCodeParameter` class with mandatory fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param archiveType The type of the archive code - See Public 360 API documentation for details.
     * @param sortOrder The sort order of the archive code - See Public 360 API documentation for details.
     */
    public ArchiveCodeParameter(String archiveType, Integer sortOrder) {
        this.ArchiveType = archiveType;
        this.SortOrder = sortOrder;
        this.validate();
    }

    /**
     * @description Constructor for the `ArchiveCodeParameter` class with all fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param archiveType The type of the archive code - See Public 360 API documentation for details.
     * @param sortOrder The sort order of the archive code - See Public 360 API documentation for details.
     * @param archiveCode The archive code - See Public 360 API documentation for details.
     * @param isManualText Whether the archive code is manual text - See Public 360 API documentation for details.
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public ArchiveCodeParameter(
        String archiveType,
        Integer sortOrder,
        String archiveCode,
        Boolean isManualText
    ) {
        this(archiveType, sortOrder);
        this.ArchiveCode = archiveCode;
        this.IsManualText = isManualText;
    }

    /**
     * @description Returns a JSON representation of the object.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @return `String` JSON representation of the object.
     */
    public String toJson() {
        this.validate(); // Ensure mandatory fields are present before serialization
        JSONGenerator gen = JSON.createGenerator(false);
        gen.writeStartObject();
        if (ArchiveCode != null) {
            gen.writeStringField('ArchiveCode', ArchiveCode);
        }
        if (ArchiveType != null) {
            gen.writeStringField('ArchiveType', ArchiveType);
        }
        if (SortOrder != null) {
            gen.writeNumberField('Sort', SortOrder);
        }
        if (IsManualText != null) {
            gen.writeBooleanField('IsManualText', IsManualText);
        }
        gen.writeEndObject();

        return gen.getAsString();
    }

    /**
     * @description Serializes a list of `ArchiveCodeParameter` objects into a single JSON array
     * string.
     * Example result:
     * [
     *   {"ArchiveType":"recno:60001","Sort":1,"ArchiveCode":"B32","IsManualText":false},
     *   {"ArchiveType":"recno:60002","Sort":2}
     * ]
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param items The list of ArchiveCodeParameter objects to serialize.
     * @return A JSON string representing the array of archive code objects.
     */
    public static String toJsonList(List<ArchiveCodeParameter> items) {
        if (items == null || items.isEmpty()) {
            return '[]';
        }

        JsonHelper jsonHelper = new JsonHelper();
        jsonHelper.writeObjectListAsRootArray(items);

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
    public static ArchiveCodeParameter fromJson(String jsonString) {
        ArchiveCodeParameter instance = new ArchiveCodeParameter();
        JSONParser parser = JSON.createParser(jsonString);
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                String fieldName = parser.getText();
                parser.nextToken();
                if (fieldName == 'ArchiveCode') {
                    instance.ArchiveCode = parser.getText();
                } else if (fieldName == 'ArchiveType') {
                    instance.ArchiveType = parser.getText();
                } else if (fieldName == 'Sort') {
                    instance.SortOrder = Integer.valueOf(parser.getText());
                } else if (fieldName == 'IsManualText') {
                    instance.IsManualText = Boolean.valueOf(parser.getText());
                } else {
                    parser.skipChildren();
                }
            }
        }
        return instance;
    }

    /**
     * @description Deserializes a map into an `ArchiveCodeParameter` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param mapData The map to deserialize.
     * @return `ArchiveCodeParameter` The deserialized object instance from the map.
     */
    public static ArchiveCodeParameter fromMap(Map<String, Object> mapData) {
        ArchiveCodeParameter archiveCode = new ArchiveCodeParameter();
        archiveCode.ArchiveCode = (String) mapData.get('ArchiveCode');
        archiveCode.ArchiveType = (String) mapData.get('ArchiveType');
        archiveCode.SortOrder = (Integer) mapData.get('Sort');
        archiveCode.IsManualText = (Boolean) mapData.get('IsManualText');

        return archiveCode;
    }

    /**
     * @description Deserializes a list of maps into a list of `ArchiveCodeParameter` objects.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param mapDataList A list of maps, where each map represents one ArchiveCodeParameter record.
     * @return A list of ArchiveCodeParameter objects parsed from the provided map data.
     */
    public static List<ArchiveCodeParameter> fromMapList(
        List<Map<String, Object>> mapDataList
    ) {
        List<ArchiveCodeParameter> result = new List<ArchiveCodeParameter>();
        if (mapDataList == null) {
            return result;
        }
        for (Map<String, Object> item : mapDataList) {
            if (item != null) {
                result.add(ArchiveCodeParameter.fromMap(item));
            }
        }
        return result;
    }

    /**
     * @description Validates the object to ensuring it has the mandatory fields set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @exception ArchiveCodeParameterException
     */
    @TestVisible
    private void validate() {
        Boolean isArchiveTypeBlank = String.isBlank(this.ArchiveType);
        Boolean isSortOrderNull = this.SortOrder == null;

        if (isArchiveTypeBlank && isSortOrderNull) {
            throw new ArchiveCodeParameterException(
                ArchiveCodeParameter.ARCHIVE_TYPE_AND_SORT_ORDER_BLANK_ERROR_MESSAGE
            );
        }
        if (isArchiveTypeBlank) {
            throw new ArchiveCodeParameterException(
                ArchiveCodeParameter.ARCHIVE_TYPE_BLANK_ERROR_MESSAGE
            );
        }
        if (isSortOrderNull) {
            throw new ArchiveCodeParameterException(
                ArchiveCodeParameter.SORT_ORDER_NULL_ERROR_MESSAGE
            );
        }
    }

    /**
     * @description Custom exception class for the `ArchiveCodeParameter` class.
     * Thrown when mandatory fields are missing.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @group Public 360 Integration
     */
    public class ArchiveCodeParameterException extends Exception {
    }
}
