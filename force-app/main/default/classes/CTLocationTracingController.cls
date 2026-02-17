public with sharing class CTLocationTracingController {
   
    /**
     * this method is use for get the visitors
     * @param locationId
     * @return
     */
    public static List<Location_Tracing__c> getVisitors(String locationId){
        return [SELECT Id, Person__c, Location__c, Visit_Date__c, Person__r.Token__c, Person__r.Health_Status__c 
                FROM Location_Tracing__c 
                WHERE Id = :locationId
                ORDER BY Visit_Date__c DESC];
    }

    /**this method is use for search the location
     * @param searchTerm
     * @return 
     */
    public static List<Location_Tracing__c> get_Locations_By_PersonIds(Set<Id>personIds){
        return [SELECT Id, Name, Person__c
                FROM Location_Tracing__c 
                WHERE Person__c IN :personIds
                AND Visit_Date__c = LAST_N_DAYS:10];
    }

    /**
     * this method is use for get the location by location ids
     * @param locationIds
     * @return
     */
    public static List<Location_Tracing__c> get_Locations_By_LocationIds(Set<Id>locationIds){
        return [SELECT Id, Person__c, Location__c, Visit_Date__c, Person__r.Token__c, Person__r.Health_Status__c 
                FROM Location_Tracing__c 
                WHERE Location__c IN :locationIds 
                AND Person__r.Health_Status__c = 'Green'
                AND Visit_Date__c = LAST_N_DAYS:10];
    }
    /**
     * this method is use for check the duplicates
     * @param newLocationTraces
     * @return
     *
     */
    public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c>newLocationTraces){
        //store non duplicate location ids
        Set<Id> locationId = new Set<Id>();
        // store non duplicate person ids
        Set<Id> personId = new Set<Id>();

        //adding location ids and person ids to set 
        for (Location_Tracing__c trace : newLocationTraces) {
            locationId.add(trace.Location__c);
            personId.add(trace.Person__c);

        }
        // get existing records
        Map<Id, Set<Id>> mapOfExistingRec = new Map<Id, Set<Id>>();

        // adding location ids and person ids to list
        List<Location_Tracing__c>existingRec = [SELECT Id, Person__c, Location__c, Visit_Date__c, Person__r.Token__c, Person__r.Health_Status__c 
                                            FROM Location_Tracing__c 
                                            WHERE Location__c IN :locationId
                                            AND  Person__c IN : personId
                                            AND Person__r.Health_Status__c = 'Green'
                                            AND Visit_Date__c = LAST_N_DAYS:10];
        // created a list for duplicates values 
        List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();

        // check for existing records have null values and it will less then 0
        if(existingRec != null && existingRec.size() > 0){
            // adding location ids to the map key
            for(Location_Tracing__c trace : existingRec){
                // 
                if (!mapOfExistingRec.containsKey(trace.Location__c)) {
                    mapOfExistingRec.put(trace.Location__c, new Set<Id>());
                }
                // adding person ids to the map value
                mapOfExistingRec.get(trace.Location__c).add(trace.Person__c);
            }
            
            for (Location_Tracing__c trace : newLocationTraces) {
                //first check for location Id
                // if Item found in map, then check for person in set
                if(mapOfExistingRec.containsKey(trace.Location__c) && mapOfExistingRec.get(trace.Location__c).contains(trace.Person__c)){
                    //if the location id and person id found in the map then add the record to the list as duplicate
                    duplicates.add(trace);
                }
            }
        }
        // return the list of duplicates
        return duplicates;
    }
    
}