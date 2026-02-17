trigger OpportunityTrigger on Opportunity (before insert,before update,after update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        OpportunityTriggerHandler.handleActivitiesBeforeUpdate(Trigger.new, Trigger.oldMap);
        //Trigger.NEW : List<sObject> -> List<opportunity> - new version  of the data
        //Trigger.OLD : List<sObject> -> List<opportunity> - older version of the data
        //Trigger.newMap : Map<Id,sObject> -> Map<Id, Opportunity> - new value in key value data
        //Trigger.oldMap : Map<Id,sObject> -> Map<Id, Opportunity> - old values in key value format
    }

    if(Trigger.isBefore){
        if (Trigger.isInsert) {
            OpportunityTriggerHandler.handleActivitiesAfterInsert(Trigger.new);
        }
    }

    if (Trigger.isAfter && Trigger.isUpdate) {
        OpportunityTriggerHandler.handleActivitiesAfterUpdate(Trigger.new);
    }
}