trigger CaseTrigger on Case (before insert) {

    if (Trigger.isBefore && Trigger.isInsert) {

        for(Case caseRec : Trigger.New){
            if(caseRec.Origin == 'Phone'){
                caseRec.Priority = 'High';

            }else {
                caseRec.Priority = 'Low';
            }
        }
    }
}