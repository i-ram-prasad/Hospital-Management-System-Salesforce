public with sharing class UseCase_4 {
//    Write a method that queries all contacts associated to an account name and returns a list of email ids of all these contacts

    public static List<String> returnContactEmails(String accountName){
        List<String> emailList = new List<String>();

        List<Account> accName = [SELECT Id FROM Account 
                                WHERE Name = :accountName LIMIT 1];

        if(accName.size() == 1){
            List<Contact> contactRecord = [SELECT Id, Email FROM Contact
                                           WHERE AccountId = :accName[0].Id];
            if(contactRecord.size() > 0){
                for(Contact con : contactRecord){
                    if(con.Email != null){
                        emailList.add(con.Email);
                    }
                }
            }
        }

        return emailList;
    }

}