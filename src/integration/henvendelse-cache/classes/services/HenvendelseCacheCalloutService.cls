public with sharing class HenvendelseCacheCalloutService extends ApiController {
    private final string CONFIG_NAME = 'HENVENDELSE_CACHE_API';
    private final string SERVICE_AUTH_HEADER = 'HenvendelseMCache';

    public enum SERVICES {
        DELETE_HENVENDELSE_CACHE_API
    }

    public HttpResponse deleteHenvendelseCache(Set<String> actorIds) {
        Map<String, String> pathParamMap = new Map<String, String>();
        pathParamMap.put(
            'actorIds',
            ConvertStringUtil.convertSetToCommaSeparatedString(actorIds)
        );

        initRequest(
            CONFIG_NAME,
            SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            pathParamMap
        );
        setSystemContext();
        addServiceAuthHeader(SERVICE_AUTH_HEADER);

        setHeaders(
            new Map<String, String>{
                'Content-Type' => 'application/json',
                'accept' => 'application/json'
            }
        );

        doCallout();
        return getResponse();
    }
}
