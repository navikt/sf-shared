global class ConvNoteCacheHandler extends MyTriggers {
    global override void onAfterInsert() {
        createCreateHenvendelseCacheQueueable((List<Conversation_Note__c>) records);
    }
    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        //TODO: Sjekk kun for felter som er relevante for cachingen
        createCreateHenvendelseCacheQueueable((List<Conversation_Note__c>) records);
    }

    private void createCreateHenvendelseCacheQueueable(List<Conversation_Note__c> convNoteList){
        Set<Id> recordIds = ConvNoteCacheFilterHelper.getRecordIdsRequiringCacheClear(convNoteList);
        System.enqueueJob(new ClearHenvendelseCacheQueueable(recordIds));
    }
}