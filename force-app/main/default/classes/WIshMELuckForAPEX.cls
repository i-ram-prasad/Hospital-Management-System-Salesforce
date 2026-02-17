public class WIshMELuckForAPEX{ 
    public Boolean isThisCorrect;
    public Account myAccRecord;
    
    public static String dateOfBirthCalculater(Date dateOfBirth){
        
        
        Date todaysDate = System.today();
        Integer result = (dateOfBirth.monthsBetween(todaysDate))/12;
        String returnValue = 'Your age is '+ result + ' years';
        
        return returnValue;
    }
    
    WIshMELuckForAPEX(){
		this.isThisCorrect = false;
        this.myAccRecord = new Account();
        
    }
    
    //constructor - executes every time a class instatiated 
    WIshMELuckForAPEX(Boolean isThisCorrect){
       this.isThisCorrect = isThisCorrect;
		
    }
}