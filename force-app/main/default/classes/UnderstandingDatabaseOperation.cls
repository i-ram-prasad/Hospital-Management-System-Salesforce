public class UnderstandingDatabaseOperation {
    public static void handleContactUpdates(Id contactId){
        Contact con = [SELECT Id, Title, Department
                       FROM Contact 
                       WHERE Id = :contactId];
        
        if(con.Title == 'SVP, Procurment'){
            con.Department = 'Procurement';
        }
        update con;
    }
}