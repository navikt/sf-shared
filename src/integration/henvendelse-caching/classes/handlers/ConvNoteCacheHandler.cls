global class ConvNoteCacheHandler extends MyTriggers {
    private LoggerUtility logger = new LoggerUtility('HenvendelseCaching');

    global override void onAfterInsert() {
        publishPlatformEventsWithActorId((List<Conversation_Note__c>) records);
    }
    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        //TODO: Post bare for felter som er relevante for cachingen
        publishPlatformEventsWithActorId((List<Conversation_Note__c>) records);
    }
    private void publishPlatformEventsWithActorId(
        List<Conversation_Note__c> convNoteList
    ) {
        try {
            List<CacheHenvendelse__e> platformEvents = new List<CacheHenvendelse__e>();
            Set<String> actorIds = ConvNoteCacheFilterHelper.getActorIdsWithDirtyCache(
                getRecordIds(convNoteList)
            );
            for (String actorId : actorIds) {
                platformEvents.add(
                    new CacheHenvendelse__e(ActorId__c = actorId)
                );
            }

            if (platformEvents.size() > 0) {
                EventBus.publish(platformEvents);
            }
        } catch (exception e) {
            logger.exception(e);
            logger.publish();
        }
    }

    private Set<Id> getRecordIds(List<Conversation_Note__c> convNoteList) {
        Set<Id> recordIds = new Set<Id>();
        for (Conversation_Note__c convNote : convNoteList) {
            recordIds.add(convNote.Id);
        }
        return recordIds;
    }
}
