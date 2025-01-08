public with sharing class HenvendelseMirroringService {
    private static LoggerUtility logger = new LoggerUtility(
        'Henvendelse Mirroring'
    );

    public static Boolean postHenvendelser(
        List<CRM_Henvendelse> henvendelseList,
        Set<Id> henvendelsesIds
    ) {
        HttpResponse response;
        if (henvendelseList.size() == 1) {
            String jsonBody = JSON.serializePretty(henvendelseList);
            response = new HenvendelseMirroringCalloutService()
                .postHenvendelse(jsonBody);
        } else if (henvendelseList.size() > 1) {
            String jsonBody = '[';

            for (Integer i = 0; i < henvendelseList.size(); i++) {
                jsonBody += '[';
                jsonBody += JSON.serializePretty(henvendelseList[i]);
                jsonBody += ']';
                if (i < henvendelseList.size() - 1) {
                    jsonBody += ',';
                }
            }
            jsonBody += ']';
            response = new HenvendelseMirroringCalloutService()
                .putHenvendelser(jsonBody);
        }

        if (response.getStatusCode() != 200) {
            logger.error(
                'Unbale to publish ' +
                    henvendelsesIds.toString() +
                    'to db ' +
                    response.getBody(),
                null,
                CRM_ApplicationDomain.Domain.NKS
            );
            logger.publish();
            return false;
        }
        return true;
    }
}
