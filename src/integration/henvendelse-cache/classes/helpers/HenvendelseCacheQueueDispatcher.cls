/**
 * Aggregates cache clear requests within a transaction and enqueues one job.
 */
public with sharing class HenvendelseCacheQueueDispatcher {
    private static Set<Id> conversationNoteIds = new Set<Id>();
    private static Set<Id> threadIds = new Set<Id>();
    private static Boolean isEnqueued = false;

    /**
     * Adds conversation note ids to the pending cache clear job.
     *
     * @param ids Conversation note ids.
     */
    public static void addConversationNoteIds(Set<Id> ids) {
        if (ids == null || ids.isEmpty()) {
            return;
        }

        conversationNoteIds.addAll(ids);
        enqueueOnce();
    }

    /**
     * Adds thread ids to the pending cache clear job.
     *
     * @param ids Thread ids.
     */
    public static void addThreadIds(Set<Id> ids) {
        if (ids == null || ids.isEmpty()) {
            return;
        }

        threadIds.addAll(ids);
        enqueueOnce();
    }

    private static void enqueueOnce() {
        if (isEnqueued) {
            return;
        }

        if (conversationNoteIds.isEmpty() && threadIds.isEmpty()) {
            return;
        }

        isEnqueued = true;
        System.enqueueJob(
            new ClearHenvendelseCacheQueueable(
                new Set<Id>(conversationNoteIds),
                new Set<Id>(threadIds)
            )
        );
    }
}
