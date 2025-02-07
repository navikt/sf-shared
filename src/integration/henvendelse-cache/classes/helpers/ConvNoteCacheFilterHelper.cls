public with sharing class ConvNoteCacheFilterHelper {
    public static Set<Id> getRecordIdsRequiringCacheClear(
        List<HenvendelseUpdateWrapper> convNoteList
    ) {
        ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();
        Set<Id> recordIds = new Set<Id>();
        for (HenvendelseUpdateWrapper wrapper : convNoteList) {
            //Only cache records created in Salesforce
            if (
                wrapper.convNote.LastModifiedById !=
                modiaIntegrationUser.UserId ||
                wrapper.isRedactionChange //Updates from Modia should be handled by the NAIS-app, except redaction requests
            ) {
                recordIds.add(wrapper.convNote.Id);
            }
        }
        return recordIds;
    }

    public static Set<String> getActorIds(Set<Id> conversationNoteIds) {
        Set<String> actorIds = new Set<String>();
        for (Conversation_Note__c convNote : [
            SELECT Id, CRM_Account__r.CRM_Person__r.INT_ActorId__c
            FROM Conversation_Note__c
            WHERE Id IN :conversationNoteIds
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
