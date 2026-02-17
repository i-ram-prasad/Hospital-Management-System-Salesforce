trigger AccountTrigger on Account (before insert, before update, after update, after insert) {


    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHandler.beforeInsert(Trigger.new);
        }

        if(Trigger.isUpdate){
            AccountTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }

    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
    }

    if(Trigger.isAfter && Trigger.isInsert){
        AccountTriggerHandler.afterInsert(Trigger.new);
    }
}