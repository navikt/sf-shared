/**
 * @description This class is used to represent an unregistered contacts parameter in the Public 360 API.
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
 * UnregisteredContactsParameter unregisteredContacts = new UnregisteredContactsParameter('Contact Name', 'Role');
 * unregisteredContacts.ContactCompanyName = 'Contact Company Name';
 * unregisteredContacts.IsUnofficial = true;
 * String json = unregisteredContacts.toJson();
 * UnregisteredContactsParameter deserializedUnregisteredContacts = UnregisteredContactsParameter.fromJson(json);
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class UnregisteredContactsParameter implements IJsonSerializable {
    /**
     * @description Error messages for the `UnregisteredContactsParameter` class and the
     * `ContactName` field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String CONTACT_NAME_BLANK_ERROR_MESSAGE = 'The ContactName field is mandatory.';
    /**
     * @description Error messages for the `UnregisteredContactsParameter` class and the `Role`
     * field.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String ROLE_BLANK_ERROR_MESSAGE = 'The Role field is mandatory.';
    /**
     * @description Error messages for the `UnregisteredContactsParameter` class and the
     * `ContactName` and `Role` fields.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public static final String CONTACT_NAME_AND_ROLE_BLANK_ERROR_MESSAGE = 'Both ContactName and Role fields are mandatory.';

    /**
     * @description The `Role` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String Role;
    /**
     * @description The `IsUnofficial` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public Boolean IsUnofficial;
    /**
     * @description The `ContactName` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String ContactName;
    /**
     * @description The `ContactCompanyName` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String ContactCompanyName;
    /**
     * @description The `ReferenceNumber` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String ReferenceNumber;
    /**
     * @description The `Address` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String Address;
    /**
     * @description The `Country` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String Country;
    /**
     * @description The `MobilePhone` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String MobilePhone;
    /**
     * @description The `Phone` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String Phone;
    /**
     * @description The `Email` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String Email;
    /**
     * @description The `State` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String State;
    /**
     * @description The `ZipCode` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String ZipCode;
    /**
     * @description The `ZipPlace` field of the unregistered contact.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String ZipPlace;

    /**
     * @description Private Constructor for the `UnregisteredContactsParameter` class for use with the fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    @TestVisible
    private UnregisteredContactsParameter() {
    }

    /**
     * @description Constructor for the `UnregisteredContactsParameter` class with mandatory fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param contactName The contact name of the unregistered contact - See Public 360 API documentation for details.
     * @param role The role of the unregistered contact - See Public 360 API documentation for details.
     */
    public UnregisteredContactsParameter(String contactName, String role) {
        this.ContactName = contactName;
        this.Role = role;
        this.validate();
    }

    /**
     * @description Constructor for the `UnregisteredContactsParameter` class with main fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param contactName The contact name of the unregistered contact - See Public 360 API documentation for details.
     * @param role The role of the unregistered contact - See Public 360 API documentation for details.
     * @param contactCompanyName The company name of the unregistered contact - See Public 360 API documentation for details.
     * @param referenceNumber The reference number of the unregistered contact - See Public 360 API documentation for details.
     * @param isUnofficial It is used to define if a contact should be unofficial, which means screened from
     * Public Journal. Should not be set if the access code on the case is U – Unclassified. - See
     * Public 360 API documentation for details.
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public UnregisteredContactsParameter(
        String contactName,
        String role,
        String contactCompanyName,
        String referenceNumber,
        Boolean isUnofficial
    ) {
        this(contactName, role);
        this.ContactCompanyName = contactCompanyName;
        this.ReferenceNumber = referenceNumber;
        this.IsUnofficial = isUnofficial;
    }

    /**
     * @description Constructor for the `UnregisteredContactsParameter` class with main fields and
     * address fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, December 2024
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param contactName The contact name of the unregistered contact - See Public 360 API documentation for details.
     * @param role The role of the unregistered contact - See Public 360 API documentation for details.
     * @param contactCompanyName The company name of the unregistered contact - See Public 360 API documentation for details.
     * @param referenceNumber The reference number of the unregistered contact - See Public 360 API documentation for details.
     * @param isUnofficial It is used to define if a contact should be unofficial, which means screened from
     * Public Journal. Should not be set if the access code on the case is U – Unclassified. - See
     * Public 360 API documentation for details.
     * @param country The country of the unregistered contact - See Public 360 API documentation for details.
     * @param address The address of the unregistered contact - See Public 360 API documentation for details.
     * @param state The state of the unregistered contact - See Public 360 API documentation for details.
     * @param zipCode The zip code of the unregistered contact - See Public 360 API documentation for details.
     * @param zipPlace The zip place of the unregistered contact - See Public 360 API documentation for details.
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public UnregisteredContactsParameter(
        String contactName,
        String role,
        String contactCompanyName,
        String referenceNumber,
        Boolean isUnofficial,
        String country,
        String address,
        String state,
        String zipCode,
        String zipPlace
    ) {
        this(
            contactName,
            role,
            contactCompanyName,
            referenceNumber,
            isUnofficial
        );
        this.setAddress(country, address, state, zipCode, zipPlace);
    }

    /**
     * @description Constructor for the `UnregisteredContactsParameter` class with main fields and
     * contact info fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param contactName The contact name of the unregistered contact - See Public 360 API documentation for details.
     * @param role The role of the unregistered contact - See Public 360 API documentation for details.
     * @param contactCompanyName The company name of the unregistered contact - See Public 360 API documentation for details.
     * @param referenceNumber The reference number of the unregistered contact - See Public 360 API documentation for details.
     * @param isUnofficial It is used to define if a contact should be unofficial, which means screened from
     * Public Journal. Should not be set if the access code on the case is U – Unclassified. - See
     * Public 360 API documentation for details.
     * @param mobilePhone The mobile phone number of the unregistered contact - See Public 360 API documentation for details.
     * @param phone The phone number of the unregistered contact - See Public 360 API documentation for details.
     * @param email The email of the unregistered contact - See Public 360 API documentation for details.
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public UnregisteredContactsParameter(
        String contactName,
        String role,
        String contactCompanyName,
        String referenceNumber,
        Boolean isUnofficial,
        String mobilePhone,
        String phone,
        String email
    ) {
        this(
            contactName,
            role,
            contactCompanyName,
            referenceNumber,
            isUnofficial
        );
        this.setContactInfo(mobilePhone, phone, email);
    }

    /**
     * @description Constructor for the `UnregisteredContactsParameter` class with all fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param contactName The contact name of the unregistered contact - See Public 360 API documentation for details.
     * @param role The role of the unregistered contact - See Public 360 API documentation for details.
     * @param contactCompanyName The company name of the unregistered contact - See Public 360 API documentation for details.
     * @param referenceNumber The reference number of the unregistered contact - See Public 360 API documentation for details.
     * @param isUnofficial It is used to define if a contact should be unofficial, which means screened from
     * Public Journal. Should not be set if the access code on the case is U – Unclassified. - See
     * Public 360 API documentation for details.
     * @param country The country of the unregistered contact - See Public 360 API documentation for details.
     * @param address The address of the unregistered contact - See Public 360 API documentation for details.
     * @param state The state of the unregistered contact - See Public 360 API documentation for details.
     * @param zipCode The zip code of the unregistered contact - See Public 360 API documentation for details.
     * @param zipPlace The zip place of the unregistered contact - See Public 360 API documentation for details.
     * @param mobilePhone The mobile phone number of the unregistered contact - See Public 360 API documentation for details.
     * @param phone The phone number of the unregistered contact - See Public 360 API documentation for details.
     * @param email The email of the unregistered contact - See Public 360 API documentation for details.
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public UnregisteredContactsParameter(
        String contactName,
        String role,
        String contactCompanyName,
        String referenceNumber,
        Boolean isUnofficial,
        String country,
        String address,
        String state,
        String zipCode,
        String zipPlace,
        String mobilePhone,
        String phone,
        String email
    ) {
        this(
            contactName,
            role,
            contactCompanyName,
            referenceNumber,
            isUnofficial
        );
        this.setAddress(country, address, state, zipCode, zipPlace);
        this.setContactInfo(mobilePhone, phone, email);
    }

    /**
     * @description Sets the address fields of the unregistered contact.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param country The country of the unregistered contact - See Public 360 API documentation for details.
     * @param address The address of the unregistered contact - See Public 360 API documentation for details.
     * @param state The state of the unregistered contact - See Public 360 API documentation for details.
     * @param zipCode The zip code of the unregistered contact - See Public 360 API documentation for details.
     * @param zipPlace The zip place of the unregistered contact - See Public 360 API documentation for details.
     * @return `UnregisteredContactsParameter` The object instance with the address fields set.
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public UnregisteredContactsParameter setAddress(
        String country,
        String address,
        String state,
        String zipCode,
        String zipPlace
    ) {
        this.Country = country;
        this.Address = address;
        this.State = state;
        this.ZipCode = zipCode;
        this.ZipPlace = zipPlace;

        return this;
    }

    /**
     * @description Sets the contact info fields of the unregistered contact.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * @param mobilePhone The mobile phone number of the unregistered contact - See Public 360 API documentation for details.
     * @param phone The phone number of the unregistered contact - See Public 360 API documentation for details.
     * @param email The email of the unregistered contact - See Public 360 API documentation for details.
     * @return `UnregisteredContactsParameter` The object instance with the contact info fields set.
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public UnregisteredContactsParameter setContactInfo(
        String mobilePhone,
        String phone,
        String email
    ) {
        this.MobilePhone = mobilePhone;
        this.Phone = phone;
        this.Email = email;

        return this;
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
        if (Role != null) {
            gen.writeStringField('Role', Role);
        }
        if (IsUnofficial != null) {
            gen.writeBooleanField('IsUnofficial', IsUnofficial);
        }
        if (ContactName != null) {
            gen.writeStringField('ContactName', ContactName);
        }
        if (ContactCompanyName != null) {
            gen.writeStringField('ContactCompanyName', ContactCompanyName);
        }
        if (ReferenceNumber != null) {
            gen.writeStringField('ReferenceNumber', ReferenceNumber);
        }
        if (Address != null) {
            gen.writeStringField('Address', Address);
        }
        if (Country != null) {
            gen.writeStringField('Country', Country);
        }
        if (MobilePhone != null) {
            gen.writeStringField('MobilePhone', MobilePhone);
        }
        if (Phone != null) {
            gen.writeStringField('Phone', Phone);
        }
        if (Email != null) {
            gen.writeStringField('Email', Email);
        }
        if (State != null) {
            gen.writeStringField('State', State);
        }
        if (ZipCode != null) {
            gen.writeStringField('ZipCode', ZipCode);
        }
        if (ZipPlace != null) {
            gen.writeStringField('ZipPlace', ZipPlace);
        }
        gen.writeEndObject();

        return gen.getAsString();
    }

    /**
     *@description Deserializes a JSON string into an `UnregisteredContactsParameter` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param jsonString The JSON string to deserialize.
     * @return `UnregisteredContactsParameter` The deserialized object instance from the JSON string.
     */
    public static UnregisteredContactsParameter fromJson(String jsonString) {
        return (UnregisteredContactsParameter) JSON.deserialize(
            jsonString,
            UnregisteredContactsParameter.class
        );
    }

    /**
     * @description Deserializes a map into an `UnregisteredContactsParameter` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param mapData The map to deserialize.
     * @return `UnregisteredContactsParameter` The deserialized object instance from the map.
     */
    public static UnregisteredContactsParameter fromMap(
        Map<String, Object> mapData
    ) {
        UnregisteredContactsParameter unregisteredContacts = new UnregisteredContactsParameter();
        unregisteredContacts.Role = (String) mapData.get('Role');
        unregisteredContacts.IsUnofficial = (Boolean) mapData.get(
            'IsUnofficial'
        );
        unregisteredContacts.ContactName = (String) mapData.get('ContactName');
        unregisteredContacts.ContactCompanyName = (String) mapData.get(
            'ContactCompanyName'
        );
        unregisteredContacts.ReferenceNumber = (String) mapData.get(
            'ReferenceNumber'
        );
        unregisteredContacts.Address = (String) mapData.get('Address');
        unregisteredContacts.Country = (String) mapData.get('Country');
        unregisteredContacts.MobilePhone = (String) mapData.get('MobilePhone');
        unregisteredContacts.Phone = (String) mapData.get('Phone');
        unregisteredContacts.Email = (String) mapData.get('Email');
        unregisteredContacts.State = (String) mapData.get('State');
        unregisteredContacts.ZipCode = (String) mapData.get('ZipCode');
        unregisteredContacts.ZipPlace = (String) mapData.get('ZipPlace');

        return unregisteredContacts;
    }

    /**
     * @description Validates the object to ensuring it has the mandatory fields set.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @exception UnregisteredContactsParameterException
     */
    @TestVisible
    private void validate() {
        Boolean isContactNameBlank = String.isBlank(this.ContactName);
        Boolean isRoleBlank = String.isBlank(this.Role);

        if (isContactNameBlank && isRoleBlank) {
            throw new UnregisteredContactsParameterException(
                UnregisteredContactsParameter.CONTACT_NAME_AND_ROLE_BLANK_ERROR_MESSAGE
            );
        }
        if (isContactNameBlank) {
            throw new UnregisteredContactsParameterException(
                UnregisteredContactsParameter.CONTACT_NAME_BLANK_ERROR_MESSAGE
            );
        }
        if (isRoleBlank) {
            throw new UnregisteredContactsParameterException(
                UnregisteredContactsParameter.ROLE_BLANK_ERROR_MESSAGE
            );
        }
    }

    /**
     * @description Custom exception class for the `UnregisteredContactsParameter` class.
     * Thrown when mandatory fields are missing.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @group Public 360 Integration
     */
    public class UnregisteredContactsParameterException extends Exception {
    }
}
