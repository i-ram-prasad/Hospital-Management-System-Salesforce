public class LoopsInApex {
    public static void handleForLoops(){
        List<String> myCharacter = new List<String>{'Trainer', 'Mentor', 'Reader', 'Invester'};
        	
            for(String i : myCharacter){
                System.debug(i);
            }
        
        Set<Id> myId = new Set<Id>{'001g5000003sloEAAQ', '001g5000001gnNfAAI'};
            for(Id eachId : myId){
                System.debug(eachId);
            }
        
        Map<Id, String>myAccInfo = new Map<Id, String>();
        myAccInfo.put('001g5000001gnNfAAI', 'sForce');
        myAccInfo.put('001g5000003sloEAAQ' , 'Snap Tales');
        
        for(Id recId : myAccInfo.keyset()){
            System.debug('this Id is: '+ recId + ' and the value is '+ myAccInfo.get(recId));
        }
        
        List<Account> accRec = [SELECT Id, Name FROM Account];
        for(Account acc : accRec){
            System.debug(acc);
        }
    }

}