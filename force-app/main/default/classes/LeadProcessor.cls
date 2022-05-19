public class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start (Database.BatchableContext bc) {
        return Database.getQueryLocator(
        	'SELECT Company, Status, LastName, LeadSource FROM Lead'
        );
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> records){
        // process each batch of records
        List<Lead> listLeads = new List<Lead>();
        for(Lead l : records) {
            l.LeadSource = 'Dreamforce';
            listLeads.add(l);
        }
        update listLeads;
    }
    
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations 
    }
}