/**
 * @description This class is used to represent an contact parameter in the Public 360 API.
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
 * ContactParameter contact = new ContactParameter('12345678900', 'Sakspart');
 * contact.ExternalId = '123456';
 * contact.IsUnofficial = false;
 * String json = contact.toJson();
 * ContactParameter deserializedContact = ContactParameter.fromJson(json);
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class ContactParameter implements IJsonSerializable {
    /**
     * @description Error messages for the `ContactParameter` class and the `ReferenceNumber` field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String REFERENCE_NUMBER_BLANK_ERROR_MESSAGE = 'The ReferenceNumber field is mandatory.';
    /**
     * @description Error messages for the `ContactParameter` class and the `Role` field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String ROLE_BLANK_ERROR_MESSAGE = 'The Role field is mandatory.';
    /**
     * @description Error messages for the `ContactParameter` class and the `ReferenceNumber` and `Role` fields.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String REFERENCE_NUMBER_AND_ROLE_BLANK_ERROR_MESSAGE = 'Both ReferenceNumber and Role fields are mandatory.';

    /**
     * @description The `ReferenceNumber` field of the contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String ReferenceNumber;
    /**
     * @description The `ExternalId` field of the contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String ExternalId;
    /**
     * @description The `Role` field of the contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String Role;
    /**
     * @description The `IsUnofficial` field of the contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public Boolean IsUnofficial;

    /**
     * @description Private Constructor for the `ContactParameter` class for use with the fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    private ContactParameter() {
    }

    /**
     * @description Constructor for the `ContactParameter` class with mandatory fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param referenceNumber The reference number of the contact - See Public 360 API documentation for details.
     * @param role The role of the contact - See Public 360 API documentation for details.
     */
    public ContactParameter(String referenceNumber, String role) {
        this.ReferenceNumber = referenceNumber;
        this.Role = role;
        this.validate();
    }

    /**
     * @description Constructor for the `ContactParameter` class with all fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param referenceNumber The reference number of the contact - See Public 360 API documentation for details.
     * @param role The role of the contact - See Public 360 API documentation for details.
     * @param isUnofficial It is used to define if a contact should be unofficial, which means screened from
     * Public Journal. Should not be set if the access code on the case is U – Unclassified. - See
     * Public 360 API documentation for details.
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public ContactParameter(
        String referenceNumber,
        String role,
        Boolean isUnofficial
    ) {
        this(referenceNumber, role);
        this.IsUnofficial = isUnofficial;
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
        if (ReferenceNumber != null) {
            gen.writeStringField('ReferenceNumber', ReferenceNumber);
        }
        if (ExternalId != null) {
            gen.writeStringField('ExternalId', ExternalId);
        }
        if (Role != null) {
            gen.writeStringField('Role', Role);
        }
        if (IsUnofficial != null) {
            gen.writeBooleanField('IsUnofficial', IsUnofficial);
        }
        gen.writeEndObject();

        return gen.getAsString();
    }

    /**
     * @description Serializes a list of `ContactParameter` objects into a single JSON array string.
     * Example result:
     * [
     *   {},
     *   {}
     * ]
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param items The list of ContactParameter objects to serialize.
     * @return A JSON string representing the array of archive code objects.
     */
    public static String toJsonList(List<ContactParameter> items) {
        if (items == null || items.isEmpty()) {
            return '[]';
        }

        JsonHelper jsonHelper = new JsonHelper();
        jsonHelper.writeObjectListAsRootArray(items);

        return jsonHelper.getAsString();
    }

    /**
     * @description Converts the current `ContactParameter` instance into a Map representation,
     * where the keys match the field names used in fromMap(...) and external usage.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return A `Map<String, Object>` containing the object's field data.
     */
    public Map<String, Object> toMap() {
        Map<String, Object> result = new Map<String, Object>();

        result.put('ReferenceNumber', this.ReferenceNumber);
        result.put('ExternalId', this.ExternalId);
        result.put('Role', this.Role);
        result.put('IsUnofficial', this.IsUnofficial);

        return result;
    }

    /**
     * @description Converts a list of `ContactParameter` instances into a list of maps.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @param contactParameterItems The list of `ContactParameter` instances to convert.
     * @return A `List<Map<String, Object>>` list of maps containing the object's field data.
     */
    public static List<Map<String, Object>> toMapList(
        List<ContactParameter> contactParameterItems
    ) {
        List<Map<String, Object>> result = new List<Map<String, Object>>();
        for (ContactParameter contactParameterItem : contactParameterItems) {
            result.add(contactParameterItem.toMap());
        }
        return result;
    }

    /**
     *@description Deserializes a JSON string into an `ContactParameter` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param jsonString The JSON string to deserialize.
     * @return `ContactParameter` The deserialized object instance from the JSON string.
     */
    public static ContactParameter fromJson(String jsonString) {
        return (ContactParameter) JSON.deserialize(
            jsonString,
            ContactParameter.class
        );
    }

    /**
     * @description Deserializes a map into an `ContactParameter` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param mapData The map to deserialize.
     * @return `ContactParameter` The deserialized object instance from the map.
     */
    public static ContactParameter fromMap(Map<String, Object> mapData) {
        ContactParameter contact = new ContactParameter();
        contact.ReferenceNumber = (String) mapData?.get('ReferenceNumber');
        contact.ExternalId = (String) mapData?.get('ExternalId');
        contact.Role = (String) mapData?.get('Role');
        contact.IsUnofficial = (Boolean) mapData?.get('IsUnofficial');

        return contact;
    }

    /**
     * @description Validates the object to ensuring it has the mandatory fields set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @exception ContactParameterException
     */
    @TestVisible
    private void validate() {
        Boolean isReferenceNumberBlank = String.isBlank(this.ReferenceNumber);
        Boolean isRoleBlank = String.isBlank(this.Role);

        if (isReferenceNumberBlank && isRoleBlank) {
            throw new ContactParameterException(
                ContactParameter.REFERENCE_NUMBER_AND_ROLE_BLANK_ERROR_MESSAGE
            );
        }
        if (isReferenceNumberBlank) {
            throw new ContactParameterException(
                ContactParameter.REFERENCE_NUMBER_BLANK_ERROR_MESSAGE
            );
        }
        if (isRoleBlank) {
            throw new ContactParameterException(
                ContactParameter.ROLE_BLANK_ERROR_MESSAGE
            );
        }
    }

    /**
     * @description Custom exception class for the `ContactParameter` class.
     * Thrown when mandatory fields are missing.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @group Public 360 Integration
     */
    public class ContactParameterException extends Exception {
    }
}
