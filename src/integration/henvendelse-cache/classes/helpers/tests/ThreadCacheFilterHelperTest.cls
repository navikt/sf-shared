@IsTest
public class ThreadCacheFilterHelperTest {
    @IsTest
    static void shouldNotReturnOneActorIdWhenRelatedAccountIsBusinessAccount() {
        myTriggers.disable(MessageCacheHandler.class);
        myTriggers.disable(ThreadCacheHandler.class);

        Account account = (Account) SharedTestDataFactory.createRecord(
            new Account(Name = 'DUMMY ACCOUNT')
        );

        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(
                CRM_Account__c = account.Id,
                CRM_Thread_Type__c = 'STO'
            )
        );

        Test.startTest();
        Set<String> result = ThreadCacheFilterHelper.getActorIds(
            new Set<Id>{ thread.Id }
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }

    @IsTest
    static void shouldNotReturnActorIdWhenThreadIsAgMlonn() {
        myTriggers.disable(MessageCacheHandler.class);
        myTriggers.disable(ThreadCacheHandler.class);

        Account account = (Account) SharedTestDataFactory.createRecord(
            new Account(Name = 'DUMMY ACCOUNT')
        );

        Thread__c thread = (Thread__c) SharedTestDataFactory.createRecord(
            new Thread__c(
                CRM_Account__c = account.Id,
                CRM_Thread_Type__c = 'AG_MLØNN'
            )
        );

        Test.startTest();
        Set<String> result = ThreadCacheFilterHelper.getActorIds(
            new Set<Id>{ thread.Id }
        );
        Test.stopTest();

        Assert.areEqual(0, result.size());
    }
}
