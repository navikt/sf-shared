global class ThreadCacheHandler extends MyTriggers {
    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        List<String> generaUpdateFieldChange = new List<String>{
            'STO_Category__c',
            'CRM_Thread_Type__c'
        };

        List<HenvendelseUpdateWrapper> threadsWithRelevantChanges = new List<HenvendelseUpdateWrapper>();

        for (Thread__c record : (List<Thread__c>) records) {
            Thread__c recordOld = (Thread__c) triggerOldMap.get(record.Id);
            Boolean isRedactionChange = false;
            Boolean isCloseThreadChange = false;
            Boolean isGeneralUpdateChange = false;

            if (
                MyTriggers.hasChangedFields(
                    generaUpdateFieldChange,
                    record,
                    recordOld
                )
            ) {
                isGeneralUpdateChange = true;
            }

            if (
                MyTriggers.hasChangedFields(
                    new List<String>{ 'STO_Sensitive_Information__c' },
                    record,
                    recordOld
                )
            ) {
                isRedactionChange = true;
            }

            if (
                MyTriggers.hasChangedFields(
                    new List<String>{ 'CRM_Closed_Date__c' },
                    record,
                    recordOld
                )
            ) {
                isCloseThreadChange = true;
            }

            if (
                isGeneralUpdateChange ||
                isRedactionChange ||
                isCloseThreadChange
            ) {
                HenvendelseUpdateWrapper wrapper = new HenvendelseUpdateWrapper();
                wrapper.thread = record;
                wrapper.isGeneralUpdate = isGeneralUpdateChange;
                wrapper.isRedactionChange = isRedactionChange;
                wrapper.isCloseThreadChange = isCloseThreadChange;
                threadsWithRelevantChanges.add(wrapper);
            }
        }

        createHenvendelseCacheQueueable(threadsWithRelevantChanges);
    }

    private void createHenvendelseCacheQueueable(
        List<HenvendelseUpdateWrapper> threadList
    ) {
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
