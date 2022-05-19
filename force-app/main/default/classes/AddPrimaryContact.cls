public class AddPrimaryContact implements Queueable {
	private Contact ctt;
	private String state;
	
    public AddPrimaryContact(Contact ctt, String state) {
        this.ctt = ctt;
    	this.state = state;
    }
    
    public void execute(QueueableContext context) {
        List<Account> listAccounts = [SELECT Id, Name FROM Account WHERE BillingState = :state LIMIT 200];
        List<Contact> listCtts = new List<Contact>();
        for(Account acct : listAccounts) {
            Contact newCtt = ctt.clone(false, false, false, false);
            newCtt.AccountId = acct.Id;
            listCtts.add(newCtt);
        }       
        if(listCtts.size() > 0) {
        	insert listCtts;   
        }
    }
}