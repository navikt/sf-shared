public with sharing class ConvertStringUtil {
    public static String convertSetToCommaSeparatedString(
        Set<String> setOfStrings
    ) {
        return String.join(new List<String>(setOfStrings), ',');
    }
}
