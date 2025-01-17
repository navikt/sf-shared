@isTest
public class P360TestUtility {
    public static User minimumAccessAPIOnlyIntegrations() {
        Profile minimumAccessAPIOnlyIntegrationsProfile = [
            SELECT Id
            FROM Profile
            WHERE Name = 'Minimum Access - API Only Integrations'
            LIMIT 1
        ];
        User minimumAccessAPIOnlyIntegrationsUser = new User(
            Username = 'minimumAccessAPIOnlyIntegrationsUser@test.sf.nav.no',
            FirstName = 'User',
            LastName = 'Minimum Access API Only Integrations',
            Alias = 'maapioiu',
            Email = 'minimumAccessAPIOnlyIntegrationsUser@test.sf.nav.no',
            ProfileId = minimumAccessAPIOnlyIntegrationsProfile.Id,
            TimeZoneSidKey = 'Europe/Oslo',
            LocaleSidKey = 'no_NO',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert minimumAccessAPIOnlyIntegrationsUser;

        return minimumAccessAPIOnlyIntegrationsUser;
    }
}
