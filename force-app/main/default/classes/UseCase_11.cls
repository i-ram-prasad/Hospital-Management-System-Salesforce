public with sharing class UseCase_11 {
    public static String checkFullFormAchronym(String acronym){
        
        //store the master data of all acronym someWhere
        //fetch then adn find if the acronym 
        List<Acronym_Master__c> acronymMasters = [SELECT Id, Name, Full_Version__c FROM Acronym_Master__c WHERE Name = :acronym LIMIT 1];

        if(acronymMasters.size() == 1){
            return acronymMasters[0].Full_Version__c;
        }
        return 'Not Specified';
    }
}