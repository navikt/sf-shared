global class MessageCacheHandler extends MyTriggers {
    ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();

    global override void onAfterInsert() {
        Set<Id> threadIds = new Set<Id>();
        for (Message__c record : (List<Message__c>) records) {
            if (record.CreatedById != modiaIntegrationUser.UserId) {
                threadIds.add(record.CRM_Thread__c);
            }
        }

        if (!threadIds.isEmpty()) {
            System.enqueueJob(
                new ClearHenvendelseCacheQueueable(null, threadIds)
            );
        }
    }

    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        Set<Id> threadIds = new Set<Id>();
        for (Message__c record : (List<Message__c>) records) {
            Message__c oldRecord = (Message__c) triggerOldMap.get(record.Id);
            if (
                record.LastModifiedById != modiaIntegrationUser.UserId &&
                checkForRelevantUpdates(record, oldRecord)
            ) {
                threadIds.add(record.CRM_Thread__c);
            }
        }
        if (!threadIds.isEmpty()) {
            System.enqueueJob(
                new ClearHenvendelseCacheQueueable(null, threadIds)
            );
        }
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
