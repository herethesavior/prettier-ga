public with sharing class ApexSOQLInjection {
    public Account main(String name) {
        return (Account) Database.query('SELECT Id, Name FROM Account WHERE Name = ' + name);
    }
}
