global class ConvNoteCacheHandler extends MyTriggers {
    global override void onAfterInsert() {
        List<HenvendelseUpdateWrapper> convNotes = new List<HenvendelseUpdateWrapper>();
        for (
            Conversation_Note__c record : (List<Conversation_Note__c>) records
        ) {
            HenvendelseUpdateWrapper recordWrapper = new HenvendelseUpdateWrapper();
            recordWrapper.convNote = record;
            convNotes.add(recordWrapper);
        }

        createHenvendelseCacheQueueable(convNotes);
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
            'CRM_Is_Redacted__c'
        };

        List<HenvendelseUpdateWrapper> convNotesWithRelevantChanges = new List<HenvendelseUpdateWrapper>();
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
                HenvendelseUpdateWrapper recordWrapper = new HenvendelseUpdateWrapper();
                recordWrapper.convNote = record;
                recordWrapper.isGeneralUpdate = true;
                convNotesWithRelevantChanges.add(recordWrapper);
            }

            if (
                MyTriggers.hasChangedFields(
                    new List<String>{ 'STO_Sensitive_Information__c' },
                    record,
                    recordOld
                )
            ) {
                HenvendelseUpdateWrapper recordWrapper = new HenvendelseUpdateWrapper();
                recordWrapper.convNote = record;
                recordWrapper.isRedactionChange = true;
                convNotesWithRelevantChanges.add(recordWrapper);
            }
        }
        if (convNotesWithRelevantChanges.isEmpty()) {
            return;
        }
        createHenvendelseCacheQueueable(convNotesWithRelevantChanges);
    }

    private void createHenvendelseCacheQueueable(
        List<HenvendelseUpdateWrapper> convNoteList
    ) {
        Set<Id> recordIds = ConvNoteCacheFilterHelper.getRecordIdsRequiringCacheClear(
            convNoteList
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
