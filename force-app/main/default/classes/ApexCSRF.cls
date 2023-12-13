public with sharing class ApexCSRF {
    public ApexCSRF() {
        delete [SELECT Id FROM Account];
    }

    public ApexCSRF(ApexPages.StandardController ctrl) {
        delete [SELECT Id FROM Account];
    }

    {
        // initializer
        insert data;
    }

    // constructor
    public Foo() {
        insert data;
    }
}
