trigger UseCase_1 on Task (before insert) {
    //WHen ever Task is Created set priority to HIgh

    if(Trigger.isInsert && Trigger.isBefore){
        //do field update
        for(Task taskRecord : Trigger.NEW){
            System.debug('Found Task Record');
            taskRecord.Priority = 'High';
            
        }
    }

}