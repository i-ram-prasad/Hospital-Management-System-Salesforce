public class MyFavoriteKeyWord {
    public static void handleNullChecks(){
        Account acc = [SELECT Id, Site FROM Account WHERE Id = '001g5000003sloEAAQ'];
        System.debug('Before update Site Info: '+ acc.site);
        acc.Site = '';
        update acc;
        System.debug('after update Site Info: '+ acc.site);
        if(acc.Site == null){
            System.debug('NO Site has been published ');
        }else{
            System.debug('Site has been published ');
        }
    }
    
    public static void handleBlankScenarios(){
        
    }
}