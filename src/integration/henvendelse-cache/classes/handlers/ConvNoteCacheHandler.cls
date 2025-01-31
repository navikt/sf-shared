global class ConvNoteCacheHandler extends MyTriggers {
    global override void onAfterInsert() {
        createHenvendelseCacheQueueable(
            (List<Conversation_Note__c>) records,
            false
        );
    }
    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        //TODO: Sjekk kun for felter som er relevante for cachingen
        createHenvendelseCacheQueueable(
            (List<Conversation_Note__c>) records,
            true
        );
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
