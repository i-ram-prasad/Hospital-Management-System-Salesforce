public class conditionalsInApex {
    public static void handleCustomerInteraction(String typeOfCustomer, Decimal purchesAmount, Boolean isNewCustomer, Boolean refundRequired){
        if(purchesAmount > 0){
            System.debug('Congratulations, your purchase is successful.');
        }
        if(typeOfCustomer == 'premimum'){
            System.debug('Thank you for purchase, Here\'s Your coupon: F18075003040 for a 50% off');
        }
        if(isNewCustomer ){
            System.debug('Welcome to our company, here\' 500 added to your card as welcome bonus');
          
        }
        if(refundRequired ){
            System.debug('Sorry for the quality, Please fill out this survey for us to assis you better');
        }
        
    }
    
    public static void handleMyScheduleSwitchCase(Integer timeInHours){
        switch on timeInHours{
            when 9 {
                System.debug('It\'s breakfast time!');
            }
            when 13 {
                System.debug('It\'s Lunch time!');
            }
            when 16, 19 {
                System.debug('It\'s time to play outside');
            }
            when 21{
                System.debug('It\'s Dinner Time');
            }
            when else{
                System.debug('Free time Lets sleep');
            }
        }
        
    }

}