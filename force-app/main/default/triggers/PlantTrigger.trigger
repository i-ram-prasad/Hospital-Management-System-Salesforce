trigger PlantTrigger on CAMPX__Plant__c (before insert) {

    if (Trigger.isBefore && Trigger.isInsert) {
        PlantTriggerHandler.beforeInsert(Trigger.new);
    }
}