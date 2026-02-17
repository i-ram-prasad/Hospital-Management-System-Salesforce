public with sharing class ContactTriggerHandller {
    
    public static void beforeInsert(List<Contact>conList){
        
        for (Contact con : conList) {
            if (con.AccountId != null ) {  //check for if the accountId is added or not;
                if(con.Department == 'Executive'){
                    con.Title = 'VIP Stakeholder';
                }else if (String.isBlank(con.Department)) {  //  which is a export suggestion is String.isBlank method is will work here instead of == null
                    con.Title = 'General Contact';
                }else {
                    con.Title = 'Department Lead';
                }
            }else {
               con.addError('Parent Information is mandatory for contact creation');
            }
           
        }
    }

    
}