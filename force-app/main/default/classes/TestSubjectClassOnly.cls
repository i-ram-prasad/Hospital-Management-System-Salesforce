public class TestSubjectClassOnly {
    public Date startDate;
    public Date endDate;
    public Integer dayCount;
    
    public TestSubjectClassOnly(Date firstDate, Date secondDate){
        this.startDate = firstDate;
        this.endDate = secondDate;
    }
    public String getManualDuration(){
        if(startDate == null || endDate == null){
            return 'Dates are missing!';
        }
        
        //start Day
        Integer startDay = startDate.day();
        Integer startMonth = startDate.month();
        Integer startYear = startDate.year();
        
        //End Day
        Integer endDay = endDate.day();
        Integer endMonth = endDate.month();
        Integer endYear = endDate.year();
        
        if(endDay < startDay){
            endMonth = endMonth - 1;
            
            endDay = endDay + 30;
            
        }
        Integer finalDays = endDay - startDay;
        
        if(endMonth < startMonth){
            endYear = endYear - 1;
            
            endMonth = endMonth + 12;
        }
        Integer finalMonths = endMonth - startMonth;
        
        Integer finalYears = endYear - startYear;
        
        return finalYears + ' Years, '+ finalMonths +'Months, '+ finalDays +'Days';
        
    }

}