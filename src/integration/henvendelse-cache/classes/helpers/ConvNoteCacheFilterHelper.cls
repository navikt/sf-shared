public with sharing class ConvNoteCacheFilterHelper {
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
