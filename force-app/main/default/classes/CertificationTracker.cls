public class CertificationTracker {
    public static Map<String, Date> myCertificationData = new Map<String,Date>();
    public static void addNewCertifications(String certificateName, Date issueDate){
        myCertificationData.put(certificateName, issueDate);
        
    }
    public static List<Date> returnCertCount(){
        return myCertificationData.values();
    }

}