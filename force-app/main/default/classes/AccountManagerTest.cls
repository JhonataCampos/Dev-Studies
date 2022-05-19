@isTest
private class AccountManagerTest {
    @isTest
    static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://cunning-koala-jpjfhl-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAcct = AccountManager.getAccount();
        // Verify results
        System.assert(thisAcct != null);
        System.assertEquals('Test record', thisAcct.Name);
                
    }
    
    static Id createTestRecord() {
        // Create test record
        Account acctTest = new Account(
            Name='Test record');
        insert acctTest;
        
        Contact ctt = new Contact(
       		AccountId = acctTest.Id,
            LastName = 'TestCtt');
       	
        insert ctt;
        return acctTest.Id;
    }          
}