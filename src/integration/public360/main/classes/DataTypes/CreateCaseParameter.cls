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
@SuppressWarnings(
    'PMD.FieldNamingConventions, PMD.TooManyFields, PMD.ExcessivePublicCount, PMD.CognitiveComplexity'
)
public class CreateCaseParameter implements IJsonSerializable {
    /**
     * @description The `ADContextUser` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ADContextUser;
    /**
     * @description The `Title` field of the create case parameter data type.
     * This is a mandatory field.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Title;
    /**
     * @description The `UnofficialTitle` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String UnofficialTitle;
    /**
     * @description The `ExternalId` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ExternalIdParameter
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public ExternalIdParameter ExternalId;
    /**
     * @description The `StartDate` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public Datetime StartDate;
    /**
     * @description The `Status` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Status;
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
     * @description The `JournalUnit` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String JournalUnit;
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
     * @description The `ArchiveCodes` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ArchiveCodeParameter
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public List<ArchiveCodeParameter> ArchiveCodes;
    /**
     * @description The `FiledOnPaper` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public Boolean FiledOnPaper;
    /**
     * @description The `Keywords` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public List<String> Keywords;
    /**
     * @description The `AccessCode` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String AccessCode;
    /**
     * @description The `Paragraph` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Paragraph;
    /**
     * @description The `AccessGroup` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String AccessGroup;
    /**
     * @description The `Notes` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Notes;
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
     * @description The `ResponsiblePersonIdNumber` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ResponsiblePersonIdNumber;
    /**
     * @description The `ResponsiblePersonRecno` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ResponsiblePersonRecno;
    /**
     * @description The `ResponsiblePersonEmail` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ResponsiblePersonEmail;
    /**
     * @description The `ResponsiblePersonUserId` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ResponsiblePersonUserId;
    /**
     * @description The `ResponsibleEnterpriseNumber` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ResponsibleEnterpriseNumber;
    /**
     * @description The `ResponsibleEnterpriseRecno` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ResponsibleEnterpriseRecno;
    /**
     * @description The `Contacts` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see ContactParameter
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public List<ContactParameter> Contacts;
    /**
     * @description The `UnregisteredContacts` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see UnregisteredContactsParameter
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public List<UnregisteredContactsParameter> UnregisteredContacts;
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
     * @description The `Project` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Project;
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
     * @description The `ScrapCode` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ScrapCode;
    /**
     * @description The `Category` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String Category;
    /**
     * @description The `Estates` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public List<EstateParameter> Estates;
    /**
     * @description The `AdditionalFields` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see AdditionalFieldParameter
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * TODO: Implement the AdditionalFieldParameter class
     */
    //public List<AdditionalFieldParameter> AdditionalFields;
    /**
     * @description The `AdditionalListFields` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see AdditionalListFieldParameter
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * TODO: Implement the AdditionalListFieldParameter class
     */
    //public List<AdditionalListFieldParameter> AdditionalListFields;
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
     * @description The `ProgressPlanId` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ProgressPlanId;
    /**
     * @description The `ProgressPlanName` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see PermissionParameter
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     * TODO: Implement the PermissionParameter class
     */
    //public List<PermissionParameter> Permissions;
    /**
     * @description The `eArchiveXMLFragment` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String eArchiveXMLFragment;
    /**
     * @description The `ImportedCaseNumber` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ImportedCaseNumber;

    /**
     * @description Private Constructor for the `CreateCaseParameter` class for use with the
     * fromJson method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    @TestVisible
    private CreateCaseParameter() {
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
    @SuppressWarnings('PMD.CognitiveComplexity, PMD.NcssMethodCount')
    public String toJson() {
        //this.validate(); // Ensure mandatory fields are present before serialization
        JsonHelper jsonHelper = new JsonHelper();
        jsonHelper.writeStartObject();
        jsonHelper.writeStringFieldIfNotNull(
            'ClosedDate',
            P360Helper.getDatetimeFormatGMT(ClosedDate)
        );
        jsonHelper.writeStringFieldIfNotNull('CaseType', CaseType);
        jsonHelper.writeStringFieldIfNotNull(
            'DefaultValueSet',
            DefaultValueSet
        );
        jsonHelper.writeStringFieldIfNotNull('ADContextUser', ADContextUser);
        jsonHelper.writeNestedObject('ExternalId', ExternalId);
        jsonHelper.writeStringFieldIfNotNull('Title', Title);
        jsonHelper.writeStringFieldIfNotNull(
            'UnofficialTitle',
            UnofficialTitle
        );
        jsonHelper.writeStringFieldIfNotNull('Status', Status);
        jsonHelper.writeStringFieldIfNotNull(
            'StartDate',
            P360Helper.getDatetimeFormatGMT(StartDate)
        );
        jsonHelper.writeStringFieldIfNotNull('JournalUnit', JournalUnit);
        jsonHelper.writeStringFieldIfNotNull('SubArchive', SubArchive);
        jsonHelper.writeNestedObjectList('ArchiveCodes', ArchiveCodes);
        jsonHelper.writeBooleanFieldIfNotNull('FiledOnPaper', FiledOnPaper);
        jsonHelper.writeStringListIfNotEmpty('Keywords', Keywords);
        jsonHelper.writeStringFieldIfNotNull('AccessCode', AccessCode);
        jsonHelper.writeStringFieldIfNotNull('Paragraph', Paragraph);
        jsonHelper.writeStringFieldIfNotNull('AccessGroup', AccessGroup);
        jsonHelper.writeStringFieldIfNotNull('Notes', Notes);
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsibleEnterpriseRecno',
            ResponsibleEnterpriseRecno
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsibleEnterpriseNumber',
            ResponsibleEnterpriseNumber
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsiblePersonRecno',
            ResponsiblePersonRecno
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsiblePersonIdNumber',
            ResponsiblePersonIdNumber
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsiblePersonEmail',
            ResponsiblePersonEmail
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsiblePersonUserId',
            ResponsiblePersonUserId
        );
        jsonHelper.writeNestedObjectList('Remarks', Remarks);
        jsonHelper.writeNestedObjectList('Contacts', Contacts);
        jsonHelper.writeNestedObjectList(
            'UnregisteredContacts',
            UnregisteredContacts
        );
        jsonHelper.writeStringFieldIfNotNull('Project', Project);
        jsonHelper.writeStringFieldIfNotNull('ScrapCode', ScrapCode);
        jsonHelper.writeStringListIfNotEmpty('ReferringCases', ReferringCases);
        jsonHelper.writeStringFieldIfNotNull('Category', Category);
        jsonHelper.writeNestedObjectList('Estates', Estates);
        //jsonHelper.writeNestedObjectList('AdditionalFields', AdditionalFields);
        jsonHelper.writeStringFieldIfNotNull('ProgressPlanId', ProgressPlanId);
        //jsonHelper.writeNestedObjectList('Permissions', Permissions);
        //jsonHelper.writeNestedObjectList('AdditionalListFields', AdditionalListFields);
        jsonHelper.writeStringFieldIfNotNull(
            'eArchiveXMLFragment',
            eArchiveXMLFragment
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ImportedCaseNumber',
            ImportedCaseNumber
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
        instance.ADContextUser = (String) rawMap.get('ADContextUser');
        instance.Title = (String) rawMap.get('Title');
        instance.UnofficialTitle = (String) rawMap.get('UnofficialTitle');
        instance.ExternalId = ExternalIdParameter.fromMap(
            (Map<String, Object>) rawMap.get('ExternalId')
        );
        instance.StartDate = (Datetime) JSON.deserialize(
            '"' + rawMap.get('StartDate') + '"',
            Datetime.class
        );
        instance.Status = (String) rawMap.get('Status');
        instance.ClosedDate = (Datetime) JSON.deserialize(
            '"' + rawMap.get('ClosedDate') + '"',
            Datetime.class
        );
        instance.JournalUnit = (String) rawMap.get('JournalUnit');
        instance.SubArchive = (String) rawMap.get('SubArchive');

        instance.ArchiveCodes = new List<ArchiveCodeParameter>();
        List<Object> rawArchiveCodes = (List<Object>) rawMap.get(
            'ArchiveCodes'
        );
        for (Object rawArchiveCode : rawArchiveCodes) {
            instance.ArchiveCodes.add(
                ArchiveCodeParameter.fromMap(
                    (Map<String, Object>) rawArchiveCode
                )
            );
        }

        instance.FiledOnPaper = (Boolean) rawMap.get('FiledOnPaper');

        instance.Keywords = new List<String>();
        List<Object> rawKeywords = (List<Object>) rawMap.get('Keywords');
        for (Object rawKeyword : rawKeywords) {
            instance.Keywords.add((String) rawKeyword);
        }

        instance.AccessCode = (String) rawMap.get('AccessCode');
        instance.Paragraph = (String) rawMap.get('Paragraph');
        instance.AccessGroup = (String) rawMap.get('AccessGroup');
        instance.Notes = (String) rawMap.get('Notes');
        instance.CaseType = (String) rawMap.get('CaseType');
        instance.ResponsiblePersonIdNumber = (String) rawMap.get(
            'ResponsiblePersonIdNumber'
        );
        instance.ResponsiblePersonRecno = (String) rawMap.get(
            'ResponsiblePersonRecno'
        );
        instance.ResponsiblePersonEmail = (String) rawMap.get(
            'ResponsiblePersonEmail'
        );
        instance.ResponsiblePersonUserId = (String) rawMap.get(
            'ResponsiblePersonUserId'
        );
        instance.ResponsibleEnterpriseNumber = (String) rawMap.get(
            'ResponsibleEnterpriseNumber'
        );
        instance.ResponsibleEnterpriseRecno = (String) rawMap.get(
            'ResponsibleEnterpriseRecno'
        );
        instance.Contacts = new List<ContactParameter>();
        List<Object> rawContacts = (List<Object>) rawMap.get('Contacts');
        for (Object rawContact : rawContacts) {
            instance.Contacts.add(
                ContactParameter.fromMap((Map<String, Object>) rawContact)
            );
        }
        instance.UnregisteredContacts = new List<UnregisteredContactsParameter>();
        List<Object> rawUnregisteredContacts = (List<Object>) rawMap.get(
            'UnregisteredContacts'
        );
        for (Object rawUnregisteredContact : rawUnregisteredContacts) {
            instance.UnregisteredContacts.add(
                UnregisteredContactsParameter.fromMap(
                    (Map<String, Object>) rawUnregisteredContact
                )
            );
        }
        instance.ReferringCases = new List<String>();
        List<Object> rawReferringCases = (List<Object>) rawMap.get(
            'ReferringCases'
        );
        for (Object rawReferringCase : rawReferringCases) {
            instance.ReferringCases.add((String) rawReferringCase);
        }

        instance.Project = (String) rawMap.get('Project');

        instance.Remarks = new List<RemarkParameter>();
        List<Object> rawRemarks = (List<Object>) rawMap.get('Remarks');
        for (Object rawRemark : rawRemarks) {
            instance.Remarks.add(
                RemarkParameter.fromMap((Map<String, Object>) rawRemark)
            );
        }

        instance.ScrapCode = (String) rawMap.get('ScrapCode');
        instance.Category = (String) rawMap.get('Category');

        instance.Estates = new List<EstateParameter>();
        List<Object> rawEstates = (List<Object>) rawMap.get('Estates');
        for (Object rawEstate : rawEstates) {
            instance.Estates.add(
                EstateParameter.fromMap((Map<String, Object>) rawEstate)
            );
        }

        /*instance.AdditionalFields = new List<AdditionalFieldParameter>();
        List<Object> rawAdditionalFields = (List<Object>) rawMap.get('AdditionalFields');
        for (Object rawAdditionalField : rawAdditionalFields) {
            instance.AdditionalFields.add(
                AdditionalFieldParameter.fromMap((Map<String, Object>) rawAdditionalField)
            );
        }*/
        instance.DefaultValueSet = (String) rawMap.get('DefaultValueSet');
        instance.ProgressPlanId = (String) rawMap.get('ProgressPlanId');
        /*instance.Permissions = new List<PermissionParameter>();
        List<Object> rawPermissions = (List<Object>) rawMap.get('Permissions');
        for (Object rawPermission : rawPermissions) {
            instance.Permissions.add(
                PermissionParameter.fromMap((Map<String, Object>) rawPermission)
            );
        }
        instance.AdditionalListFields = new List<AdditionalListFieldParameter>();
        List<Object> rawAdditionalListFields = (List<Object>) rawMap.get('AdditionalListFields');
        for (Object rawAdditionalListField : rawAdditionalListFields) {
            instance.AdditionalListFields.add(
                AdditionalListFieldParameter.fromMap((Map<String, Object>) rawAdditionalListField)
            );
        }*/
        instance.eArchiveXMLFragment = (String) rawMap.get(
            'eArchiveXMLFragment'
        );
        instance.ImportedCaseNumber = (String) rawMap.get('ImportedCaseNumber');

        return instance;
    }
}
