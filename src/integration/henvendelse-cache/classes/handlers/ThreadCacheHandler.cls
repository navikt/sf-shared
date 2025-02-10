global class ThreadCacheHandler extends MyTriggers {
    ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();

    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        Set<Id> threadIds = new Set<Id>();

        for (Thread__c record : (List<Thread__c>) records) {
            Thread__c oldRecord = (Thread__c) triggerOldMap.get(record.Id);
            Boolean isGeneralUpdateChange = checkForRelevantUpdates(
                record,
                oldRecord
            );
            Boolean isRedactionChange = checkForRedactionUpdates(
                record,
                oldRecord
            );
            Boolean isThreadClosing = checkForThreadClosing(record, oldRecord);

            if (
                (isGeneralUpdateChange &&
                record.LastModifiedById != modiaIntegrationUser.UserId) ||
                isRedactionChange ||
                isThreadClosing
            ) {
                threadIds.add(record.Id);
            }
        }
        if (!threadIds.isEmpty()) {
            System.enqueueJob(
                new ClearHenvendelseCacheQueueable(threadIds, 'Thread__c')
            );
        }
    }

    private Boolean checkForRelevantUpdates(
        Thread__c record,
        Thread__c oldRecord
    ) {
        List<String> generaUpdateFieldChange = new List<String>{
            'STO_Category__c',
            'CRM_Thread_Type__c'
        };

        return MyTriggers.hasChangedFields(
            generaUpdateFieldChange,
            record,
            oldRecord
        );
    }

    private Boolean checkForRedactionUpdates(
        Thread__c record,
        Thread__c oldRecord
    ) {
        return MyTriggers.hasChangedFields(
            new List<String>{ 'STO_Sensitive_Information__c' },
            record,
            oldRecord
        );
    }

    private Boolean checkForThreadClosing(
        Thread__c record,
        Thread__c oldRecord
    ) {
        return MyTriggers.hasChangedFields(
            new List<String>{ 'CRM_Closed_Date__c' },
            record,
            oldRecord
        );
    }
}
