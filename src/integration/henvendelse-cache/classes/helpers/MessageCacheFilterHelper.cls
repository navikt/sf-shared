public without sharing class MessageCacheFilterHelper {
    public static Set<Id> getRecordIdsRequiringCacheClear(
        List<Message__c> messages
    ) {
        ModiaIntegrationUser modiaIntegrationUser = new ModiaIntegrationUser();
        Set<Id> threadIds = new Set<Id>();

        for (Message__c msg : messages) {
            //Only cache records created by Salesforce internal users
            if (msg.LastModifiedById != modiaIntegrationUser.UserId) {
                threadIds.add(msg.CRM_Thread__c);
            }
        }

        return threadIds;
    }

    public static Set<String> getActorIds(Set<Id> messageIds) {
        Set<String> actorIds = new Set<String>();
        for (Message__c msg : [
            SELECT Id, CRM_Thread__r.CRM_Account__r.CRM_Person__r.INT_ActorId__c
            FROM Message__c
            WHERE Id IN :messageIds
        ]) {
            if (
                msg.CRM_Thread__r.CRM_Account__r.CRM_Person__r.INT_ActorId__c !=
                null
            ) {
                actorIds.add(
                    msg.CRM_Thread__r.CRM_Account__r.CRM_Person__r.INT_ActorId__c
                );
            }
        }
        return actorIds;
    }
}
