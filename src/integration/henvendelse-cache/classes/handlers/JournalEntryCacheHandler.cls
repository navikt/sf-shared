global class JournalEntryCacheHandler extends MyTriggers {
    ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();

    global override void onAfterInsert() {
        Set<Id> conversationNoteIds = new Set<Id>();
        for (Journal_Entry__c record : (List<Journal_Entry__c>) records) {
            if (
                (record.CRM_Conversation_Note__c != null ||
                record.CRM_Journal_Post_Type__c == 'INNGAAENDE' ||
                record.CRM_Journal_Post_Type__c == 'UTGAAENDE') &&
                record.CreatedById != modiaIntegrationUser.UserId
            ) {
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
                new List<String>{
                    'Journal_Entry_Status__c',
                    'Journal_Entry_ID__c'
                },
                record,
                oldRecord
            );

            if (shouldAddThreadId(record, oldRecord)) {
                threadIds.add(record.CRM_Thread__c);
            }
        }
        
        if (!threadIds.isEmpty()) {
            System.enqueueJob(
                new ClearHenvendelseCacheQueueable(null, threadIds)
            );
        }
    }

    private Boolean shouldAddThreadId(
        Journal_Entry__c record,
        Journal_Entry__c oldRecord
    ) {
        if (record.LastModifiedById == modiaIntegrationUser.UserId) {
            return false;
        }
        return record.CRM_Thread__c != null &&
            ((record.Journal_Entry_Status__c == 'Completed' ||
            record.Journal_Entry_Status__c == 'Failed') ||
            (oldRecord.Journal_Entry_ID__c == null &&
            record.Journal_Entry_ID__c != null));
    }
}
