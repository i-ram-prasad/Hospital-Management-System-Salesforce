public class LearningConstructors {
    
   	public static void checkAccessForVariables(){
		TestSubjectClassOnly myTestOnly = new TestSubjectClassOnly(Date.newInstance(2003, 6, 20), System.today());
        //myTestOnly.TestSubjectClassOnly(System.today(), Date.newInstance(2003, 6, 20));
        
        System.debug(myTestOnly.getManualDuration());
    }

}