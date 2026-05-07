public with sharing class ClearHenvendelseCacheQueueable implements Queueable, Database.AllowsCallouts {
    private Set<Id> conversationNoteIds;
    private Set<Id> threadIds;
    private LoggerUtility logger = new LoggerUtility('HenvendelseCache');

    public ClearHenvendelseCacheQueueable(
        Set<Id> conversationNoteIds,
        Set<Id> threadIds
    ) {
        this.conversationNoteIds = conversationNoteIds;
        this.threadIds = threadIds;
    }

    public void execute(QueueableContext context) {
        sendActorIdsToHenvendelseDbApi();
    }

    @TestVisible
    private void sendActorIdsToHenvendelseDbApi() {
        Set<String> actorIds = new Set<String>();
        Set<Id> recordIds = new Set<Id>();

        if (conversationNoteIds != null && !conversationNoteIds.isEmpty()) {
            actorIds.addAll(
                ConvNoteCacheFilterHelper.getActorIds(conversationNoteIds)
            );
            recordIds.addAll(conversationNoteIds);
        }

        if (threadIds != null && !threadIds.isEmpty()) {
            actorIds.addAll(ThreadCacheFilterHelper.getActorIds(threadIds));
            recordIds.addAll(threadIds);
        }

        if (actorIds.isEmpty()) {
            return;
        }

        HenvendelseCacheCalloutService calloutService = new HenvendelseCacheCalloutService();
        HttpResponse response = calloutService.deleteHenvendelseCache(actorIds);

        if (response.getStatusCode() != 200) {
            logger.error(
                'Failed to clear henvendelse cache for actorIds ' +
                    actorIds.toString() +
                    ' ' +
                    response.getBody() +
                    ' triggered by ' +
                    recordIds.toString(),
                null,
                CRM_ApplicationDomain.Domain.NKS
            );
        }
        logger.publishSynch();
    }
}