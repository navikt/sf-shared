public class ThreadCacheHandler extends MyTriggers {
    ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();

    public override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
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

            if (
                (isGeneralUpdateChange &&
                record.LastModifiedById != modiaIntegrationUser.userId) ||
                isRedactionChange
            ) {
                threadIds.add(record.Id);
            }
        }

        HenvendelseCacheQueueDispatcher.addThreadIds(threadIds);
    }

    private Boolean checkForRelevantUpdates(
        Thread__c record,
        Thread__c oldRecord
    ) {
        List<String> generaUpdateFieldChange = new List<String>{
            'STO_Category__c',
            'CRM_Thread_Type__c',
            'CRM_Closed_Date__c'
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
}
