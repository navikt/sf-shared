public without sharing class ThreadCacheFilterHelper {
    //Get thread ids for threads that require cache clear
    //Updates from Modia should only trigger cache clear when closing thread or redacting
    public static Set<Id> getRecordIdsRequiringCacheClear(
        List<HenvendelseUpdateWrapper> threadList
    ) {
        ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();
        Set<Id> threadIds = new Set<Id>();

        for (HenvendelseUpdateWrapper wrapper : threadList) {
            if (
                wrapper.thread.LastModifiedById != modiaIntegrationUser.UserId
            ) {
                threadIds.add(wrapper.thread.Id);
            } else if (wrapper.isCloseThreadChange) {
                threadIds.add(wrapper.thread.Id);
            } else if (wrapper.isRedactionChange) {
                threadIds.add(wrapper.thread.Id);
            }
        }
        return threadIds;
    }

    public static Set<String> getActorIds(Set<Id> threadIds) {
        Set<String> actorIds = new Set<String>();
        for (Thread__c thread : [
            SELECT Id, CRM_Account__r.CRM_Person__r.INT_ActorId__c
            FROM Thread__c
            WHERE
                Id IN :threadIds
                AND CRM_Thread_Type__c IN :HenvendelseConstants.henvendelseTypes
        ]) {
            if (thread.CRM_Account__r.CRM_Person__r.INT_ActorId__c != null) {
                actorIds.add(
                    thread.CRM_Account__r.CRM_Person__r.INT_ActorId__c
                );
            }
        }
        return actorIds;
    }
}
