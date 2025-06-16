@RestResource(urlMapping='/audit-logging/person-idents')
global with sharing class AuditLoggingPersonIdentService {
    @HttpPost
    global static void getPersonIdents() {
        PersonIdentRequest request = (PersonIdentRequest) JSON.deserialize(
            RestContext.request.requestBody.toString(),
            PersonIdentRequest.class
        );

        List<String> recordIds = request.recordIds;
        String soqlQuery =
            'SELECT Id, ' +
            request.personIdentField +
            ' FROM ' +
            request.objectName +
            ' WHERE Id IN :recordIds' +
            ' WITH SECURITY_ENFORCED';

        try {
            List<SObject> records = Database.query(soqlQuery);
            List<PersonIdentResponse> responses = new List<PersonIdentResponse>();
            for (SObject record : records) {
                PersonIdentResponse response = new PersonIdentResponse();
                response.recordId = (String) record.get('Id');
                response.personIdent = getPersonIdent(
                    request.personIdentField,
                    record
                );
                responses.add(response);
            }

            // Serialize the response to JSON
            setResponse(200, JSON.serialize(responses));
        } catch (Exception e) {
            // Handle any exceptions and return a 500 status code
            setResponse(500, e.getMessage());
        }
    }
    global class PersonIdentRequest {
        global String objectName;
        global String personIdentField;
        global List<String> recordIds;
    }

    private static void setResponse(Integer statusCode, String payload) {
        RestResponse response = RestContext.response;
        response.statusCode = statusCode;
        response.responseBody = Blob.valueOf(payload);
        response.addHeader('Content-Type', 'application/json');
    }

    private static String getPersonIdent(
        String personIdentField,
        SObject record
    ) {
        if (personIdentField.contains('.')) {
            List<String> parts = personIdentField.split('\\.');
            SObject related = record;
            for (Integer i = 0; i < parts.size() - 1; i++) {
                related = (SObject) related.getSObject(parts[i]);
                if (related == null)
                    break;
            }
            return (related != null &&
                related.get(parts[parts.size() - 1]) != null)
                ? String.valueOf(related.get(parts[parts.size() - 1]))
                : null;
        }
        return (String) record.get(personIdentField);
    }

    global class PersonIdentResponse {
        global String recordId;
        global String personIdent;
    }
}
