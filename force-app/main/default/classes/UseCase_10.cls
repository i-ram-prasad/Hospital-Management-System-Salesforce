public with sharing class UseCase_10 {
   
    public static String checkPlantType(String plantName){

        String plantType = 'Not Specified ';
        List<Plant_Information_Master__mdt> plantInfo = [SELECT Id, MasterLabel, Plant_Type__c	FROM Plant_Information_Master__mdt WHERE MasterLabel = :plantName LIMIT 1];

            if(plantInfo.size() == 1){
                return plantInfo[0].Plant_Type__c;
            }
        return plantType;
    }
}