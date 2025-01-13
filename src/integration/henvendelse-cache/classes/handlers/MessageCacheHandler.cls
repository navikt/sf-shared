global class MessageCacheHandler extends MyTriggers {
    private LoggerUtility logger = new LoggerUtility('HenvendelseCaching');

    global override void onAfterInsert() {
        publishPlatformEvents((List<Message__c>) records);
    }
    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        //TODO: Post bare for felter som er relevante for cachingen
        publishPlatformEvents((List<Message__c>) records);
    }
    private void publishPlatformEvents(List<Message__c> messageList) {
        try {
            List<CacheHenvendelse__e> platformEvents = new List<CacheHenvendelse__e>();
            if (platformEvents.size() > 0) {
                EventBus.publish(platformEvents);
            }
        } catch (exception e) {
            logger.exception(e);
            logger.publish();
        }
    }
}
