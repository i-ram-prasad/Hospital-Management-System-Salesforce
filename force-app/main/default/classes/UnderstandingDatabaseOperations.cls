public class UnderstandingDatabaseOperations {
    public static void handlingAccountInsert(){
        
        Account acc = new Account();
        acc.Name = '1st Try for DML in List';
        
        
        
        Account acc2 = new Account();
        acc2.Name = '2nd try for DML in List';
        
        
        List<Account> accList = new List<Account>();
        accList.add(acc);
        accList.add(acc2);
        
        insert accList;
        
    }
    
    public static void handleContactUpdates(Id contactId){
        if(contactId == null){
            return;
        }
        List<Contact>con = [SELECT Id, Title, Department FROM Contact WHERE Id = :contactId];
        
        if(con.isEmpty()){
            return;
        }
        Contact contacts = con[0];
        
        if(contacts.Title == 'SVP, Procurement' && contacts.Department != 'Procurement'){
           	contacts.Department = 'Procurement';
            
            update contacts;
        }
    }
    
    public static void handleDeleteScenario(){
        List<Opportunity> closeLostOpps = [SELECT Id FROM Opportunity WHERE StageName = 'Closed Lost'];
        if(closeLostOpps.size() > 0){
            delete closeLostOpps;
        }
    }
    
    
    
    
}