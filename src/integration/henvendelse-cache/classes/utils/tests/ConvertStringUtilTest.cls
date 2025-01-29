@IsTest
public class ConvertStringUtilTest {
    @IsTest
    static void shouldReturnCommaSeparatedString() {
        // Given
        Set<String> setOfStrings = new Set<String>{ 'A', 'B', 'C' };
        String expected = 'A,B,C';

        // When
        String actual = ConvertStringUtil.convertSetToCommaSeparatedString(
            setOfStrings
        );

        // Then
        System.assertEquals(expected, actual);
    }
}
