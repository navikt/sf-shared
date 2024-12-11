/**
 * @description This class is used to represent an archive code parameter in the Public 360 API.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, NAV
 * @since 0.1.0, November 2024
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
public class ArchiveCodeParameter {
    public String ArchiveCode;
    public String ArchiveType;
    public Integer SortOrder;
    public Boolean IsManualText;

    /**
     * @description Private Constructor for the ArchiveCodeParameter class for use with the fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    private ArchiveCodeParameter() {
    }

    /**
     * @description Constructor for the ArchiveCodeParameter class with mandatory fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @param sortOrder
     * @param archiveType
     */
    public ArchiveCodeParameter(String archiveType, Integer sortOrder) {
        this.ArchiveType = archiveType;
        this.SortOrder = sortOrder;
        this.validate();
    }

    /**
     * @description Constructor for the ArchiveCodeParameter class with all fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @param archiveType
     * @param sortOrder
     * @param archiveCode
     * @param isManualText
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
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
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
     * @description Deserializes a JSON string into an `ArchiveCodeParameter` instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @param jsonString JSON string to deserialize.
     * @return `ArchiveCodeParameter` instance.
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
     * @description Validates the object to ensuring it has the mandatory fields set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, December 2024
     * @exception ArchiveCodeParameterException
     */
    @TestVisible
    private void validate() {
        Boolean isArchiveTypeBlank = String.isBlank(this.ArchiveType);
        Boolean isSortOrderNull = this.SortOrder == null;

        if (isArchiveTypeBlank && isSortOrderNull) {
            throw new ArchiveCodeParameterException(
                'Both ArchiveType and SortOrder fields are mandatory.'
            );
        }
        if (isArchiveTypeBlank) {
            throw new ArchiveCodeParameterException(
                'The ArchiveType field is mandatory.'
            );
        }
        if (isSortOrderNull) {
            throw new ArchiveCodeParameterException(
                'The SortOrder field is mandatory.'
            );
        }
    }

    public class ArchiveCodeParameterException extends Exception {
    }
}
