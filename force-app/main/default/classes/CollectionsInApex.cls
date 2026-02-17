public class CollectionsInApex {
    public static void handleMapCollection(String empId){
        
        Map<String, String>employeeDetails = new Map<String, String>();
            employeeDetails.put('EXP1024', 'Ram Majhi');
        	employeeDetails.put('EXP1025', 'Syam Majhi');
        
        System.debug('Before Init '+ employeeDetails);
        
        employeeDetails.remove('EXP1025');
        
        System.debug('After Init' + employeeDetails);
        
        employeeDetails.put('EXP1024', 'Preeti');
        
        System.debug('after adding duplicate key '+ employeeDetails);
        
        employeeDetails.put('EXP1024', 'Syam ');
        employeeDetails.put('EXP1025', 'Anjali');
        employeeDetails.put('EXP1026', 'Sid');
        employeeDetails.put('EXP1027', 'Piyush');
        employeeDetails.put('EXP1028', 'Bibhu');
        employeeDetails.put('EXP1029', 'Bob j.');
        employeeDetails.put('EXP1030', 'Matt Le');
        
        System.debug('All the Employee ids are '+ employeeDetails.keySet());
        
        System.debug('All the Employees Name are '+ employeeDetails.values());
        
        System.debug('The total Employee should be '+ employeeDetails.size());
        
        System.debug('You trying to seeking info of '+ employeeDetails.get(empId));
    }
    
    public static void handleListCollection(){
        Integer i = 1;
        String myName = 'Ram Prasad';
        List<String> myFavBook = new List<String>{'The Monk who sold his Ferrari', '5 AM Club', 'Chatasali', 'Ikigai'};
        List<Integer> myFavNumber = new List<Integer>{12, 30, 32, 3040};
        
		Account accRec = new Account();
        List<Account> accountRecords = new List<Account>{accRec};
        
            //How to add number in list
            myFavBook.add('Sahitya bahi');
        	myFavNumber.add(3040);
        
        System.debug('My Favorite number is '+ myFavNumber); //12, 30, 32, 3040, 3040
        System.debug('My Favorite Book list is Empty? '+ myFavBook.isEmpty()); //false
        System.debug(myFavBook.size() == 0); //false
        System.debug('Ikigai is placed at: '+ myFavBook.indexOf('Ikigai')); //3	
        String yourFavBook = 'The Four Afreements';
        System.debug(myFavBook.contains(yourFavBook));
    }    
    
    
    public static void handleSetCollection(){
        Set<String>myPaintings = new Set<String>();
        Set<String> myCurrencies = new Set<String>{'AED', 'INR', 'CAD', 'USD'};
        System.debug(myCurrencies);
        
        System.debug(myCurrencies.add('SGD'));
        System.debug(myCurrencies.remove('USD'));
        //myCurrencies.get(0);
        //myCurrencies.indexOf('CAD');
        System.debug(myCurrencies.size());
        System.debug(myCurrencies.contains('MRU'));
        
        System.debug(myCurrencies);
        
        //System.debug(myCurrencies[0]);
        
    }

}