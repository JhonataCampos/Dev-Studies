public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> recordIds) {
        List<Account> listToUpdate = new List<Account>();
        for (AggregateResult ar : [SELECT AccountId aId, COUNT(Id) c 
                                   FROM Contact 
                                   WHERE AccountId IN 
                                   (SELECT Id FROM Account WHERE Id IN :recordIds)
                                   GROUP BY AccountId]) {
			Account acct = new Account();
			acct.Id = (Id) ar.get('aId');
            acct.Number_Of_Contacts__c = (Decimal) ar.get('c');                            
        }
        update listToUpdate;
    }
}