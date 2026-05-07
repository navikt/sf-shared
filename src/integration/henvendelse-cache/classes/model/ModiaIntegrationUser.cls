public with sharing class ModiaIntegrationUser {
    private Id cachedUserId;

    public Id userId {
        get {
            if (cachedUserId == null) {
                cachedUserId = getUserId();
            }
            return cachedUserId;
        }
    }

    private Id getUserId() {
        List<User> users = [
            SELECT Id
            FROM User
            WHERE Username LIKE 'modia.integrasjon@nav.no%'
        ];
        return users.isEmpty() ? null : users[0].Id;
    }
}
