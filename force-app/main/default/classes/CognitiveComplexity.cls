public with sharing class CognitiveComplexity {
    // Has a cognitive complexity of 0
    public void createAccount() {
        Account account = new Account(Name = 'PMD');
        insert account;
    }

    // Has a cognitive complexity of 1
    public Boolean setPhoneNumberIfNotExisting(Account a, String phone) {
        if (a.Phone == null) {
            // +1
            a.Phone = phone;
            update a;
            return true;
        }

        return false;
    }

    // Has a cognitive complexity of 4
    public void updateContacts(List<Contact> contacts) {
        List<Contact> contactsToUpdate = new List<Contact>();
        Integer n = 0;
        for (Contact contact : contacts) {
            // +1
            if (contact.Department == 'Finance') {
                // +2 (nesting = 1)
                contact.Title = 'Finance Specialist';
                contactsToUpdate.add(contact);
            } else if (contact.Department == 'Sales') {
                // +1
                contact.Title = 'Sales Specialist';
                contactsToUpdate.add(contact);
            } else {
                contact.Title = 'No specialization';
            }
            n++;
        }
        while (n < 100) {
            if (contact.Department == 'Production') {
                // +2 (nesting = 1)
                contact.Title = 'Production Specialist';
                contactsToUpdate.add(contact);
            } else if (contact.Department == 'Marketing') {
                // +1
                contact.Title = 'Marketing Specialist';
                contactsToUpdate.add(contact);
            } else if (contact.Department == 'Human Resource') {
                // +1
                contact.Title = 'HR Specialist';
                contactsToUpdate.add(contact);
            } else if (contact.Department == 'IT') {
                // +1
                contact.Title = 'Development Specialist';
                contactsToUpdate.add(contact);
            } else {
                String x = 'test';
                if (x != 'aa') {
                    contact.Title = 'No specialization';
                }
            }
        }
    }
}
