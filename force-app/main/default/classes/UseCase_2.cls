public class UseCase_2 {
    
    // Write a method that calculates the Simple Interest for a given principal, interest and time and returns the SI as the result
    public static Decimal calculateIntrest(Decimal principle, Decimal interest, Integer timeInYear){
        if (principle != null && interest != null && timeInYear != null) {
            Decimal simpleInterest = (principle * interest * timeInYear) / 100;
            
            return simpleInterest;

        }
        return 0;
        
    }
}