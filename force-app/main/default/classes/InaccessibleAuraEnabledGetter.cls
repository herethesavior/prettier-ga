public with sharing class InaccessibleAuraEnabledGetter {
    @AuraEnabled
    public Integer counter { private get; set; } // Violating - Private getter is inaccessible to Lightning components

    @AuraEnabled
    public static Foo bar() {
        Foo foo = new Foo();
        foo.counter = 2;
        return foo;
    }
}
