public with sharing class UseCase_8 {
    
    // Write a method that checks if a number is divisible by 7 and 11 both
    public static Boolean divisibleOrNOt(Integer num ){
        
        return (Math.mod(num, 7) == 0 && Math.mod(num, 11) == 0)? true : false;
    }
}