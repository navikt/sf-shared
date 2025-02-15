/**
 * @description Tests the `P360Helper` class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
 * @since 0.1.0, February 2025
 */
@isTest
private class P360HelperTest {
    /**
     * @description Tests the `getDatetimeFormatGMT` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see P360Helper.getDatetimeFormatGMT
     */
    @isTest
    static void testGetDatetimeFormatGMT() {
        Datetime dt = Datetime.newInstanceGmt(2025, 2, 1, 12, 10, 33);
        String formatted = P360Helper.getDatetimeFormatGMT(dt);
        System.Assert.areEqual(
            '2025-02-01T12:10:33.000Z',
            formatted,
            'Datetime should be formatted correctly'
        );
    }
}
