/**
 * @description Helper class for Public 360 integration
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see Datetime
 * @example
 */
public class P360Helper {
    /**
     * @description Returns the datetime format in GMT.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @param datetimeValue The datetime value to format.
     * @return `String` The formatted datetime string.
     */
    public static String getDatetimeFormatGMT(Datetime datetimeValue) {
        return datetimeValue.formatGMT('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
    }
}
