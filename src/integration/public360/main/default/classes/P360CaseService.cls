/**
 * @description This P360 Case Service class is part of the Public 360 integration
 * and is used as a service class for all related to cases in Public 360.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, NAV
 * @since 0.1.0, November 2024
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @example
 *
 */
public class P360CaseService {
    /**
     * @description This constant is used to define the case service in the Public 360 API.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, November 2024
     */
    public static final String CASE_SERVICE = 'CaseService';

    /**
     * @description The operation type for creating a case in Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, November 2024
     */
    public static final String CREATE_CASE = 'CreateCase';

    /**
     * @description The operation type for updating a case in Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, November 2024
     */
    public static final String UPDATE_CASE = 'updateCase';

    /**
     * @description This operation is used to get a case from Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, November 2024
     */
    public static final String GET_CASE = 'getCase';

    /**
     * @description The operation type that is used in the current case service context.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, November 2024
     */
    @TestVisible
    public String operationType { get; private set; }

    /**
     * @description The request body that is sent to the operation.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, November 2024
     */
    @TestVisible
    public String requestBody { get; private set; }

    /**
     * @description The Http Response object that is returned from the operation.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, November 2024
     */
    @TestVisible
    public HttpResponse operationResponse { get; private set; }

    /**
     * @description The create case method is used to create a new case in Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, November 2024
     * @return `P360CaseService` The current instance of the P360CaseService class.
     */
    public P360CaseService createCase(CreateCaseParameter requestBody) {
        this.operationType = CREATE_CASE;
        this.requestBody = JSON.serialize(requestBody);

        return this;
    }

    public P360CaseService updateCase() {
        this.operationType = UPDATE_CASE;

        return this;
    }

    public P360CaseService getCase() {
        this.operationType = GET_CASE;

        return this;
    }

    /**
     * @description This method is used to send the request to the Public 360 API.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, November 2024
     */
    public P360CaseService send() {
        this.operationResponse = callout(this.operationType, this.requestBody);

        return this;
    }

    /**
     * @description
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 2023-06-26 Created.
     *
     * @param notificationService
     */
    @future(callout=true)
    public static void sendAsync(String operationType, String requestBody) {
        callout(operationType, requestBody);
    }

    @TestVisible
    private static HttpResponse callout(
        String operationType,
        String requestBody
    ) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(
            'callout:NavPublic360Integration' +
                '/' +
                CASE_SERVICE +
                '/' +
                operationType
        );
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(requestBody);

        Http http = new Http();
        HttpResponse response = http.send(request);

        return response;
    }

    /**
     * @description This class is used to represent a create case parameter in the Public 360 API.
     * Swagger:
     * - CaseService - 4.0.0
     * - [ Base URL: /Biz/v2/api/call/SI.Data.RPC/SI.Data.RPC/CaseService ]
     *
     * @author Kenneth Soerensen ((kenneth.sorensen@nav.com), NAV
     * @since 0.1.0, November 2024
     * @group Public 360 Integration
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     *
     */
    @SuppressWarnings(
        'PMD.FieldNamingConventions, PMD.ExcessivePublicCount, PMD.TooManyFields'
    )
    public class CreateCaseParameter {
        public String ClosedDate;
        public String CaseType;
        public String DefaultValueSet;
        public String ADContextUser;
        public ExternalIdParameter ExternalId;
        public String Title;
        public String UnofficialTitle;
        public String Status;
        public String StartDate;
        public String JournalUnit;
        public String SubArchive;
        public List<ArchiveCodeParameter> ArchiveCodes;
        public Boolean FiledOnPaper;
        public List<String> Keywords;
        public String AccessCode;
        public String Paragraph;
        public String AccessGroup;
        public String Notes;
        public Integer ResponsibleEnterpriseRecno;
        public String ResponsibleEnterpriseNumber;
        public Integer ResponsiblePersonRecno;
        public String ResponsiblePersonIdNumber;
        public String ResponsiblePersonEmail;
        public String ResponsiblePersonUserId;
        public List<RemarkParameter> Remarks;
        public List<ContactParameter> Contacts;
        public List<UnregisteredContactsParameter> UnregisteredContacts;
        public String Project;
        public String ScrapCode;
        public List<String> ReferringCases;
        public String Category;
        public List<EstateParameter> Estates;
        public List<AdditionalFieldParameter> AdditionalFields;
        public String ProgressPlanId;
        public List<PermissionParameter> Permissions;
        public List<AdditionalFieldParameter> AdditionalListFields;
        public String eArchiveXMLFragment;
        public String ImportedCaseNumber;
    }

    /**
     * @description This class is used to represent an archive code parameter in the Public 360 API.
     *
     * @author Kenneth Soerensen ((kenneth.sorensen@nav.com), NAV
     * @since 0.1.0, November 2024
     * @group Public 360 Integration
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     *
     */
    @SuppressWarnings('PMD.FieldNamingConventions')
    public class ArchiveCodeParameter {
        public String ArchiveCode;
        public String ArchiveType;
        public Integer SortOrder; // TODO: Should be name: Sort, but this is a reserved keyword in Apex - Need to convert correctly in the JSON payload we generate  from the data structure.
        public Boolean IsManualText;
    }

    /**
     * @description This class is used to represent an remark parameter in the Public 360 API.
     *
     * @author Kenneth Soerensen ((kenneth.sorensen@nav.com), NAV
     * @since 0.1.0, November 2024
     * @group Public 360 Integration
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     *
     */
    @SuppressWarnings('PMD.FieldNamingConventions')
    public class RemarkParameter {
        public String Title;
        public String Content;
        public String RemarkType;
    }

    /**
     * @description This class is used to represent an contact parameter in the Public 360 API.
     *
     * @author Kenneth Soerensen ((kenneth.sorensen@nav.com), NAV
     * @since 0.1.0, November 2024
     * @group Public 360 Integration
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     *
     */
    @SuppressWarnings('PMD.FieldNamingConventions')
    public class ContactParameter {
        public String Role;
        public String ExternalId;
        public String ReferenceNumber;
        public Boolean IsUnofficial;
        public String ContactId;
    }

    /**
     * @description This class is used to represent an unregistered contact parameter in the Public 360 API.
     *
     * @author Kenneth Soerensen ((kenneth.sorensen@nav.com), NAV
     * @since 0.1.0, November 2024
     * @group Public 360 Integration
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     *
     */
    @SuppressWarnings('PMD.FieldNamingConventions')
    public class UnregisteredContactsParameter {
        public String Role;
        public Boolean IsUnofficial;
        public String ContactName;
        public String ContactCompanyName;
        public String ReferenceNumber;
        public String Address;
        public String Country;
        public String MobilePhone;
        public String Phone;
        public String Email;
        public String State;
        public String ZipCode;
        public String ZipPlace;
    }

    /**
     * @description This class is used to represent an estate parameter in the Public 360 API.
     *
     * @author Kenneth Soerensen ((kenneth.sorensen@nav.com), NAV
     * @since 0.1.0, November 2024
     * @group Public 360 Integration
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     *
     */
    @SuppressWarnings('PMD.FieldNamingConventions')
    public class EstateParameter {
        public Integer Recno;
        public String ExternalId;
    }

    /**
     * @description This class is used to represent an additional field parameter in the Public 360 API.
     *
     * @author Kenneth Soerensen ((kenneth.sorensen@nav.com), NAV
     * @since 0.1.0, November 2024
     * @group Public 360 Integration
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     *
     */
    @SuppressWarnings('PMD.FieldNamingConventions')
    public class AdditionalFieldParameter {
        public String Name;
        public String Value;
        public OperatorTypeParameter OperatorType;
    }

    /**
     * @description This class is used to represent an operator type parameter in the Public 360 API.
     *
     * @author Kenneth Soerensen ((kenneth.sorensen@nav.com), NAV
     * @since 0.1.0, November 2024
     * @group Public 360 Integration
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     *
     */
    @SuppressWarnings('PMD.FieldNamingConventions')
    public class OperatorTypeParameter {
        public String Value;
    }

    /**
     * @description This class is used to represent an permission parameter in the Public 360 API.
     *
     * @author Kenneth Soerensen ((kenneth.sorensen@nav.com), NAV
     * @since 0.1.0, November 2024
     * @group Public 360 Integration
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     *
     */
    @SuppressWarnings('PMD.FieldNamingConventions')
    public class PermissionParameter {
        public String AccessGroup;
        public String ContactExternalId;
        public String AccessLevel;
        public Boolean Grant;
        public Boolean ViewFile;
        public Boolean InsertFile;
        public Boolean ModifyFile;
        public Boolean InsertRev;
        public Boolean ModifyRev;
        public Boolean InsertDoc;
        public String Reference;
    }

    /**
     * @description This class is used to represent an additional list field parameter in the Public 360 API.
     *
     * @author Kenneth Soerensen ((kenneth.sorensen@nav.com), NAV
     * @since 0.1.0, November 2024
     * @group Public 360 Integration
     * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
     *
     */
    @SuppressWarnings('PMD.FieldNamingConventions')
    public class AdditionalListFieldParameter {
        public String Name;
        public Object Value;
    }
}
