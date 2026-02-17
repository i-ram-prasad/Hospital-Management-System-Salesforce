public class UseCase_1 {
    
    //Write a method that accepts the first name, last name and email of a person and creates a Contact record for the same.
    public static void createContactRecord(String firstName, String lastName, String email){
        
        List<Contact> conListToInsert = new List<Contact>();
        Contact con = new Contact();
        if (!String.isBlank(lastName)) {
            con.FirstName = firstName;
            con.LastName = lastName;
            con.Email = email;
            conListToInsert.add(con);
        }
        
        if(conListToInsert.size() > 0){
            Database.insert(conListToInsert, false);
        }

    }
}