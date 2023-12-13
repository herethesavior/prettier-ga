public with sharing class TooManyFields {
    public class Person {
        // too many separate fields
        Integer birthYear;
        Integer birthMonth;
        Integer birthDate;
        Double height;
        Double weight;
        String firstName;
        String lastName;
        String middleName;
        String suffix;
        String description;
        Integer age;
        String street;
        String city;
        String state;
        String zip;
        String country;
    }

    public class Person {
        // this is more manageable
        Date birthDate;
        BodyMeasurements measurements;
        Address address;
    }
}
