public  class OpportunityTriggerHandler {

   public static void handleActivitiesBeforeUpdate(List<Opportunity>newOppList, Map<Id, Opportunity>oldMapOpp){
      
      //Opportunity newOpp = newOppList[0];
      //Opportunity oldOpp = oldOppList[0];
      // on the above trick is not bulkiyfied so we donot use it 

      for(Opportunity newOpp : newOppList){
         if (oldMapOpp.get(newOpp.Id).StageName != newOpp.StageName) {
            newOpp.Amount = newOpp.Probability * newOpp.ExpectedRevenue;      
         }
      }
   }
   

   public static void handleActivitiesAfterInsert(List<Opportunity>oppList){
      for (Opportunity opp : oppList) {
         if(opp.Amount >= 100000){
            opp.Description = 'Large Enterprise Deal';
         }else if(opp.Amount >= 10000 && opp.Amount <= 99999){
            opp.Description = 'Mid-Market Deal';
         }else if (opp.Amount == null) {
            opp.Description = 'Small Business Deal';
         }
      }
   }

   public static void handleActivitiesAfterUpdate(List<Opportunity>oppList){
      List<Task>taskListToBeInsert = new List<Task>();

      for(Opportunity opp : oppList){
         if(opp.StageName == 'Closed Won'){
            Task taskRecord = new Task();
            taskRecord.Priority = 'High';
            taskRecord.OwnerId = opp.OwnerId;
            taskRecord.Description = 'Please split the revenue among the team';
            taskRecord.Status = 'Not Started';
            taskRecord.Subject = 'Split Revenue';
            taskRecord.WhatId = opp.Id;
            
            taskListToBeInsert.add(taskRecord);
               
            }
        }
        if(!taskListToBeInsert.isEmpty()){
            insert taskListToBeInsert;
        }
   }
}