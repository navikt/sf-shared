global class ConvNoteCacheHandler extends MyTriggers {
    global override void onAfterInsert() {
        createHenvendelseCacheQueueable((List<Conversation_Note__c>) records);
    }
    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        //TODO: Sjekk kun for felter som er relevante for cachingen
        createHenvendelseCacheQueueable((List<Conversation_Note__c>) records);
    }

    private void createHenvendelseCacheQueueable(
        List<Conversation_Note__c> convNoteList
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
