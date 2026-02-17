public class PracticeQ1 {
    
    public static String correctPassword = 'Jun3040';
    public static Integer attemptCounter = 0;
    
    
    public static Integer checkForMakesSenseKeyword(List<String>statements){
        Integer makesSenseCounter = 0;
        for(String statement : statements){
            if(statement.contains('Makes Sense')){
                makesSenseCounter++;
            }
        }
        return makesSenseCounter;
    }
    
    public static Integer checkNewLearning(Map<String, Boolean>weekLog){
        //take a look at the map variable, irerate over the keys check if the value is true, if no, increment a counter by 1
        //finally return the counter value after the iteration/loop is completed.
        Integer numberOfDaysILearnentSomeThingNew = 0;
        for(String weekDay : weekLog.keySet()){
            Boolean currentDayStatus = weekLog.get(weekDay);
            
            if(CurrentDayStatus){
                numberOfDaysILearnentSomeThingNew++;
            }
         }
        return numberOfDaysILearnentSomeThingNew;
    }
    
      
    public static void handlePasswordWithLoop(List<String>tries){
        
        for(String s : tries){
            if(s != correctPassword){
                attemptCounter++;
                System.debug('failure');
            }else{
                System.debug('Success');
            }

            if(attemptCounter == 3){
                System.debug('Account Locked you can\'t get more attempts');
            }
        }
        
    }
    

    public static void attemptDifferentPasswords(){
        String finalAnswer = '';
        finalAnswer = handlePasswordAttempts('Ram3040');
        System.debug(finalAnswer);
        finalAnswer = handlePasswordAttempts('jus3040');
        System.debug(finalAnswer);
        finalAnswer = handlePasswordAttempts('Jum3040');
        System.debug(finalAnswer);
        finalAnswer = handlePasswordAttempts('Nothing');
        System.debug(finalAnswer);
    }
    
    
    public static String handlePasswordAttempts(String passwordInput){
        
        
        if(passwordInput != correctPassword){
            if(attemptCounter > 3){
                return 'Maximum attempts reached, Your Account is Locked';
            }
            attemptCounter++;
            return 'Failure';
        }else{
            return 'Success';
        }
        
        //return 'success/fail';
    }

}