public with sharing class UseCase_5 {
    public static Boolean checkNameExist(String conName, String AccName){
        if(conName == null || AccName == null){
            return false;
        }
        List<Contact>conList = [SELECT Id FROM Contact 
                                WHERE Name = :conName AND Account.Name = :AccName LIMIT 1];
        return conList.size() > 0 ? true : false;
    }
}