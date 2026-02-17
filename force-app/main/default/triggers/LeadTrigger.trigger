trigger LeadTrigger on Lead (before update, before insert,after insert, before delete) {


    if(Trigger.isDelete && Trigger.isBefore){
        LeadTriggerHandler.beforeDelete(Trigger.old);
    }

    //Whenever a Lead record is updated, set the Lead status to Working - Contacted
    if(Trigger.isInsert && Trigger.isAfter){
        //add the location of the Trigger handler class
        LeadTriggerHandler.afterInsert(Trigger.new);
    }

    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){      
            LeadTriggerHandler.handleBefore(Trigger.new, Trigger.oldMap);
        }
    }
    

    if (Trigger.isBefore && Trigger.isInsert) {
        LeadTriggerHandler.beforeInsert(Trigger.new);
    }



    if(Trigger.isBefore && Trigger.isUpdate){
        //1st trigger logic for status 
        for(Lead leadRec : Trigger.New){
            leadRec.Status = 'Working - Contacted';

            if(leadRec.Industry == 'Healthcare'){
                leadRec.LeadSource = 'Purchased List';
                leadRec.SICCode__c = '1100';
                leadRec.Primary__c = 'Yes';
            }

        }
    }

    
}