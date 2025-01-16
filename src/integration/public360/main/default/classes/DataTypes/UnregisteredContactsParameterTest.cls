/**
 * @description Test class for `UnregisteredContactsParameterTest` class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, January 2025
 * @group Public 360 Integration
 * @see UnregisteredContactsParameterTest
 */
@IsTest(IsParallel=true)
private class UnregisteredContactsParameterTest {
    /**
     * @description Test `constructor` with no parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorEmpty() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType;

        System.Test.startTest();
        unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter();
        System.Test.stopTest();

        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.Role,
            'Role should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.IsUnofficial,
            'IsUnofficial should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.ContactName,
            'ContactName should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.ContactCompanyName,
            'ContactCompanyName should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.ReferenceNumber,
            'ReferenceNumber should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.Address,
            'Address should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.Country,
            'Country should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.MobilePhone,
            'MobilePhone should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.Phone,
            'Phone should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.Email,
            'Email should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.State,
            'State should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.ZipCode,
            'ZipCode should be null'
        );
        System.Assert.isNull(
            unregisteredContactsParameterTestDataType.ZipPlace,
            'ZipPlace should be null'
        );
    }

    /**
     * @description Test `constructor` with mandatory fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMandatoryFieldsAsParameters() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType;
        String contactName = 'Contact Name';
        String role = 'Sakspart';

        System.Test.startTest();
        unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter(
            contactName,
            role
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            contactName,
            unregisteredContactsParameterTestDataType.ContactName,
            'ContactName fields should be equal'
        );
        System.Assert.areEqual(
            role,
            unregisteredContactsParameterTestDataType.Role,
            'Role fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with mandatory fields as parameters and expect an exception to be
     * thrown on `ContactName` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMandatoryFieldsAsParametersAndThrowExceptionOnContactName() {
        String contactName = null;
        String role = 'Sakspart';

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(contactName, role);
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with mandatory fields as parameters and expect an exception to be
     * thrown on `Role` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMandatoryFieldsAsParametersAndThrowExceptionOnRole() {
        String contactName = 'Contact Name';
        String role = null;

        String expectedExceptionMessage = UnregisteredContactsParameter.ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(contactName, role);
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with mandatory fields as parameters and expect an exception to be
     * thrown on `ContactName` and `Role` fields because they are missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMandatoryFieldsAsParametersAndThrowExceptionOnContactNameAndRole() {
        String contactName = null;
        String role = null;

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_AND_ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(contactName, role);
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with main fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAsParameters() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType;
        String contactName = 'Contact Name';
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;

        System.Test.startTest();
        unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter(
            contactName,
            role,
            contactCompanyName,
            referenceNumber,
            isUnofficial
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            contactName,
            unregisteredContactsParameterTestDataType.ContactName,
            'ContactName fields should be equal'
        );
        System.Assert.areEqual(
            role,
            unregisteredContactsParameterTestDataType.Role,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            contactCompanyName,
            unregisteredContactsParameterTestDataType.ContactCompanyName,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            referenceNumber,
            unregisteredContactsParameterTestDataType.ReferenceNumber,
            'ReferenceNumber fields should be equal'
        );
        System.Assert.areEqual(
            isUnofficial,
            unregisteredContactsParameterTestDataType.IsUnofficial,
            'IsUnofficial fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with main fields as parameters and expect an exception to be
     * thrown on `ContactName` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAsParametersAndThrowExceptionOnContactName() {
        String contactName = null;
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with main fields as parameters and expect an exception to be
     * thrown on `Role` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAsParametersAndThrowExceptionOnRole() {
        String contactName = 'Contact Name';
        String role = null;
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;

        String expectedExceptionMessage = UnregisteredContactsParameter.ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with main fields as parameters and expect an exception to be
     * thrown on `ContactName` and `Role` fields because they are missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAsParametersAndThrowExceptionOnContactNameAndRole() {
        String contactName = null;
        String role = null;
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_AND_ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with main fields and address fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAndAddressFieldsAsParameters() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType;
        String contactName = 'Contact Name';
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';

        System.Test.startTest();
        unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter(
            contactName,
            role,
            contactCompanyName,
            referenceNumber,
            isUnofficial,
            country,
            address,
            state,
            zipCode,
            zipPlace
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            contactName,
            unregisteredContactsParameterTestDataType.ContactName,
            'ContactName fields should be equal'
        );
        System.Assert.areEqual(
            role,
            unregisteredContactsParameterTestDataType.Role,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            contactCompanyName,
            unregisteredContactsParameterTestDataType.ContactCompanyName,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            referenceNumber,
            unregisteredContactsParameterTestDataType.ReferenceNumber,
            'ReferenceNumber fields should be equal'
        );
        System.Assert.areEqual(
            isUnofficial,
            unregisteredContactsParameterTestDataType.IsUnofficial,
            'IsUnofficial fields should be equal'
        );
        System.Assert.areEqual(
            country,
            unregisteredContactsParameterTestDataType.Country,
            'Country fields should be equal'
        );
        System.Assert.areEqual(
            address,
            unregisteredContactsParameterTestDataType.Address,
            'Address fields should be equal'
        );
        System.Assert.areEqual(
            state,
            unregisteredContactsParameterTestDataType.State,
            'State fields should be equal'
        );
        System.Assert.areEqual(
            zipCode,
            unregisteredContactsParameterTestDataType.ZipCode,
            'ZipCode fields should be equal'
        );
        System.Assert.areEqual(
            zipPlace,
            unregisteredContactsParameterTestDataType.ZipPlace,
            'ZipPlace fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with main fields and address fields as parameters and expect an exception to be
     * thrown on `ContactName` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAndAddressFieldsAsParametersAndThrowExceptionOnContactName() {
        String contactName = null;
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial,
                country,
                address,
                state,
                zipCode,
                zipPlace
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with main fields and address fields as parameters and expect an exception to be
     * thrown on `Role` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAndAddressFieldsAsParametersAndThrowExceptionOnRole() {
        String contactName = 'Contact Name';
        String role = null;
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';

        String expectedExceptionMessage = UnregisteredContactsParameter.ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial,
                country,
                address,
                state,
                zipCode,
                zipPlace
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with main fields and address fields as parameters and expect an exception to be
     * thrown on `ContactName` and `Role` fields because they are missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAndAddressFieldsAsParametersAndThrowExceptionOnContactNameAndRole() {
        String contactName = null;
        String role = null;
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_AND_ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial,
                country,
                address,
                state,
                zipCode,
                zipPlace
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with main fields and contact info fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAndContactInfoFieldsAsParameters() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType;
        String contactName = 'Contact Name';
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        System.Test.startTest();
        unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter(
            contactName,
            role,
            contactCompanyName,
            referenceNumber,
            isUnofficial,
            mobilePhone,
            phone,
            email
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            contactName,
            unregisteredContactsParameterTestDataType.ContactName,
            'ContactName fields should be equal'
        );
        System.Assert.areEqual(
            role,
            unregisteredContactsParameterTestDataType.Role,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            contactCompanyName,
            unregisteredContactsParameterTestDataType.ContactCompanyName,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            referenceNumber,
            unregisteredContactsParameterTestDataType.ReferenceNumber,
            'ReferenceNumber fields should be equal'
        );
        System.Assert.areEqual(
            isUnofficial,
            unregisteredContactsParameterTestDataType.IsUnofficial,
            'IsUnofficial fields should be equal'
        );
        System.Assert.areEqual(
            mobilePhone,
            unregisteredContactsParameterTestDataType.MobilePhone,
            'MobilePhone fields should be equal'
        );
        System.Assert.areEqual(
            phone,
            unregisteredContactsParameterTestDataType.Phone,
            'Phone fields should be equal'
        );
        System.Assert.areEqual(
            email,
            unregisteredContactsParameterTestDataType.Email,
            'Email fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with main fields and contact info fields as parameters and
     * expect an exception to be thrown on `ContactName` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAndContactInfoFieldsAsParametersAndThrowExceptionOnContactName() {
        String contactName = null;
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial,
                mobilePhone,
                phone,
                email
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with main fields and contact info fields as parameters and
     * expect an exception to be thrown on `Role` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAndContactInfoFieldsAsParametersAndThrowExceptionOnRole() {
        String contactName = 'Contact Name';
        String role = null;
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        String expectedExceptionMessage = UnregisteredContactsParameter.ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial,
                mobilePhone,
                phone,
                email
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with main fields and contact info fields as parameters and
     * expect an exception to be thrown on `ContactName` and `Role` fields because they are missing
     * or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithMainFieldsAndContactInfoFieldsAsParametersAndThrowExceptionOnContactNameAndRole() {
        String contactName = null;
        String role = null;
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_AND_ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial,
                mobilePhone,
                phone,
                email
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with all fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithAllFieldsAsParameters() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType;
        String contactName = 'Contact Name';
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        System.Test.startTest();
        unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter(
            contactName,
            role,
            contactCompanyName,
            referenceNumber,
            isUnofficial,
            country,
            address,
            state,
            zipCode,
            zipPlace,
            mobilePhone,
            phone,
            email
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            contactName,
            unregisteredContactsParameterTestDataType.ContactName,
            'ContactName fields should be equal'
        );
        System.Assert.areEqual(
            role,
            unregisteredContactsParameterTestDataType.Role,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            contactCompanyName,
            unregisteredContactsParameterTestDataType.ContactCompanyName,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            referenceNumber,
            unregisteredContactsParameterTestDataType.ReferenceNumber,
            'ReferenceNumber fields should be equal'
        );
        System.Assert.areEqual(
            isUnofficial,
            unregisteredContactsParameterTestDataType.IsUnofficial,
            'IsUnofficial fields should be equal'
        );
        System.Assert.areEqual(
            country,
            unregisteredContactsParameterTestDataType.Country,
            'Country fields should be equal'
        );
        System.Assert.areEqual(
            address,
            unregisteredContactsParameterTestDataType.Address,
            'Address fields should be equal'
        );
        System.Assert.areEqual(
            state,
            unregisteredContactsParameterTestDataType.State,
            'State fields should be equal'
        );
        System.Assert.areEqual(
            zipCode,
            unregisteredContactsParameterTestDataType.ZipCode,
            'ZipCode fields should be equal'
        );
        System.Assert.areEqual(
            zipPlace,
            unregisteredContactsParameterTestDataType.ZipPlace,
            'ZipPlace fields should be equal'
        );
        System.Assert.areEqual(
            mobilePhone,
            unregisteredContactsParameterTestDataType.MobilePhone,
            'MobilePhone fields should be equal'
        );
        System.Assert.areEqual(
            phone,
            unregisteredContactsParameterTestDataType.Phone,
            'Phone fields should be equal'
        );
        System.Assert.areEqual(
            email,
            unregisteredContactsParameterTestDataType.Email,
            'Email fields should be equal'
        );
    }

    /**
     * @description Test `constructor` with all fields as parameters and expect an exception to be
     * thrown on `ContactName` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithAllFieldsAsParametersAndThrowExceptionOnContactName() {
        String contactName = null;
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial,
                country,
                address,
                state,
                zipCode,
                zipPlace,
                mobilePhone,
                phone,
                email
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with all fields as parameters and expect an exception to be
     * thrown on `Role` field because it is missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithAllFieldsAsParametersAndThrowExceptionOnRole() {
        String contactName = 'Contact Name';
        String role = null;
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        String expectedExceptionMessage = UnregisteredContactsParameter.ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial,
                country,
                address,
                state,
                zipCode,
                zipPlace,
                mobilePhone,
                phone,
                email
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `constructor` with all fields as parameters and expect an exception to be
     * thrown on `ContactName` and `Role` fields because they are missing or set to `null`.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void constructorWithAllFieldsAsParametersAndThrowExceptionOnContactNameAndRole() {
        String contactName = null;
        String role = null;
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_AND_ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            new UnregisteredContactsParameter(
                contactName,
                role,
                contactCompanyName,
                referenceNumber,
                isUnofficial,
                country,
                address,
                state,
                zipCode,
                zipPlace,
                mobilePhone,
                phone,
                email
            );
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `setAddress` with address fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void setAddress() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter();
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';

        System.Test.startTest();
        unregisteredContactsParameterTestDataType.setAddress(
            country,
            address,
            state,
            zipCode,
            zipPlace
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            country,
            unregisteredContactsParameterTestDataType.Country,
            'Country fields should be equal'
        );
        System.Assert.areEqual(
            address,
            unregisteredContactsParameterTestDataType.Address,
            'Address fields should be equal'
        );
        System.Assert.areEqual(
            state,
            unregisteredContactsParameterTestDataType.State,
            'State fields should be equal'
        );
        System.Assert.areEqual(
            zipCode,
            unregisteredContactsParameterTestDataType.ZipCode,
            'ZipCode fields should be equal'
        );
        System.Assert.areEqual(
            zipPlace,
            unregisteredContactsParameterTestDataType.ZipPlace,
            'ZipPlace fields should be equal'
        );
    }

    /**
     * @description Test `setContactInfo` with contact info fields as parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     */
    @IsTest
    static void setContactInfo() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter();
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        System.Test.startTest();
        unregisteredContactsParameterTestDataType.setContactInfo(
            mobilePhone,
            phone,
            email
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            mobilePhone,
            unregisteredContactsParameterTestDataType.MobilePhone,
            'MobilePhone fields should be equal'
        );
        System.Assert.areEqual(
            phone,
            unregisteredContactsParameterTestDataType.Phone,
            'Phone fields should be equal'
        );
        System.Assert.areEqual(
            email,
            unregisteredContactsParameterTestDataType.Email,
            'Email fields should be equal'
        );
    }

    /**
     * @description Test `toJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter.toJson
     */
    @IsTest
    static void toJson() {
        String contactName = 'Contact Name';
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        String expectedJsonString =
            '{' +
            '"Role":"Sakspart",' +
            '"IsUnofficial":true,' +
            '"ContactName":"Contact Name",' +
            '"ContactCompanyName":"Contact Company Name",' +
            '"ReferenceNumber":"12345678900",' +
            '"Address":"Address 30",' +
            '"Country":"Norway",' +
            '"MobilePhone":"12345678",' +
            '"Phone":"12345678",' +
            '"Email":"test@test.nav.no",' +
            '"State":"Oslo",' +
            '"ZipCode":"1234",' +
            '"ZipPlace":"Oslo"' +
            '}';
        String actualJsonString;
        System.Test.startTest();
        UnregisteredContactsParameter unregisteredContactsParameterDataType = new UnregisteredContactsParameter(
            contactName,
            role,
            contactCompanyName,
            referenceNumber,
            isUnofficial,
            country,
            address,
            state,
            zipCode,
            zipPlace,
            mobilePhone,
            phone,
            email
        );
        actualJsonString = unregisteredContactsParameterDataType.toJson();
        System.Test.stopTest();

        System.Assert.areEqual(
            expectedJsonString,
            actualJsonString,
            'toJson should return a JSON string representation of the object.'
        );
    }

    /**
     * @description Test `fromJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter.fromJson
     */
    @IsTest
    static void fromJson() {
        UnregisteredContactsParameter deserializedUnregisteredContactsParameterDataType;
        String contactName = 'Contact Name';
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        UnregisteredContactsParameter unregisteredContactsParameterDataType = new UnregisteredContactsParameter(
            contactName,
            role,
            contactCompanyName,
            referenceNumber,
            isUnofficial,
            country,
            address,
            state,
            zipCode,
            zipPlace,
            mobilePhone,
            phone,
            email
        );

        String jsonString =
            '{' +
            '"Role":"Sakspart",' +
            '"IsUnofficial":true,' +
            '"ContactName":"Contact Name",' +
            '"ContactCompanyName":"Contact Company Name",' +
            '"ReferenceNumber":"12345678900",' +
            '"Address":"Address 30",' +
            '"Country":"Norway",' +
            '"MobilePhone":"12345678",' +
            '"Phone":"12345678",' +
            '"Email":"test@test.nav.no",' +
            '"State":"Oslo",' +
            '"ZipCode":"1234",' +
            '"ZipPlace":"Oslo"' +
            '}';

        System.Test.startTest();
        deserializedUnregisteredContactsParameterDataType = UnregisteredContactsParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            unregisteredContactsParameterDataType.ContactName,
            deserializedUnregisteredContactsParameterDataType.ContactName,
            'ContactName fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.Role,
            deserializedUnregisteredContactsParameterDataType.Role,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.ContactCompanyName,
            deserializedUnregisteredContactsParameterDataType.ContactCompanyName,
            'ContactCompanyName fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.ReferenceNumber,
            deserializedUnregisteredContactsParameterDataType.ReferenceNumber,
            'ReferenceNumber fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.IsUnofficial,
            deserializedUnregisteredContactsParameterDataType.IsUnofficial,
            'IsUnofficial fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.Country,
            deserializedUnregisteredContactsParameterDataType.Country,
            'Country fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.Address,
            deserializedUnregisteredContactsParameterDataType.Address,
            'Address fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.State,
            deserializedUnregisteredContactsParameterDataType.State,
            'State fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.ZipCode,
            deserializedUnregisteredContactsParameterDataType.ZipCode,
            'ZipCode fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.ZipPlace,
            deserializedUnregisteredContactsParameterDataType.ZipPlace,
            'ZipPlace fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.MobilePhone,
            deserializedUnregisteredContactsParameterDataType.MobilePhone,
            'MobilePhone fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.Phone,
            deserializedUnregisteredContactsParameterDataType.Phone,
            'Phone fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.Email,
            deserializedUnregisteredContactsParameterDataType.Email,
            'Email fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter.fromJson
     */
    @IsTest
    static void fromJsonWithExtraChild() {
        UnregisteredContactsParameter deserializedUnregisteredContactsParameterDataType;
        String contactName = 'Contact Name';
        String role = 'Sakspart';
        String contactCompanyName = 'Contact Company Name';
        String referenceNumber = '12345678900';
        Boolean isUnofficial = true;
        String country = 'Norway';
        String address = 'Address 30';
        String state = 'Oslo';
        String zipCode = '1234';
        String zipPlace = 'Oslo';
        String mobilePhone = '12345678';
        String phone = '12345678';
        String email = 'test@test.nav.no';

        UnregisteredContactsParameter unregisteredContactsParameterDataType = new UnregisteredContactsParameter(
            contactName,
            role,
            contactCompanyName,
            referenceNumber,
            isUnofficial,
            country,
            address,
            state,
            zipCode,
            zipPlace,
            mobilePhone,
            phone,
            email
        );

        String jsonString =
            '{' +
            '"Role":"Sakspart",' +
            '"IsUnofficial":true,' +
            '"ContactName":"Contact Name",' +
            '"ContactCompanyName":"Contact Company Name",' +
            '"ReferenceNumber":"12345678900",' +
            '"Address":"Address 30",' +
            '"Country":"Norway",' +
            '"MobilePhone":"12345678",' +
            '"Phone":"12345678",' +
            '"Email":"test@test.nav.no",' +
            '"State":"Oslo",' +
            '"ZipCode":"1234",' +
            '"ZipPlace":"Oslo",' +
            '"ExtraChild":"Extra Child"' +
            '}';

        System.Test.startTest();
        deserializedUnregisteredContactsParameterDataType = UnregisteredContactsParameter.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            unregisteredContactsParameterDataType.ContactName,
            deserializedUnregisteredContactsParameterDataType.ContactName,
            'ContactName fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.Role,
            deserializedUnregisteredContactsParameterDataType.Role,
            'Role fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.ContactCompanyName,
            deserializedUnregisteredContactsParameterDataType.ContactCompanyName,
            'ContactCompanyName fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.ReferenceNumber,
            deserializedUnregisteredContactsParameterDataType.ReferenceNumber,
            'ReferenceNumber fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.IsUnofficial,
            deserializedUnregisteredContactsParameterDataType.IsUnofficial,
            'IsUnofficial fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.Country,
            deserializedUnregisteredContactsParameterDataType.Country,
            'Country fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.Address,
            deserializedUnregisteredContactsParameterDataType.Address,
            'Address fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.State,
            deserializedUnregisteredContactsParameterDataType.State,
            'State fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.ZipCode,
            deserializedUnregisteredContactsParameterDataType.ZipCode,
            'ZipCode fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.ZipPlace,
            deserializedUnregisteredContactsParameterDataType.ZipPlace,
            'ZipPlace fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.MobilePhone,
            deserializedUnregisteredContactsParameterDataType.MobilePhone,
            'MobilePhone fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.Phone,
            deserializedUnregisteredContactsParameterDataType.Phone,
            'Phone fields should be equal'
        );
        System.Assert.areEqual(
            unregisteredContactsParameterDataType.Email,
            deserializedUnregisteredContactsParameterDataType.Email,
            'Email fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with malformed JSON and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter.fromJson
     */
    @IsTest
    static void fromJsonAndThrowExceptionOnMalformedJson() {
        String jsonString =
            '{' +
            '"Role":"Sakspart",' +
            '"IsUnofficial":true,' +
            '"ContactName":"Contact Name",' +
            '"ContactCompanyName":"Contact Company Name",' +
            '"ReferenceNumber":"12345678900",' +
            '"Address":"Address 30",' +
            '"Country":"Norway",' +
            '"MobilePhone":"12345678",' +
            '"Phone":"12345678",' +
            '"Email":"test@test.nav.no",' +
            '"State":"Oslo",' +
            '"ZipCode":"1234",' +
            '"ZipPlace":"Oslo",' +
            '"MalformedJson"' +
            '}';

        String actualExceptionType = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            UnregisteredContactsParameter.fromJson(jsonString);
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionType = ex.getTypeName();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            'System.JSONException',
            actualExceptionType,
            'Expected exception type should be equal to actual exception type.'
        );
    }

    /**
     * @description Test `validate` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter.validate
     */
    @IsTest
    static void validate() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter();
        unregisteredContactsParameterTestDataType.ContactName = 'Contact Name';
        unregisteredContactsParameterTestDataType.Role = 'Sakspart';

        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            unregisteredContactsParameterTestDataType.validate();
        } catch (Exception ex) {
            isExceptionThrown = true;
        }
        System.Test.stopTest();

        System.Assert.isFalse(
            isExceptionThrown,
            'Expected to have a no exception thrown.'
        );
    }

    /**
     * @description Test `validate` method with missing `ContactName` field and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnContactName() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter();
        unregisteredContactsParameterTestDataType.ContactName = null;
        unregisteredContactsParameterTestDataType.Role = 'Sakspart';

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            unregisteredContactsParameterTestDataType.validate();
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `validate` method with missing `ContactName` field and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnRole() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter();
        unregisteredContactsParameterTestDataType.ContactName = 'Contact Name';
        unregisteredContactsParameterTestDataType.Role = null;

        String expectedExceptionMessage = UnregisteredContactsParameter.ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            unregisteredContactsParameterTestDataType.validate();
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }

    /**
     * @description Test `validate` method with missing `ContactName` and `Role` fields
     * and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter.validate
     */
    @IsTest
    static void validateAndThrowExceptionOnContactNameAndRole() {
        UnregisteredContactsParameter unregisteredContactsParameterTestDataType = new UnregisteredContactsParameter();
        unregisteredContactsParameterTestDataType.ContactName = null;
        unregisteredContactsParameterTestDataType.Role = null;

        String expectedExceptionMessage = UnregisteredContactsParameter.CONTACT_NAME_AND_ROLE_BLANK_ERROR_MESSAGE;
        String actualExceptionMessage = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            unregisteredContactsParameterTestDataType.validate();
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionMessage = ex.getMessage();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            expectedExceptionMessage,
            actualExceptionMessage,
            'Expected exception message should be equal to actual exception message.'
        );
    }
}
