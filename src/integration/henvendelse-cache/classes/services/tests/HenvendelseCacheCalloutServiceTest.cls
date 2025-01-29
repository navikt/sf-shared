@IsTest
public class HenvendelseCacheCalloutServiceTest {
    private static HenvendelseCacheCalloutService service = new HenvendelseCacheCalloutService();

    @IsTest
    static void shouldGetStatusCode200WhenDeletingHenvendelseCache() {
        ApiMock.setTestMock(
            HenvendelseCacheCalloutService.SERVICES.DELETE_HENVENDELSE_CACHE_API.name(),
            200,
            'OK'
        );

        Set<String> actorIds = new Set<String>{ 'a92121', 'b3432432' };
        Test.startTest();
        HttpResponse result = service.deleteHenvendelseCache(actorIds);
        Test.stopTest();

        Assert.areEqual(200, result.getStatusCode());
    }
}
