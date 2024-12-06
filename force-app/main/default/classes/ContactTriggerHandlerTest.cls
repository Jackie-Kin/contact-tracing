@isTest
public with sharing class ContactTriggerHandlerTest {
    @isTest
    public static void afterInsertHandlerTest(){
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name='Test1'));
        testAccounts.add(new Account(Name='Test2'));

        insert testAccounts;

        List<Contact> testContacts =  new List<Contact>();
        testContacts.add(new Contact(LastName='Test Contact 1',AccountId=testAccounts[0].Id));
        testContacts.add(new Contact(LastName='Test Contact 2',AccountId=testAccounts[0].Id));
        testContacts.add(new Contact(LastName='Test Contact 3',AccountId=testAccounts[0].Id));
        testContacts.add(new Contact(LastName='Test Contact 4',AccountId=testAccounts[0].Id));
        testContacts.add(new Contact(LastName='Test Contact 5',AccountId=testAccounts[1].Id));

        insert testContacts;

        List<Account> accs=  [Select id, Active_Contacts__c from account];
        System.assertEquals(2, accs.size());
        System.assertEquals(0, accs[0].Active_Contacts__c);
        System.assertEquals(0, accs[0].Active_Contacts__c);

        List<Contact> allContacts = [Select id from contact];
        System.assertEquals(5, testContacts.size());

    }
}