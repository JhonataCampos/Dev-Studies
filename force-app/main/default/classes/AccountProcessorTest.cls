@isTest
public class AccountProcessorTest {
    @TestSetup 
    static void makeData() {
        Contact ctt = new Contact();
        Account acct = new Account();
        
        acct.Name = 'Acct #1';
        insert acct;
        
        ctt.FirstName = 'Contact';
        ctt.LastName = ' #1';
        ctt.AccountId = acct.Id;
        insert ctt;
    }
    
    @isTest
    public static void AccountProcessorTest() {
        List<Account> listAccts = new List<Account>([SELECT Id FROM Account]);
       	List<Id> listIds = new List<Id>();
        for(Account acct : listAccts) {
            listIds.add(acct.Id);
        }
        
        Test.startTest();
        AccountProcessor.countContacts(listIds);
        Test.stopTest();
        
        System.assertEquals(true, [SELECT Number_Of_Contacts__c FROM Account] != null);
    }
}