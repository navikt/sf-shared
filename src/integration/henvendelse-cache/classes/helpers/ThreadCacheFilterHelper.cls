public without sharing class ThreadCacheFilterHelper {
    

    
    public static Set<Id> getRecordIdsRequiringCacheClearByMessages(List<Message__c> messages) {
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
}
