public with sharing class UseCase_3 {

    public static void sendEamil(String email){
        List<String> emailList = new List<String>{email};

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('URGENT- Take a Look');
        mail.setPlainTextBody('This is a notification triggered by salesforce via apex for you');
        mail.setToAddresses(emailList);

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}