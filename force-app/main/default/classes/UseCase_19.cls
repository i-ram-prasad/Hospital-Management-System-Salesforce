public with sharing class UseCase_19 {
   public static String checkObjectType(Id recordId){
    String objectType = '';
    Map<String, Schema.SObjectType> globalDescMap = Schema.getGlobalDescribe();
    for(String eachString : globalDescMap.keySet()){
        String keyPrefix = globalDescMap.get(eachString).getDescribe().getKeyPrefix();
        //System.debug(keyPrefix);
        if (keyPrefix != null) {

            if(String.valueOf(recordId).startsWith(keyPrefix)){
                objectType = eachString;
            }
        }
        
    }
    // the getSobjectType is comes in top level class schema class
    return objectType;
   }
}