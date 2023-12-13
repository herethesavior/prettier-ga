public with sharing class ExcessiveParameterList {
    // too many arguments liable to be mixed up
    public void addPerson(
        Integer birthYear,
        Integer birthMonth,
        Integer birthDate,
        Integer height,
        Integer weight
    ) {
        Contact c = new Contact(Birthdate = Date.newInstance(birthYear, birthMonth, birthDate));
    }

    // preferred approach
    public void addPerson(Date birthdate, BodyMeasurements measurements, int ssn) {
        // ...
    }
}
