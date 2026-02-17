public with sharing class UseCase_12 {
    //Write to identify the last 5 tasks created today
    public static List<Task> createdTasks(){
        List<Task> taskByToDay = [SELECT Id, Subject FROM Task WHERE CreatedDate = THIS_MONTH LIMIT 5];
        
        return taskByToDay;
    }
}