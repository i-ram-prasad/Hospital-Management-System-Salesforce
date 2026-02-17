public class UseCase_13 {
//Write a method to find the name of the person from the email address provided
//Note: All email addresses are in company format:
//firstname_lastname@companyname.com
    public static String nameReturnFromMail(String emails){
        String fullName = '';
        if(String.isBlank(emails) || !emails.contains('@')){
            return 'Invalid Eamil';
        }
        String extractedName = emails.substringBefore('@');
        String firstName = extractedName.substringBefore('_');
        String lastName = extractedName.substringAfter('_');
        
        fullName = firstName + ' ' + lastName;


        return fullName;
    }

}