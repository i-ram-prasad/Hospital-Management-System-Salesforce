public with sharing class CTPeopleTracingController {
    
    /**
     * this method is use for get the traces
     * @param personId
     * @return
     */
    public static List<People_Tracing__c> getTraces(String personId){
        return [SELECT Id, Name, Contact_Date__c, Person_1__c, Person_1__r.Health_Status__c, Person_1__r.Token__c, Person_2__c, Person_2__r.Health_Status__c, Person_2__r.Token__c 
                FROM People_Tracing__c
                WHERE Person_1__c = :personId OR Person_2__c = :personId 
                ORDER BY Contact_Date__c DESC];
    }

    /**
     *  this method is use for check the duplicates
     * @param newPeopleTraces
     * @return
     * */

    public static List<People_Tracing__c> checkDuplicates(List<People_Tracing__c> newPeopleTraces){
        // store non duplicate person ids
        Set<Id> personId = new Set<Id>();
        // adding person ids to set
        for(People_Tracing__c trace : newPeopleTraces){
            personId.add(trace.Person_1__c);
            personId.add(trace.Person_2__c);

        }
        // 
        List<People_Tracing__c> duplicates = new List<People_Tracing__c>();
        // get existing records
        Map<Id,Set<Id>> mapOfExistingRecords = new Map<Id, Set<Id>>();

        // adding person ids to list
        List<People_Tracing__c> existingRecords = [SELECT Id, Person_1__c, Person_2__c 
                                                    FROM People_Tracing__c
                                                    WHERE Person_1__c = :personId
                                                    OR Person_2__c = : personId];

        // check for existing records have null values and it will less then 0
        if(existingRecords != null && existingRecords.size() > 0){

            
            for(People_Tracing__c trace : existingRecords){
                // for person 1
                if(!mapOfExistingRecords.containsKey(trace.Person_1__c)){
                    mapOfExistingRecords.put(trace.Person_1__c, new Set<Id>());
                }
                mapOfExistingRecords.get(trace.Person_1__c).add(trace.Person_2__c);
                //for person 2
                if(!mapOfExistingRecords.containsKey(trace.Person_2__c)){
                    mapOfExistingRecords.put(trace.Person_2__c, new Set<Id>());
                }
                mapOfExistingRecords.get(trace.Person_2__c).add(trace.Person_1__c);
            }
            // adding person ids to the duplicate List value
            for(People_Tracing__c trace : newPeopleTraces){
                if(
                    (mapOfExistingRecords.containsKey(trace.Person_1__c) && mapOfExistingRecords.get(trace.Person_1__c).contains(trace.Person_2__c))
                    ||
                    (mapOfExistingRecords.containsKey(trace.Person_2__c) && mapOfExistingRecords.get(trace.Person_2__c).contains(trace.Person_1__c))
                    
                    ){
                        duplicates.add(trace);
                }
            }
        }
        // return the list of duplicates
        return duplicates;
    }
}