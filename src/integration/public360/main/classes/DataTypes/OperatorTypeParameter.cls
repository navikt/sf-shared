/**
 * @description This class is used to represent an estate parameter in the Public 360 API.
 * See the Public 360 API documentation for more information on the fields.
 * The class is intended to be used in conjunction with the Public 360 API.
 * Features:
 * - The class can be serialized to and deserialized from JSON.
 * - The class also has a `validation` method to ensure that mandatory fields are set.
 * - The class has a private `constructor` for use with the `fromJson` method.
 * - The class has a custom exception class for use with the `validation` method.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, January 2025
 * @group Public 360 Integration
 * @see [Public 360 SIF API Documentation](https://help.360online.com/ReleaseInformation/SIF%20APIs%20-%20Documentation.pdf)
 * @example
 * OperatorTypeParameter operatorTypeParameter = new OperatorTypeParameter();
 * String json = operatorTypeParameter.toJson();
 * OperatorTypeParameter deserializedOperatorTypeParameter = OperatorTypeParameter.fromJson(json);
 */
@SuppressWarnings('PMD.FieldNamingConventions')
public class OperatorTypeParameter {
    /**
     * @description The `Value` field of the estate.
     * See Public 360 API documentation for details.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     */
    public String Value;

    private OperatorTypeParameter() {
    }
}
