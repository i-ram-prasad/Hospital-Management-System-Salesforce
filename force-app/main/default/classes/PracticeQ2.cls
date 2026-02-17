public class PracticeQ2 {
    
    public static void checkHighestAndLowest(Map<String, Integer>myReport){
        
        Integer maxMarks = 0;
        Integer minMarks = 0 ;
        for(String subject:myReport.keySet()){
            if(minMarks == 0){
                minMarks = myReport.get(subject);
            }
            
            Integer subjectMarks = myReport.get(subject);
            if(maxMarks < subjectMarks){
                maxMarks = subjectMarks;
            }
            if(minMarks > subjectMarks){
                minMarks = subjectMarks;
            }
            
        }
        System.debug('MaxMark is : '+ maxMarks);
        System.debug('MinMark is : '+ minMarks);
    }
    
    public static void checkHighAndLow(Map<String, Integer>myReport){
        List<Integer>allMarks = myReport.values();
        allMarks.sort();
        
        System.debug('Max Mark is: '+ allMarks[allMarks.size() - 1]);
        System.debug('Min Mark is: '+ allMarks[0]);
        
    }
    
    //method to add new items I need to do 
    
    public static List<WorkItem>toDoList = new List<WorkItem>();
    
    public static void addNewWorkItem(WorkItem toDoItem){
        toDoList.add(toDoItem);
        
    }
    
    public static List<PracticeQ2.WorkItem> retriveToDoList(){
        return toDoList;
    }
    
    //method to update the item that i have completed
    public static void updateWorkItem(Integer WorkItemId, String newStatus){
        //find the work item from my current list. if i find it, I will update the corresponding status
        for(PracticeQ2.WorkItem workItem : toDoList){
            if(workItem.toDoId == workItemId){
                workItem.toDoStatus = newStatus;
            }
        }
        System.debug(toDoList);
        
    }
    public static void deleteWorkItem(Integer workItemId){
        Integer indexToRemove = -1;
        for(Integer i = 0;i < toDoList.size();i++){
            if(toDoList[i].toDoId == workItemId){
                indexToRemove = i;
                break; 
            }
        }
        if(indexToRemove != -1){
            toDoList.remove(indexToRemove);
        }
        System.debug('Update List after deletion: '+toDoList);
    }
    
    public static Integer totalToDoListItems(){
        return toDoList.size();
        
    }
    
    public class WorkItem{
        public Integer toDoId;
        public String toDoName;
        public String toDoDescription;
        public String toDoStatus;
        
    }

}