public with sharing class PlantTriggerHandler {
    
    public static void beforeInsert(List<CAMPX__Plant__c> newPlants){

        Set<Id> gardenIds = new Set<Id>();
        for (CAMPX__Plant__c f : newPlants) {
            if (f.CAMPX__Garden__c != null) {
                gardenIds.add(f.CAMPX__Garden__c);
            }
        }

        Map<Id, CAMPX__Garden__c> gardenMap = new Map<Id, CAMPX__Garden__c>([SELECT Id, CAMPX__Sun_Exposure__c 
                                                                            FROM CAMPX__Garden__c
                                                                            WHERE ID IN :gardenIds]);


        for (CAMPX__Plant__c p : newPlants) {
            
            if (String.isBlank(p.CAMPX__Soil_Type__c) ) {
                p.CAMPX__Soil_Type__c = 'All Purpose Potting Soil';
            }

            if (String.isBlank(p.CAMPX__Water__c)) {
                p.CAMPX__Water__c = 'Once Weekly';
            }

            if (String.isBlank(P.CAMPX__Sunlight__c)) {

                CAMPX__Garden__c sunExpo = gardenMap.get(p.CAMPX__Garden__c);

                if(sunExpo != null && String.isNotBlank(sunExpo.CAMPX__Sun_Exposure__c)){
                    p.CAMPX__Sunlight__c = sunExpo.CAMPX__Sun_Exposure__c;
                
                } else {
                    p.CAMPX__Sunlight__c = 'Partial Sun';
                }
            }
        }
    }
}