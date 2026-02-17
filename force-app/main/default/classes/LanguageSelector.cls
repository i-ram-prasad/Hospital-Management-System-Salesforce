public class LanguageSelector {

    public static String returnLanguageType(String countryName){
        
        switch on countryName{
            when 'UAE'{
                return 'Arabic';
            }when 'US'{
                return 'English';
            }when 'UK'{
                return 'English';
            }when 'Russia'{
                return 'Russian';
            }when 'China'{
                return 'Chinese';
            }when else{
                return 'English';
            }
        }
    }

}