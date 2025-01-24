public with sharing class ConvNoteCacheFilterHelper {
    public static Set<Id> getRecordIdsRequiringCacheClear(
        List<Conversation_Note__c> convNoteList
    ) {
        ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();
        Set<Id> recordIds = new Set<Id>();
        for (Conversation_Note__c convNote : convNoteList) {
            //Only cache records modified in Salesforce
            if (convNote.LastModifiedById != modiaIntegrationUser.UserId) {
                recordIds.add(convNote.Id);
            }
        }
        return recordIds;
    }
}
