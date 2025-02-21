/**
 * @description Abstract class for case parameters.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @example
 *
 */
@SuppressWarnings('PMD.FieldNamingConventions, PMD.TooManyFields')
public abstract class AbstractCaseParameterBase extends AbstractCaseParamAndResultBase {
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
     * @description The `ADContextUser` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ADContextUser;
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
     * @description The `FiledOnPaper` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public Boolean FiledOnPaper;
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
     * @description The `Permissions` field of the create case parameter data type.
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
     * @description The `ProgressPlanId` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ProgressPlanId;
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
     * @description The `ResponsiblePersonEmail` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ResponsiblePersonEmail;
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
     * @description The `ResponsiblePersonUserId` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public String ResponsiblePersonUserId;
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
     * @description The `StartDate` field of the create case parameter data type.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     */
    public Datetime StartDate;
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
     * @description Protected Constructor for the `AbstractCaseParameterBase` class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    @TestVisible
    protected AbstractCaseParameterBase() {
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
    protected void parseCaseParameterFields(Map<String, Object> rawMap) {
        super.parseParamAndResultFields(rawMap);

        this.AccessCode = (String) rawMap.get('AccessCode');
        this.ADContextUser = (String) rawMap.get('ADContextUser');
        /*List<Object> rawAdditionalFields = (List<Object>) rawMap.get('AdditionalFields');
        if (rawAdditionalFields != null) {
            this.AdditionalFields = new List<AdditionalFieldParameter>();
            for (Object rawAdditionalField : rawAdditionalFields) {
                this.AdditionalFields.add(
                    AdditionalFieldParameter.fromMap((Map<String, Object>) rawAdditionalField)
                );
            }
        } else {
            this.AdditionalFields = null;
        }
        List<Object> rawAdditionalListFields = (List<Object>) rawMap.get('AdditionalListFields');
        if (rawAdditionalFields != null) {
            this.AdditionalListFields = new List<AdditionalListFieldParameter>();
            for (Object rawAdditionalListField : rawAdditionalListFields) {
                this.AdditionalListFields.add(
                    AdditionalListFieldParameter.fromMap((Map<String, Object>) rawAdditionalListField)
                );
            }
        } else {
            this.AdditionalListFields = null;
        }*/
        this.Category = (String) rawMap.get('Category');
        List<Object> rawEstates = (List<Object>) rawMap.get('Estates');
        if (rawEstates != null) {
            this.Estates = new List<EstateParameter>();
            for (Object rawEstate : rawEstates) {
                this.Estates.add(
                    EstateParameter.fromMap((Map<String, Object>) rawEstate)
                );
            }
        } else {
            this.Estates = null;
        }
        this.FiledOnPaper = (Boolean) rawMap.get('FiledOnPaper');
        this.JournalUnit = (String) rawMap.get('JournalUnit');
        /*List<Object> rawPermissions = (List<Object>) rawMap.get('Permissions');
        if (rawPermission != null) {
            this.Permissions = new List<PermissionParameter>();
            for (Object rawPermission : rawPermissions) {
                this.Permissions.add(
                    PermissionParameter.fromMap((Map<String, Object>) rawPermission)
                );
            }
        } else {
            this.Permissions = null;
        }*/
        this.ProgressPlanId = (String) rawMap.get('ProgressPlanId');
        this.Project = (String) rawMap.get('Project');
        this.ResponsibleEnterpriseNumber = (String) rawMap.get(
            'ResponsibleEnterpriseNumber'
        );
        this.ResponsibleEnterpriseRecno = (String) rawMap.get(
            'ResponsibleEnterpriseRecno'
        );
        this.ResponsiblePersonEmail = (String) rawMap.get(
            'ResponsiblePersonEmail'
        );
        this.ResponsiblePersonIdNumber = (String) rawMap.get(
            'ResponsiblePersonIdNumber'
        );
        this.ResponsiblePersonRecno = (String) rawMap.get(
            'ResponsiblePersonRecno'
        );
        this.ResponsiblePersonUserId = (String) rawMap.get(
            'ResponsiblePersonUserId'
        );
        this.ScrapCode = (String) rawMap.get('ScrapCode');
        this.StartDate = P360Helper.deserializeToDatetime(
            rawMap.get('StartDate')
        );
        List<Object> rawUnregisteredContacts = (List<Object>) rawMap.get(
            'UnregisteredContacts'
        );
        if (rawUnregisteredContacts != null) {
            this.UnregisteredContacts = new List<UnregisteredContactsParameter>();
            for (Object rawUnregisteredContact : rawUnregisteredContacts) {
                this.UnregisteredContacts.add(
                    UnregisteredContactsParameter.fromMap(
                        (Map<String, Object>) rawUnregisteredContact
                    )
                );
            }
        } else {
            this.UnregisteredContacts = null;
        }
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
    protected void writeCaseParameterFields(JsonHelper jsonHelper) {
        super.writeParamAndResultFields(jsonHelper);

        jsonHelper.writeStringFieldIfNotNull('AccessCode', this.AccessCode);
        jsonHelper.writeStringFieldIfNotNull(
            'ADContextUser',
            this.ADContextUser
        );
        //jsonHelper.writeNestedObjectList('AdditionalFields', this.AdditionalFields);
        //jsonHelper.writeNestedObjectList('AdditionalListFields', this.AdditionalListFields);
        jsonHelper.writeStringFieldIfNotNull('Category', this.Category);
        jsonHelper.writeNestedObjectList('Estates', this.Estates);
        jsonHelper.writeBooleanFieldIfNotNull(
            'FiledOnPaper',
            this.FiledOnPaper
        );
        jsonHelper.writeStringFieldIfNotNull('JournalUnit', this.JournalUnit);
        //jsonHelper.writeNestedObjectList('Permissions', this.Permissions);
        jsonHelper.writeStringFieldIfNotNull(
            'ProgressPlanId',
            this.ProgressPlanId
        );
        jsonHelper.writeStringFieldIfNotNull('Project', this.Project);
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsibleEnterpriseNumber',
            this.ResponsibleEnterpriseNumber
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsibleEnterpriseRecno',
            this.ResponsibleEnterpriseRecno
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsiblePersonEmail',
            this.ResponsiblePersonEmail
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsiblePersonIdNumber',
            this.ResponsiblePersonIdNumber
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsiblePersonRecno',
            this.ResponsiblePersonRecno
        );
        jsonHelper.writeStringFieldIfNotNull(
            'ResponsiblePersonUserId',
            this.ResponsiblePersonUserId
        );
        jsonHelper.writeStringFieldIfNotNull('ScrapCode', this.ScrapCode);
        jsonHelper.writeStringFieldIfNotNull(
            'StartDate',
            P360Helper.getDatetimeFormatGMT(this.StartDate)
        );
        jsonHelper.writeNestedObjectList(
            'UnregisteredContacts',
            this.UnregisteredContacts
        );
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
     * @description Custom exception class for the `AbstractCaseParameterBase` class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @group Public 360 Integration
     */
    public class AbstractCaseParameterBaseException extends Exception {
    }
}
