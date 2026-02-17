public class VariablesAndKeywords {
    public Boolean isItCorrect = true;
    public Account myAccRecord = new Account();
    private Date toDaysDate = System.today();
    
    public void calculateFinalAmount(){
        
    }
    public static Decimal returnDiscountForSpecificCustomer(Decimal sellingPrice, Integer discountPercent){
        Decimal finalPrice = sellingPrice - (sellingPrice * discountPercent) / 100;
        return finalPrice;
    }
    public static Decimal returnDiscountForSpecificCustomer(String customerType, Decimal sellingPrice, Integer discountPercent){
        if(customerType == 'Retail'){
        	Decimal finalPrice = sellingPrice - (sellingPrice * discountPercent)/100;
        	return finalPrice;
        }
        else {
            Decimal finalPrice = sellingPrice - ((sellingPrice * discountPercent)/100 + (sellingPrice * 0.15));
        	return finalPrice;
        }
    }
}