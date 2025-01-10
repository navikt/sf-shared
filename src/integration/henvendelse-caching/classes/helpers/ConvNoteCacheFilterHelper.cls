public without sharing class ConvNoteCacheFilterHelper {
    private LoggerUtility logger = new LoggerUtility('HenvendelseCaching');
    private ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();

    public static Set<String> getActorIdsWithDirtyCache(Set<Id> recordIds) {
        Set<String> actorIds = new Set<String>();
        for (Conversation_Note__c convNote : [
            SELECT CRM_Account__r.CRM_Person__r.INT_ActorId__c
            FROM Conversation_Note__c
            WHERE Id IN :recordIds
            //       AND LastModifedById != :modiaIntegrationUser.UserId
        ]) {
            if (convNote.CRM_Account__r.CRM_Person__r.INT_ActorId__c != null) {
                actorIds.add(
                    convNote.CRM_Account__r.CRM_Person__r.INT_ActorId__c
                );
            }
        }
        return actorIds;
    }
}
