trigger GardenTrigger on CAMPX__Garden__c (before insert) {

    if (Trigger.isBefore && Trigger.isInsert) {
        GardenTriggerHandler.beforeInsert(Trigger.new);
    }
}