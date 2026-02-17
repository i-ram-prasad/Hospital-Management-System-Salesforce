public class TravelTracker {
    
    //Year of visit vs List of Countries on that particular year
    //Map<Integer, List<String>>
    public static Map<Integer, List<String>>placeVisitedDirectory = new Map<Integer, List<String>>();
    public static List<String>myWishList;
    
    
    public static Map<Integer,List<String>> captureLocations(String countryName, Integer yearOfVisit){
        if(placeVisitedDirectory.containsKey(yearOfVisit)){
            
            List<String> countriesVisited = placeVisitedDirectory.get(yearOfVisit);
            countriesVisited.add(countryName);
            
            placeVisitedDirectory.put(yearOfVisit, countriesVisited);
            
        }else{   
            placeVisitedDirectory.put(yearOfVisit, new List<String>{countryName});
        }
        return placeVisitedDirectory;  
    }
    
    //add values to my list or i can view my wish list
    public static List<String> wishListTracker(String countryIWishToVisit){
        
        // i need to check whether I need to instantiate the list or continue adding new countries
        if(myWishList == null){
            myWishList = new List<String>{countryIWishToVisit};    
        }else{
            myWishList.add(countryIWishToVisit);
        }
 
        return myWishList;
    }
    public static List<String> showCountriesVisited(Integer yearOfVisit){
        return placeVisitedDirectory.get(yearOfVisit);
        
    }
    public static Integer retriveCountryCount(Integer yearOfVisit){
        return placeVisitedDirectory.get(yearOfVisit).size();
        
	}
    
    public static Integer countSpecificCountry(String countryVisited){
        Integer count = 0;
        for(Integer d : placeVisitedDirectory.keySet()){
            for(String str : placeVisitedDirectory.get(d)){
                if(countryVisited == str){
                    count++;
                }
            }
        }
        
         return count;
        
    }
    
    
}