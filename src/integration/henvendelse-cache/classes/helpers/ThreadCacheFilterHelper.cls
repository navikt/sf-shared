public without sharing class ThreadCacheFilterHelper {
    public static Set<Id> getRecordIdsRequiringCacheClear(
        List<Thread__c> threadList
    ) {
        ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();
        Set<Id> threadIds = new Set<Id>();

        for (Thread__c thread : threadList) {
            //Only cache records created by Salesforce internal users
            if (thread.LastModifiedById != modiaIntegrationUser.UserId) {
                threadIds.add(thread.Id);
            }
        }

        return threadIds;
    }

    public static Set<String> getActorIds(Set<Id> threadIds) {
        Set<String> actorIds = new Set<String>();
        for (Thread__c thread : [
            SELECT Id, CRM_Account__r.CRM_Person__r.INT_ActorId__c
            FROM Thread__c
            WHERE Id IN :threadIds
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
