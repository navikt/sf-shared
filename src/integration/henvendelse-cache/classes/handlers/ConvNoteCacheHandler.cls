global class ConvNoteCacheHandler extends MyTriggers {
    private LoggerUtility logger = new LoggerUtility('HenvendelseCaching');

    global override void onAfterInsert() {
        publishPlatformEvents((List<Conversation_Note__c>) records);
    }
    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        //TODO: Post bare for felter som er relevante for cachingen
        publishPlatformEvents((List<Conversation_Note__c>) records);
    }
    private void publishPlatformEvents(
        List<Conversation_Note__c> convNoteList
    ) {
        try {
            List<CacheHenvendelse__e> platformEvents = ConvNoteCacheFilterHelper.getConvNotesToBeCached(
                convNoteList
            );
            if (platformEvents.size() > 0) {
                EventBus.publish(platformEvents);
            }
        } catch (exception e) {
            logger.exception(e);
            logger.publish();
        }
    }
}
