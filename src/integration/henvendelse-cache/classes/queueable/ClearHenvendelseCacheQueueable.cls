public with sharing class ClearHenvendelseCacheQueueable implements Queueable, Database.AllowsCallouts {
    private Set<Id> conversationNoteIds;
    private String objectType;
    private LoggerUtility logger = new LoggerUtility('HenvendelseCache');

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
    private void sendActorIdsToHenvendelseDbApi() {
        Set<String> actorIds = ConvNoteCacheFilterHelper.getActorIds(
            conversationNoteIds
        );

        HenvendelseCacheCalloutService calloutService = new HenvendelseCacheCalloutService();
        HttpResponse response = calloutService.deleteHenvendelseCache(actorIds);

        if (response.getStatusCode() != 200) {
            logger.error(
                'Failed to clear henvendelse cache for acotorIds ' +
                actorIds.toString(),
                null,
                CRM_ApplicationDomain.Domain.NKS
            );
        } else {
            logger.info(
                'Clear cahce for actorIds ' +
                    actorIds.toString() +
                    ' triggered by ' +
                    objectType,
                null,
                CRM_ApplicationDomain.Domain.NKS
            );
        }
        logger.publishSynch();
    }
}
