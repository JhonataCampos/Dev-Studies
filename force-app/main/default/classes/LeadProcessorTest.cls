@isTest
private class LeadProcessorTest {
	@TestSetup
    static void setup() {
        List<Lead> newLeads = new List<Lead>();
       
        for (Integer i = 0; i < 200; i++) {
        	Lead l = new Lead();    
            l.Company = 'Test Company';
            l.Status = 'Open - Not Contacted';
            l.LastName = 'Lead Test ' + i;
        	l.LeadSource = 'Not Dreamforce';
            newLeads.add(l);
        }	
        insert newLeads;
    }
    
    @isTest
    static void testLead() {
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
        
    }
}