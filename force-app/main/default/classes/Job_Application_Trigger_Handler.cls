public with sharing class Job_Application_Trigger_Handler {
    
    public static void onAfterInsert(List<Job_Application__c> jobApplication, Map<Id, Job_Application__c> oldMapdata){

        List<Task>taskToCreate  = new List<Task>();

        // the use of for loop is to check if the application status is inteview or not
        for(Job_Application__c jobApp : jobApplication){

            // check the jobApp is 
            Boolean isInterview = (jobApp.Application_Status__c == 'Interview');

            Boolean shouldCreate = false;

            if(oldMapdata == null){
                if(isInterview) {
                    shouldCreate = true;
                }
            }else {

                Job_Application__c oldApp = oldMapdata.get(jobApp.Id);
                if(isInterview && oldApp.Application_Status__c != 'Interview'){
                    shouldCreate = true;
                }
            }

            if (shouldCreate) {
                taskToCreate.add(new Task(
                    Subject = 'Prepare: Research Company & Question',
                    WhatId = jobApp.Id,
                    //OwnerId = jobApp.Owner,
                    ActivityDate = Date.today(),
                    Status = 'Not Started',
                    Priority = 'High'
                ));

                taskToCreate.add(new Task(
                    Subject = 'Prepare: Review Technical Skills',
                    WhatId = jobApp.Id,
                    //OwnerId = jobApp.Owner,
                    ActivityDate = Date.today(),
                    Status = 'Not Started',
                    Priority = 'High'

                ));
            }


            
        }
        if(!taskToCreate.isEmpty()){
            insert taskToCreate;
        }
    }
}