public with sharing class CTPersonController {
   public static String getTocken(String mobileNumber){
      Blob value = Blob.valueOf(mobileNumber);
      Blob hash = Crypto.generateDigest('MD5', value);

      return EncodingUtil.base64Encode(hash);
   }

   public static List<Person__c> getRecentHealthChanges(){
      return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
              FROM Person__c 
              ORDER BY Status_Update_Date__c DESC 
              LIMIT 100];
      /**
       * The "Shortcut" (Cleaner/Professional)
         Use this when the code is finished and you want it to look "Clean."
       */
      
   }

   public static List<Person__c> searchPeople(String searchTerm){
      searchTerm = searchTerm + '%';
      return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
               FROM Person__c WHERE 
               Name LIKE :searchTerm OR 
               Mobile__c LIKE :searchTerm OR 
               Token__c LIKE :searchTerm 
               ORDER BY Status_Update_Date__c DESC];
   }
   public static Person__c getPersionById(String personId){

      List<Person__c>people = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
                                 FROM Person__c 
                                 WHERE Id = :personId];
      if(people != null && people.size() > 0){
         return people[0];
      }
      return null;
   }
}