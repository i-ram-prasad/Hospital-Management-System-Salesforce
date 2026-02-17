public class VowelCounter {
    
    public static List<String> vowelList = new List<String>{'a', 'e', 'i', 'o', 'u'};
    /*
     * This is ause case video from a teacher
     * I am excited to learn more around apex
     * Hii My Name is Ram Prasad
     */ 
    
    public static List<Integer> counteVowelsPerString(List<String>myStatement){
        List<Integer>totalvowelCounts = new List<Integer>();
        
        if(myStatement == null) return totalvowelCounts;
        for(String myStatementInFor : myStatement){
            Integer vowelCounterForList = 0;
            
            if(myStatementInFor != null){
                String lowerElements = myStatementInFor.toLowerCase();
            	for(String listOfVowels : vowelList){
					vowelCounterForList += lowerElements.countMatches(listOfVowels);
            	}
            }
            totalVowelCounts.add(vowelCounterForList);
        }
        
        return totalvowelCounts;
    }

}