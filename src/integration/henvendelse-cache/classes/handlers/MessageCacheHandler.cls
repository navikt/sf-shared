global class MessageCacheHandler extends MyTriggers {
    global override void onAfterInsert() {
        createHenvendelseCacheQueueable((List<Message__c>) records);
    }

    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        List<Message__c> messagesWithRelevantChanges = new List<Message__c>();
        for (Message__c record : (List<Message__c>) records) {
            Message__c oldRecord = (Message__c) triggerOldMap.get(record.Id);
            if (
                MyTriggers.hasChangedFields(
                    new List<String>{ 'CRM_Read__c' },
                    record,
                    oldRecord
                )
            ) {
                messagesWithRelevantChanges.add(record);
            }
        }
        if (!messagesWithRelevantChanges.isEmpty()) {
            createHenvendelseCacheQueueable(messagesWithRelevantChanges);
        }
    }

    private void createHenvendelseCacheQueueable(List<Message__c> messageList) {
        Set<Id> recordIds = MessageCacheFilterHelper.getRecordIdsRequiringCacheClear(
            messageList
        );
        if (recordIds.isEmpty()) {
            return;
        }
        System.enqueueJob(
            new ClearHenvendelseCacheQueueable(recordIds, 'Message__c')
        );
    }
}
