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
            Journal_Entry__c oldRecord = (Journal_Entry__c) triggerOldMap.get(
                record.Id
            );

            MyTriggers.hasChangedFields(
                new List<String>{ 'Journal_Entry_Status__c' },
                record,
                oldRecord
            );

            if (shouldAddThreadId(record)) {
                threadIds.add(record.CRM_Thread__c);
            }

            if (!threadIds.isEmpty()) {
                System.enqueueJob(
                    new ClearHenvendelseCacheQueueable(null, threadIds)
                );
            }
        }
    }

    private Boolean shouldAddThreadId(Journal_Entry__c record) {
        return record.CRM_Thread__c != null &&
            (record.Journal_Entry_Status__c == 'Completed' ||
            record.Journal_Entry_Status__c == 'Failed');
    }
}
