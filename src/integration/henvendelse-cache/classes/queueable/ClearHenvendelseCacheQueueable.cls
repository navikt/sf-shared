public with sharing class ClearHenvendelseCacheQueueable implements Queueable {
    private Set<Id> conversationNoteIds;
    private String objectType;

    public ClearHenvendelseCacheQueueable(
        Set<Id> conversationNoteIds,
        String objectType
    ) {
        this.conversationNoteIds = conversationNoteIds;
        this.objectType = objectType;
    }

    public void execute(QueueableContext context) {
        sendActorIdsToHenvendelseDbApi();
    }

    @TestVisible
    private Integer sendActorIdsToHenvendelseDbApi() {
        Set<String> actorIds = ConvNoteCacheFilterHelper.getActorIds(
            conversationNoteIds
        );

        HenvendelseCacheCalloutService calloutService = new HenvendelseCacheCalloutService();

        for (String actorId : actorIds) {
        }
        if (actorIds.isEmpty()) {
            return 0;
        }
        return 0;
    }
}
