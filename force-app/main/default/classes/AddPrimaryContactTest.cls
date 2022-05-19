@isTest
public class AddPrimaryContactTest {
	@TestSetup
    static void setup() {
        List<Account> listAccounts1 = new List<Account>();
        List<Account> listAccounts2 = new List<Account>();
        
        Contact ctt1 = new Contact();
        ctt1.LastName = 'Ctt1';
        insert ctt1;
        
        Contact ctt2 = new Contact();
        ctt2.LastName = 'Ctt2';
        insert ctt2;
        
        
        for (Integer i = 0; i < 100; i++) {
            Account acct = new Account();
            acct.Name = 'Acct ' + i;

            if(i < 50) {
                acct.BillingState = 'NY';
                listAccounts1.add(acct);
            } else {
                acct.BillingState = 'CA';
                listAccounts2.add(acct);
            }
        }
        
        if(listAccounts1.size() > 0) {
            insert listAccounts1;
        }
        
        if(listAccounts2.size() > 0) {
            insert listAccounts2;
        }
    }
    
    @isTest
    static void testAddContact() {
        Contact ctt1 = [SELECT Id, LastName FROM Contact WHERE LastName = 'Ctt1']; 		
		AddPrimaryContact apc1 =  new AddPrimaryContact(ctt1, 'CA');
        
        Test.startTest();
        System.enqueueJob(apc1);
		Test.stopTest();
        
        System.assertEquals(50, [select count() FROM Contact WHERE AccountId IN (SELECT Id FROM Account WHERE BillingState = 'CA')]);

    }
}