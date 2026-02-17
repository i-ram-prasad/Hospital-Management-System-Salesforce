public class LibraryTracker {
    
    public static List<String> allMyBook = new List<String>();
    
    //Book Name vs person who borrowed it?
    
    public static Map<String, String>borrowerMapping = new Map<String, String>();
    
    public static void addBooksToLibrary(String bookName){
        allMyBook.add(bookName);
    }
    
    public static void leanBooksToSomeone(String bookName, String personName){
        List<String>remainingBooks = new List<String>();
        
        if(allMyBook.contains(bookName)){
            borrowerMapping.put(bookName, personName);
        
        
        	for(String eachBook : allMyBook){
            	if(eachBook != bookName){
                	remainingBooks.add(eachBook);
            	}
        	}
        	allMyBook = remainingBooks;
        }
    }    
    public static Map<String, String> displayBooksBorrowed(){
        System.debug(borrowerMapping);
        return borrowerMapping;
    }
    public static List<String> showMyCurrentRepository(){
        System.debug(allMyBook);
        return allMyBook;
    }

}