/**
 * @description This P360 Case Service class is part of the Public 360 integration
 * and is used as a service class for all related to cases in Public 360.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, November 2024
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @example
 *
 */
public class P360CaseService {
    /**
     * @description This enum is used to define the different case operations that can be performed
     * in Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public enum CaseOperation {
        CREATE_CASE,
        UPDATE_CASE,
        GET_CASE
    }

    /**
     * @description This constant is used to define the case service in the Public 360 API.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     */
    public static final String CASE_SERVICE = 'CaseService';

    /**
     * @description The operation type for creating a case in Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     */
    public static final String CREATE_CASE = 'CreateCase';

    /**
     * @description The operation type for updating a case in Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     */
    public static final String UPDATE_CASE = 'UpdateCase';

    /**
     * @description This operation is used to get a case from Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     */
    public static final String GET_CASE = 'GetCases';

    @TestVisible
    public String calloutName { get; private set; }

    /**
     * @description The operation type that is used in the current case service context.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     */
    @TestVisible
    public CaseOperation operationType { get; private set; }

    /**
     * @description The request body that is sent to the operation.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     */
    @TestVisible
    public String requestBody { get; private set; }

    /**
     * @description The Http Response object that is returned from the operation.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     */
    @TestVisible
    public HttpResponse operationResponse { get; private set; }

    public P360CaseService(String calloutName) {
        this.calloutName = calloutName;
    }

    /**
     * @description The create case method is used to create a new case in Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     * @return `P360CaseService` The current instance of the P360CaseService class.
     */
    public P360CaseService createCase(CreateCaseParameter requestBody) {
        this.operationType = CaseOperation.CREATE_CASE;
        this.requestBody = requestBody.toJson();

        return this;
    }

    /**
     * @description The update case method is used to update a case in Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>
     * @since 0.1.0, November 2024
     * @return `P360CaseService` The current instance of the P360CaseService class.
     * TODO: Implement the updateCase method.
     */
    public P360CaseService updateCase() {
        this.operationType = CaseOperation.UPDATE_CASE;

        return this;
    }

    /**
     * @description The get case method is used to get a case from Public 360.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     * @return `P360CaseService` The current instance of the P360CaseService class.
     */
    public P360CaseService getCase(GetCasesQuery requestBody) {
        this.operationType = CaseOperation.GET_CASE;
        this.requestBody = requestBody.toJson();

        return this;
    }

    /**
     * @description This method is used to get the status code from the operation response.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return `Integer` The status code from the operation response.
     */
    public Integer getStatusCode() {
        return this.operationResponse.getStatusCode();
    }

    /**
     * @description This method is used to get the status from the operation response.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return `String` The status from the operation response.
     */
    public String getStatus() {
        return this.operationResponse.getStatus();
    }

    /**
     * @description This method is used to get the body from the operation response.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return `String` The body from the operation response.
     */
    public String getBody() {
        return this.operationResponse.getBody();
    }

    /**
     * @description This method is used to get the response from the operation response.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @return `Object` The response from the operation response.
     */
    public Object getResponse() {
        switch on this.operationType {
            when CREATE_CASE {
                return CaseOperationResult.fromJson(
                    this.operationResponse.getBody()
                );
            }
            when UPDATE_CASE {
                return null; //return GetCasesQuery.fromJson(this.operationResponse.getBody());
            }
            when GET_CASE {
                return GetCasesResult.fromJson(
                    this.operationResponse.getBody()
                );
            }
            when else {
                return null;
            }
        }
    }

    /**
     * @description This method is used to send the request to the Public 360 API.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     * @return `P360CaseService` The current instance of the P360CaseService class.
     */
    public P360CaseService send() {
        this.operationResponse = callout(
            getOperationValue(this.operationType),
            this.requestBody,
            this.calloutName
        );

        return this;
    }

    /**
     * @description This method is used to send the request to the Public 360 API asynchronously.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     * @param notificationService
     */
    @future(callout=true)
    public static void sendAsync(
        String operationType,
        String requestBody,
        String calloutName
    ) {
        callout(operationType, requestBody, calloutName);
    }

    /**
     * @description This method is used to send the request to the Public 360 API asynchronously.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, November 2024
     * @param operationType The operation type to perform.
     * @param requestBody The request body to send.
     * @param calloutName The name of the callout to use.
     * @param callback The callback to execute when the operation is completed.
     */
    @TestVisible
    private static HttpResponse callout(
        String operationType,
        String requestBody,
        String calloutName
    ) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(
            'callout:' + calloutName + '/' + CASE_SERVICE + '/' + operationType
        );
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(requestBody);

        Http http = new Http();
        HttpResponse response = http.send(request);

        return response;
    }

    /**
     * @description This map is used to map the `CaseOperation` enum to the operation string value.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see CaseOperation
     */
    private static Map<CaseOperation, String> operationMap = new Map<CaseOperation, String>{
        CaseOperation.CREATE_CASE => P360CaseService.CREATE_CASE,
        CaseOperation.UPDATE_CASE => P360CaseService.UPDATE_CASE,
        CaseOperation.GET_CASE => P360CaseService.GET_CASE
    };

    /**
     * @description This method is used to get the operation value from the operation map.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @param operation The operation to get the value for.
     * @return `String` The operation value.
     */
    private static String getOperationValue(CaseOperation operation) {
        return operationMap.get(operation);
    }
}
