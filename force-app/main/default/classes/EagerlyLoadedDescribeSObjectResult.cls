public with sharing class EagerlyLoadedDescribeSObjectResult {
    public class Foo {
        public void bar(List<Account> accounts) {
            if (Account.SObjectType.getDescribe().isCreateable()) {
                insert accounts;
            }
        }
    }

    // https://www.ca-peterson.com/apex/2020/01/21/apex-describe-calls-what-you-need-to-know.html?utm_source=pocket_mylist
    public void bar(List<Account> accounts) {
        if (
            Account.SObjectType.getDescribe(SObjectDescribeOptions.DEFERRED).isCreateable() &&
            Account.SObjectType.getDescribe(SObjectDescribeOptions.DEFAULT).isUpdateable()
        ) {
            upsert accounts;
        }
    }
}
