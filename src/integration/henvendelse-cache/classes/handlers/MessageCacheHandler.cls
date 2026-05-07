global class MessageCacheHandler extends MyTriggers {
    ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();

    global override void onAfterInsert() {
        Set<Id> threadIds = new Set<Id>();
        for (Message__c record : (List<Message__c>) records) {
            if (
                record.CreatedById != modiaIntegrationUser.UserId &&
                record.CRM_Type__c == 'Message' &&
                record.CRM_Thread__c != null
            ) {
                threadIds.add(record.CRM_Thread__c);
            }
        }

        HenvendelseCacheQueueDispatcher.addThreadIds(threadIds);
    }

    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        Set<Id> threadIds = new Set<Id>();
        for (Message__c record : (List<Message__c>) records) {
            Message__c oldRecord = (Message__c) triggerOldMap.get(record.Id);
            if (
                record.LastModifiedById != modiaIntegrationUser.UserId &&
                checkForRelevantUpdates(record, oldRecord) &&
                record.CRM_Thread__c != null
            ) {
                threadIds.add(record.CRM_Thread__c);
            }
        }

        HenvendelseCacheQueueDispatcher.addThreadIds(threadIds);
    }

    private Boolean checkForRelevantUpdates(
        Message__c record,
        Message__c oldRecord
    ) {
        List<String> fieldNamesToCheck = new List<String>{ 'CRM_Read__c' };

        return MyTriggers.hasChangedFields(
            fieldNamesToCheck,
            record,
            oldRecord
        );
    }
}