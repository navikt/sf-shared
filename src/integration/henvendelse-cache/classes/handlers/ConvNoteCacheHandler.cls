global class ConvNoteCacheHandler extends MyTriggers {
    global override void onAfterInsert() {
        createHenvendelseCacheQueueable(
            (List<Conversation_Note__c>) records,
            false
        );
    }
    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        List<String> fieldNamesToCheck = new List<String>{
            'CRM_Communication_Channel__c',
            'CRM_Disposal_Datetime__c',
            'CRM_Incorrectly_Sent__c',
            'CRM_Is_Read__c',
            'STO_Sensitive_Information__c',
            'CRM_Subtheme__c',
            'CRM_Theme__c',
            'CRM_Is_Redacted__c',
            'STO_Sensitive_Information__c'
        };

        List<Conversation_Note__c> convNotesWithRelevantChanges = new List<Conversation_Note__c>();
        for (
            Conversation_Note__c record : (List<Conversation_Note__c>) records
        ) {
            Conversation_Note__c recordOld = (Conversation_Note__c) triggerOldMap.get(
                record.Id
            );

            if (
                MyTriggers.hasChangedFields(
                    fieldNamesToCheck,
                    record,
                    recordOld
                )
            ) {
                convNotesWithRelevantChanges.add(record);
            }
        }
        if (convNotesWithRelevantChanges.isEmpty()) {
            return;
        }
        createHenvendelseCacheQueueable(convNotesWithRelevantChanges, true);
    }

    private void createHenvendelseCacheQueueable(
        List<Conversation_Note__c> convNoteList,
        Boolean isUpdate
    ) {
        Set<Id> recordIds = ConvNoteCacheFilterHelper.getRecordIdsRequiringCacheClear(
            convNoteList,
            isUpdate
        );
        if (recordIds.isEmpty()) {
            return;
        }
        System.enqueueJob(
            new ClearHenvendelseCacheQueueable(
                recordIds,
                'Conversation_Note__c'
            )
        );
    }
}
