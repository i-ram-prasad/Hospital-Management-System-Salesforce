public with sharing class GardenTriggerHandler {
    public static void beforeInsert(List<CAMPX__Garden__c> newGardens){
        for(CAMPX__Garden__c g : newGardens){
            if (String.isBlank(g.CAMPX__Status__c)) {
                g.CAMPX__Status__c = 'Awaiting Resources';
            }
            
            if (g.CAMPX__Max_Plant_Count__c == null) {
                g.CAMPX__Max_Plant_Count__c = 100;
            }

            if (g.CAMPX__Minimum_Plant_Count__c == null) {
                g.CAMPX__Minimum_Plant_Count__c = 1;
            }
            
            if (g.CAMPX__Total_Plant_Count__c == null) {
                g.CAMPX__Total_Plant_Count__c = 0;    
            }
            if (g.CAMPX__Total_Unhealthy_Plant_Count__c == null) {
                g.CAMPX__Total_Unhealthy_Plant_Count__c = 0;
            }
               
        }
    }
}