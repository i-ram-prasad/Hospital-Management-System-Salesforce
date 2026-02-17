public class HandleDatabaseOperations {
    public static void createAccountRecords(){

        String finalResponse = 'Success';
        Account acc1 = new Account(Name = 'SMS', Rating = 'Hot', NumberOfEmployees = 2, SIC = '1432');
        Account acc2 = new Account(Name = 'its_Snap_tales', Rating = 'Hot', NumberOfEmployees = 1, SIC = '1432');
        //acc.Name = 'First Account';
        List<Account> accListToInsert = new List<Account>{acc1, acc2};
        List<Id> accIds = new List<Id>();
        List<String> errorResponse = new List<String>();
        List<Database.SaveResult> resultArray = Database.insert(accListToInsert, false);


        for(Database.SaveResult saveRes : resultArray){
            if(saveRes.isSuccess()){
                accIds.add(saveRes.getId());
            }else {
                System.debug(saveRes.getErrors());
                for(Database.Error errorResponses : saveRes.getErrors()){
                    errorResponse.add(errorResponses.getFields() + ' - '+ errorResponses.getMessage());
                }
            }
            //System.debug(saveRes);
        }

        System.debug('Successfully inserted: '+ accIds);
        System.debug('SuccessFully Failed: '+errorResponse);

        //we can write the Database.SaveResult[] in 2 types 
        //we can also write like this List<Database.SaveResult> 
    }
    
    public static void createTaskAndLinkWithNewAccount(String accountName){
        
        List<Account>accountToLink = [SELECT Id FROM Account
                                      WHERE Name = :accountName 
                                      LIMIT 1];
        
        Task taskRecord = new Task();
        taskRecord.Subject = 'Follow Up';
        taskRecord.Status = 'Not Started';
        taskRecord.Priority = 'Normal';
        
        if(accountToLink.size() == 1){
            taskRecord.WhatId = accountToLink[0].Id;
        }
        
        insert taskRecord;
    }
    public static void createTaskForServiceRep(String serviceRep){
        List<Contact>con = [SELECT Id FROM Contact WHERE Name = :serviceRep LIMIT 1];
        
        
        
        Task taskToCreate = new Task();
        taskToCreate.Subject = 'Visit Promises';
        taskToCreate.Status = 'Not Started';
        taskToCreate.Priority = 'High';
        
        if(con.size() == 1){
            taskToCreate.WhoId = con[0].Id;
        }
        
        Database.insert(taskToCreate);
        
    }
    public static void handleCaseFieldUpdate(String caseStatus){
        
        List<Case>caseToUpdate = new List<Case>();
        List<Case> caseRecordToUpdate = [SELECT Id, CaseNumber FROM Case WHERE Status = :caseStatus];
        
        for(Case caseRec : caseRecordToUpdate){
            caseRec.Status = 'Closed';
            caseToUpdate.add(caseRec);
            
        }
        //System.debug(caseToUpdate);
        Database.update(caseToUpdate,false);
    }
    
    public static void handleInsertAndUpdateTogether(){
        
        List<Account>accsToUpsert = new List<Account>();
        
        Account accRecord = new Account();
        accRecord.Name = 'First Company to Insert';
        
        Account accRecord2 = new Account();
        accRecord2.Name = 'Second Company To Insert';
        
      
        accsToUpsert.add(accRecord);
        accsToUpsert.add(accRecord2);
        
        
        List<Account>accList = [SELECT Id, Name FROM Account WHERE AccountNumber != null];
        for(Account acc : accList){
            acc.Rating = 'Hot';
            accsToUpsert.add(acc);
            
        }
		System.debug(accsToUpsert);
        
        Database.upsert(accsToUpsert, false);
        
        
    }
    
    public static void practiceQuestion1ByAI(){
        Account accRec = new Account(Name = 'Global Tech');
        insert accRec;
        
		//Create contact 1
        List<Contact>conList = new List<Contact>();
        Contact c1 = new Contact(FirstName = 'Ram', LastName = 'Prasad');
        c1.AccountId = accRec.Id;
        conList.add(c1);
        
        
        //Create contact 2
        
        Contact c2 = new Contact(FirstName = 'Syam', LastName = 'Charan');
        c2.AccountId = accRec.Id;
        conList.add(c2);
        
        
        System.debug(conList);
        
        Database.insert(conList, false);
    }
    
    public static void practiceQuestion2ByAI(){
        
        List<Lead> leadRec = [SELECT Id, Name FROM Lead WHERE LeadSource = 'Web'];
        List<Lead>updatedLeads = new List<Lead>();
        if(!leadRec.isEmpty()){
        	for(Lead l1 : leadRec){
            	l1.Rating = 'Hot';
			//updatedLeads.add(l1);
			}
        }
        System.debug(leadRec);
        Database.update(LeadRec, false);
    }
    
    public List<Account> createAccountsWithIndustry(Map<String, String> nameToIndustry) {
        // Create Account records with names and industries from the map
        // Return the list of inserted Accounts
        List<Account> acc = new List<Account>();
        for(String name : nameToIndustry.keySet()){
            Account accRec = new Account();
            accRec.Name = name;
            accRec.Industry = nameToIndustry.get(name);
            acc.add(accRec);
        }
        
        Database.insert(acc,false);
        return acc;
    
    
    }
    public static void handleOpportunityDeletion(String stageName){
        List<Opportunity> oppListToDelete = [SELECT Id 
                                            FROM Opportunity 
                                            WHERE StageName = :stageName];
        if(!oppListToDelete.isEmpty()){
            Database.delete(oppListToDelete,false);
            //Delete oppListToDelete;
        }

    }

    public static void recoverLostOpportunites(){
        List<Opportunity> oppsListToRecover = [SELECT Id, StageName, IsDeleted 
                                              FROM Opportunity 
                                              WHERE LastModifiedDate = today AND IsDeleted = true ALL ROWS];
        // System.debug(oppsListToRecover);
        if(oppsListToRecover.size() >= 0){
            undelete oppsListToRecover;
        }
    }




}