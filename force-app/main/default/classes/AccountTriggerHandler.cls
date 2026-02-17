public with sharing class AccountTriggerHandler {
    

    public static void beforeInsert(List<Account>accList){
        for(Account acc : accList){
            if(acc.AnnualRevenue == null || acc.AnnualRevenue < 1000000){
                acc.Rating = 'Cold';
            }else if (acc.AnnualRevenue >= 1000000 || acc.AnnualRevenue < 2000000) {
                acc.Rating = 'Warm';
            }else if (acc.AnnualRevenue >= 2000000 ) {
                acc.Rating = 'Hot';
            }
        }
    }

    public static void beforeUpdate(List<Account>newRec, Map<Id,Account>oldMapRec){

        for(Account accRec : newRec){
            if(accRec.Industry == 'Agriculture' && accRec.Type == 'Prospect'){
                if(oldMapRec.get(accRec.Id).Ownership != accRec.Ownership && accRec.Ownership == 'Private'){
                    accRec.addError('Ownership Can not Be modified <AccountTriggerHandler, before Update>'); 
                }
            }
        }
    }

    public static void afterUpdate(List<Account>accList, Map<Id, Account> oldMapRec){

        //List<Account> addAccToUpdateChildren = new List<Account>();
        Map<Id, String> accToWebsiteMap = new Map<Id, String>();
        //List<Id>addIdList = new List<Id>();

        for(Account acc : accList){
            if(acc.Website != oldMapRec.get(acc.Id).Website){
                accToWebsiteMap.put(acc.Id, acc.Website);
                //addAccToUpdateChildren.add(acc);
                //addIdList.add(acc.Id);
            }
        }
        if (accToWebsiteMap.keySet().size() > 0) {
            List<Contact> addConToUpdate = new List<Contact>();
            List<Contact>conRecords = [SELECT Id, FirstName, Website__c, AccountId 
                                       FROM Contact
                                       WHERE AccountId IN : accToWebsiteMap.keySet()];

            for(Contact con : conRecords){
                con.Website__c = accToWebsiteMap.get(con.AccountId);
                addConToUpdate.add(con);
            }

            if(addConToUpdate.size() > 0){
                update addConToUpdate;
            }
        }
    }

    public static void afterInsert(List<Account> newRec){
        List<Contact> conList = new List<Contact>();

        for(Account acc : newRec){
            if(acc.Create_N_Contacts__c != null){
                for(Integer i = 0; i < acc.Create_N_Contacts__c; i++){
                    Contact con = new Contact();
                    con.LastName = acc.Name + i;
                    con.AccountId = acc.Id;
                    
                    //mapofAccwithContactSize.put(acc.Id, acc.Create_N_Contacts__c);

                    conList.add(con);
                }
            }
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
}