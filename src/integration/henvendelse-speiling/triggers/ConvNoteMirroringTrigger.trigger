trigger ConvNoteMirroringTrigger on ConvNoteMirroring__e(after insert) {
    Set<Id> recordIds = new Set<Id>();

    for (ConvNoteMirroring__e platformEvent : Trigger.new) {
        recordIds.add(platformEvent.RecordId__c);
    }

    ConvNoteMirroringHandler.postToMirrorDatabase(recordIds);
}
