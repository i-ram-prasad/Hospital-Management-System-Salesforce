public with sharing class UseCase_6 {
    
    public static Boolean checkVotingRights(Date dateOfBirth){
        Date toDaysDate = System.today();
        Integer totalDaysBetween = (dateOfBirth.daysBetween(toDaysDate)/365) ;
        // Integer convertedIntoYears = totalDaysBetween / 
        if(totalDaysBetween >= 18){
            return true;
        }
        return false;
    }
}