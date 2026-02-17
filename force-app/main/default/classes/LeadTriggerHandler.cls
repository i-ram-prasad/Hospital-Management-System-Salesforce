public with sharing class LeadTriggerHandler {
    

    public static void beforeInsert(List<Lead>leadList){
        for(Lead l : leadList){
            if(l.Company == null){
                l.LeadSource = 'Other';
            }else if(l.Company.startsWithIgnoreCase('Sales')){
                l.LeadSource = 'Phone Inquiry';
            }else {
                l.LeadSource = 'Web';
            }
        }
    }
    
    public static void afterInsert(List<Lead>leadList){
        List<Task>taskListToInsert = new List<Task>();
        for (Lead leadrec : leadList) {
            
            Task taskRecord = new Task();
            taskRecord.Priority = 'High';
            taskRecord.OwnerId = leadrec.OwnerId;
            taskRecord.Description = 'Follow up with the new Lead';
            taskRecord.Status = 'Not Started';
            taskRecord.Subject = 'Follow Up';
            taskRecord.WhoId = leadrec.Id;

            taskListToInsert.add(taskRecord);
        }

        if(!taskListToInsert.isEmpty()){
            insert taskListToInsert;

        }
        for (Lead l : leadList) {
            
        }



    }

    public static void beforeDelete(List<Lead>leadList){
        for (lead leadRec : leadList) {
            System.debug('check 1');
            if (leadRec.Status == 'Working-Contacted' || leadRec.Status == 'Working - Contacted'){
                System.debug('check 2');
                leadRec.addError('You can not delete a Lead in Progress');
            }
        }
    }

    public static void handleBefore(List<Lead>newRec, Map<Id, Lead> oldMapRec){
        for(Lead l : newRec){

            Boolean isInsert = (oldMapRec == null);

            if(l.Industry == 'Technology'){
                if (isInsert || oldMapRec.get(l.Id).Industry != 'Technology') {
                    l.Rating = 'Hot';
                }
            }
        }

    }    


    
}