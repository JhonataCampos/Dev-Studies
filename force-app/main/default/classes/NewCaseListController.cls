public with sharing class NewCaseListController {
    public List<Case> getNewCases() {
        List<Case> listCases = Database.query('SELECT Id, CaseNumber FROM Case WHERE Status = \'New\'');
        return listCases;    
    }
}