public with sharing class UseCase_9 {
   
    //Write a method that tells you a person is a Genz or a Millenial or Gen Alpha
    public static String checkGeneneration(Date dateOfBirth){
        if(dateOfBirth != null ){
            if(dateOfBirth.year() > 1981 && dateOfBirth.year() < 1996){
                return 'millenial';
            }else if(dateOfBirth.year() > 1996 && dateOfBirth.year() < 2012){
                return 'Gen Z';
            }else if(dateOfBirth.year() > 2012 && dateOfBirth.year() < 2025){
                return 'Gen Alpha';
            }else{
                return 'Other Generation';
            }
            
        }

        return 'Invalid Date';
    }
}