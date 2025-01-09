@IsTest
public class HenvendelseMirroringCalloutServiceTest {
    private static HenvendelseMirroringCalloutService service = new HenvendelseMirroringCalloutService();

    @isTest
    static void shouldPostHenvendelseWithStatusCode200AsResult() {
        ApiMock.setTestMock(
            HenvendelseMirroringCalloutService.SERVICES.POST_HENVENDELSE_MIRRORING_API.name(),
            200,
            'OK'
        );

        String body = '{test}';
        Test.startTest();
        HttpResponse resp = service.postHenvendelse(body);
        Test.stopTest();

        Assert.areEqual(
            200,
            resp.getStatusCode(),
            'Returned status code should be 200'
        );
    }

    @isTest
    static void shouldPutHenvendelseWithStatusCode200AsResult() {
        ApiMock.setTestMock(
            HenvendelseMirroringCalloutService.SERVICES.PUT_HENVENDELSER_MIRRORING_API.name(),
            200,
            'OK'
        );

        String body = '{test}';
        Test.startTest();
        HttpResponse resp = service.putHenvendelser(body);
        Test.stopTest();

        Assert.areEqual(
            200,
            resp.getStatusCode(),
            'Returned status code should be 200'
        );
    }
}
