global class ThreadCacheHandler extends MyTriggers {
    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        List<String> fieldNamesToCheck = new List<String>{
            'CRM_Incorrectly_Sent__c'
        };

        List<Thread__c> threadsWithRelevantChanges = new List<Thread__c>();

        for (Thread__c record : (List<Thread__c>) records) {
            Thread__c recordOld = (Thread__c) triggerOldMap.get(record.Id);

            if (
                MyTriggers.hasChangedFields(
                    fieldNamesToCheck,
                    record,
                    recordOld
                )
            ) {
                threadsWithRelevantChanges.add(record);
            }
        }
        createHenvendelseCacheQueueable(threadsWithRelevantChanges);
    }

    private void createHenvendelseCacheQueueable(List<Thread__c> threadList) {
        Set<Id> recordIds = ThreadCacheFilterHelper.getRecordIdsRequiringCacheClear(
            threadList
        );

        if (recordIds.isEmpty()) {
            return;
        }
        System.enqueueJob(
            new ClearHenvendelseCacheQueueable(recordIds, 'Thread__c')
        );
    }
}
