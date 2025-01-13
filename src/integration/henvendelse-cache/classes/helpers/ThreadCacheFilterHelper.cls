public without sharing class ThreadCacheFilterHelper {
    private LoggerUtility logger = new LoggerUtility('HenvendelseCaching');

    private static List<CacheHenvendelse__e> getThreadsToBeCachedByMessages(
        List<Message__c> messages
    ) {
        return new List<CacheHenvendelse__e>();
    }
    private static List<CacheHenvendelse__e> getThreadsToBeCached(
        Set<Id> threadIDs
    ) {
        return new List<CacheHenvendelse__e>();
    }

    @TestVisible
    private static Set<Id> getThreadIds(List<Message__c> messages) {
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
