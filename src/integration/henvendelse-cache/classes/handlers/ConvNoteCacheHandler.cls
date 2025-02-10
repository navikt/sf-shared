global class ConvNoteCacheHandler extends MyTriggers {
    ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();

    global override void onAfterInsert() {
        Set<Id> convNoteIds = new Set<Id>();
        for (
            Conversation_Note__c record : (List<Conversation_Note__c>) records
        ) {
            //Ignore conversation notes created by Modia. Should be handled in the NAIS app
            if (record.CreatedById != modiaIntegrationUser.UserId) {
                convNoteIds.add(record.Id);
            }
        }

        if (!convNoteIds.isEmpty()) {
            System.enqueueJob(
                new ClearHenvendelseCacheQueueable(convNoteIds, null)
            );
        }
    }

    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        Set<Id> convNoteIds = new Set<Id>();
        for (
            Conversation_Note__c record : (List<Conversation_Note__c>) records
        ) {
            Conversation_Note__c oldRecord = (Conversation_Note__c) triggerOldMap.get(
                record.Id
            );
            Boolean isGeneralUpdate = checkForRelevantUpdates(
                record,
                oldRecord
            );
            Boolean isRedactionChange = checkForRedactionChange(
                record,
                oldRecord
            );

            //Ignore updates by Modia, except redaction requests
            if (
                (isGeneralUpdate &&
                record.LastModifiedById != modiaIntegrationUser.UserId) ||
                isRedactionChange
            ) {
                convNoteIds.add(record.Id);
            }
        }
        if (!convNoteIds.isEmpty()) {
            System.enqueueJob(
                new ClearHenvendelseCacheQueueable(convNoteIds, null)
            );
        }
    }

    private Boolean checkForRelevantUpdates(
        Conversation_Note__c record,
        Conversation_Note__c oldRecord
    ) {
        List<String> fieldNamesToCheck = new List<String>{
            'CRM_Communication_Channel__c',
            'CRM_Disposal_Datetime__c',
            'CRM_Incorrectly_Sent__c',
            'CRM_Is_Read__c',
            'STO_Sensitive_Information__c',
            'CRM_Subtheme__c',
            'CRM_Theme__c',
            'CRM_Is_Redacted__c'
        };

        return MyTriggers.hasChangedFields(
            fieldNamesToCheck,
            record,
            oldRecord
        );
    }

    private Boolean checkForRedactionChange(
        Conversation_Note__c record,
        Conversation_Note__c oldRecord
    ) {
        return MyTriggers.hasChangedFields(
            new List<String>{ 'STO_Sensitive_Information__c' },
            record,
            oldRecord
        );
    }
}
