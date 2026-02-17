trigger CAMPX_EventTrigger on CAMPX__Event__c (before insert, before update) {

    if (Trigger.isBefore && Trigger.isInsert) {
        CAMPX_EventTrigger_Handler.onBeforeInsert(Trigger.new);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        CAMPX_EventTrigger_Handler.onBeforeUpdate(Trigger.new, Trigger.oldMap);
    }

}