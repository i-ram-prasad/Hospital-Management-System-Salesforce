public with sharing class CAMPX_EventTrigger_Handler {
    public static void onBeforeInsert(List<CAMPX__Event__c> newEvents) {
        for (CAMPX__Event__c event : newEvents) {
            event.CAMPX__Status__c = 'Planning';
            event.CAMPX__StatusChangeDate__c = Datetime.now();
        }
    }

    public static void onBeforeUpdate(List<CAMPX__Event__c>  newEvents, Map<Id, CAMPX__Event__c> eventOldMap){
        for (CAMPX__Event__c event : newEvents) {
            CAMPX__Event__c eventOld = eventOldMap.get(event.Id);

            if(event.CAMPX__Status__c != eventOld.CAMPX__Status__c){

                event.CAMPX__StatusChangeDate__c = Datetime.now();

            }
        }
    }

}