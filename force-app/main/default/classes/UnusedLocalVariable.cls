public with sharing class UnusedLocalVariable {
    public Boolean bar(String z) {
        String x = 'some string'; // not used
        String z = 'z string';
        String y = 'some other string'; // used in the next line
        return z.equals(y);
    }
}
