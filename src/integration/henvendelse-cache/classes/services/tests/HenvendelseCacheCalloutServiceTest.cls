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

        Test.startTest();
        HttpResponse result = service.deleteHenvendelseCache('a92121');
        Test.stopTest();

        Assert.areEqual(200, result.getStatusCode());
    }
}
