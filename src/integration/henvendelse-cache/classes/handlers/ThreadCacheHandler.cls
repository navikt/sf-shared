global class ThreadCacheHandler extends MyTriggers {
    global override void onAfterInsert() {
        createHenvendelseCacheQueueable((List<Thread__c>) records);
    }

    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        //TODO: Sjekk kun for felter som er relevante for cachingen
        createHenvendelseCacheQueueable((List<Thread__c>) records);
    }

    private void createHenvendelseCacheQueueable(List<Thread__c> threadList) {
    }
}
