global class ConvNoteCacheHandler extends MyTriggers {
    LoggerUtility logger = new LoggerUtility('HenvendelseCaching');

    global override void onAfterInsert() {
        publishPlatformEventWithActorId((List<Conversation_Note__c>) records);
    }
    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        //TODO: Post bare for felter som er relevante for speilingen
        publishPlatformEventWithActorId((List<Conversation_Note__c>) records);
    }
    private void publishPlatformEventWithActorId(
        List<Conversation_Note__c> convNoteList
    ) {
        try {
            List<ClearHenvendelseCache__e> platformEvents = new List<ClearHenvendelseCache__e>();
            Set<String> actorIds = getActorIds(getRecordIds(convNoteList));
            for (String actorId : actorIds) {
                platformEvents.add(
                    new ClearHenvendelseCache__e(ActorId__c = actorId)
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

    private Set<String> getActorIds(Set<Id> recordIds) {
        Set<String> actorIds = new Set<String>();
        for (Conversation_Note__c convNote : [
            SELECT CRM_Account__r.CRM_Person__r.INT_ActorId__c
            FROM Conversation_Note__c
            WHERE Id IN :recordIds
        ]) {
            if (convNote.CRM_Account__r.CRM_Person__r.INT_ActorId__c != null) {
                actorIds.add(
                    convNote.CRM_Account__r.CRM_Person__r.INT_ActorId__c
                );
            }
        }
        return actorIds;
    }
}
