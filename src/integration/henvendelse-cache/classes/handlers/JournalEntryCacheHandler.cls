global class JournalEntryCacheHandler extends MyTriggers {
    global override void onAfterInsert() {
        Set<Id> conversationNoteIds = new Set<Id>();
        for (Journal_Entry__c record : (List<Journal_Entry__c>) records) {
            if (record.CRM_Conversation_Note__c != null) {
                conversationNoteIds.add(record.CRM_Conversation_Note__c);
            }
        }

        if (!conversationNoteIds.isEmpty()) {
            System.enqueueJob(
                new ClearHenvendelseCacheQueueable(conversationNoteIds, null)
            );
        }
    }

    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        Set<Id> threadIds = new Set<Id>();
        for (Journal_Entry__c record : (List<Journal_Entry__c>) records) {
            if (record.CRM_Thread__c != null) {
                threadIds.add(record.CRM_Thread__c);
            }
        }

        if (!threadIds.isEmpty()) {
            System.enqueueJob(
                new ClearHenvendelseCacheQueueable(null, threadIds)
            );
        }
    }
}
