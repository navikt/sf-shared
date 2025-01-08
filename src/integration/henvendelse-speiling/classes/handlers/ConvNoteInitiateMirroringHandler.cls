global class ConvNoteInitiateMirroringHandler extends MyTriggers {
    LoggerUtility logger = new LoggerUtility('HenvendelseMirroring');

    global override void onAfterInsert() {
        getRecordsIdsAndInitiatePostToDb((List<Conversation_Note__c>) records);
    }

    global override void onAfterUpdate(Map<Id, SObject> triggerOldMap) {
        //TODO: Post bare for felter som er relevante for speilingen
        getRecordsIdsAndInitiatePostToDb((List<Conversation_Note__c>) records);
    }

    private void getRecordsIdsAndInitiatePostToDb(
        List<Conversation_Note__c> convNoteList
    ) {
        List<ConvNoteMirroring__e> platformEvents = new List<ConvNoteMirroring__e>();

        for (Conversation_Note__c convNote : convNoteList) {
            platformEvents.add(
                new ConvNoteMirroring__e(RecordId__c = convNote.Id)
            );
        }

        if (platformEvents.size() > 0) {
            insert platformEvents;
        }
    }
}
