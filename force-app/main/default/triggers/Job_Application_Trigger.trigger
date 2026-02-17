trigger Job_Application_Trigger on Job_Application__c (after insert, after update) {

    if (Trigger.isAfter) {
        Job_Application_Trigger_Handler.onAfterInsert(Trigger.new, Trigger.oldMap);
        
    }
}