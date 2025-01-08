global class ConvNoteMirroringHandler extends MyTriggers {
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
        Set<Id> convNoteIds = new Set<Id>();

        for (Conversation_Note__c convNote : convNoteList) {
            convNoteIds.add(convNote.Id);
        }

        if (convNoteIds.size() > 0) {
            System.enqueueJob(new ConvNoteMirroringQueueable(convNoteIds));
        }
    }
}
