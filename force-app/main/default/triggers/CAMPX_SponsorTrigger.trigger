trigger CAMPX_SponsorTrigger on CAMPX__Sponsor__c (before insert) {

    if(Trigger.isBefore){
        CAMPX_SponsorTrigger_Handler.setSponsorTier(Trigger.new);
        
        if(Trigger.isInsert){
            CAMPX_SponsorTrigger_Handler.onBeforeInsert(Trigger.new);
        }  
    }
}