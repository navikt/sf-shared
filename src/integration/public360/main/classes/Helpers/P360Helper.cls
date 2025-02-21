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

    /**
     * @description Deserializes a JSON string into a `Datetime` object instance.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @param dateObject The JSON string to deserialize.
     * @return `Datetime` The deserialized object instance from the JSON string.
     */
    public static Datetime deserializeToDatetime(Object dateObject) {
        if (dateObject == null) {
            return null;
        }
        return (Datetime) JSON.deserialize(
            '"' + dateObject + '"',
            Datetime.class
        );
    }
}
