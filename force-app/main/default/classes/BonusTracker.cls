public class BonusTracker {
    
    public static Decimal fetchFinalBonusAmount(String employeeType){
        Decimal bonusAmount = 25000;
        
        if(employeeType == 'Manager'){
            bonusAmount += 5000 ;
        }else if(employeeType == 'Region Head'){
             bonusAmount += 10000 ;
            
        }else if(employeeType == 'SVP'){
             bonusAmount += 15000 ;
            
        }else if(employeeType == 'VP'){
             bonusAmount += 20000 ;
            
        }else if(employeeType == 'CEO' || employeeType == 'CTO' || employeeType == 'COO'){
             bonusAmount += 30000 ;
            
        }
        
        return bonusAmount;
        
    }
	
}