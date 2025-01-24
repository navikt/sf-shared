global class MessageCacheHandler extends MyTriggers {
    global override void onAfterInsert() {
        createHenvendelseCacheQueueable((List<Message__c>) records);
    }

    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        //TODO: Sjekk kun for felter som er relevante for cachingen
        createHenvendelseCacheQueueable((List<Message__c>) records);
    }

    private void createHenvendelseCacheQueueable(List<Message__c> messageList){
        Set<Id> recordIds = ThreadCacheFilterHelper.getRecordIdsRequiringCacheClearByMessages(messageList);
        System.enqueueJob(new ClearHenvendelseCacheQueueable(recordIds, 'Thread__c'));
    }
}