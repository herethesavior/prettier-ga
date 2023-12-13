public with sharing class MethodWithSameNameAsEnclosingClass {
    // this is OK because it is a constructor
    public methodWithSameNameAsEnclosingClass() {
        String a = 'a';
    }

    // this is bad because it is a method
    public void methodWithSameNameAsEnclosingClass() {
    }
}
