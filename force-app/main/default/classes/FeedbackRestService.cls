@RestResource(urlMapping='/v1/feedback/*')
global with sharing class FeedbackRestService {

    // POST: Saves a new comment from a visitor
    @HttpPost
    global static String createFeedback(String userName, String comment, String source) {
        Blog_Feedback__c fb = new Blog_Feedback__c(
            User_Name__c = userName,
            Comment__c = comment,
            Page_URL__c = source
        );
        insert fb;
        return 'Success';
    }

    // GET: Retrieves all comments AND your replies from storage
    @HttpGet
    global static List<Blog_Feedback__c> getFeedbacks() {
        return [SELECT User_Name__c, Comment__c, Admin_Replay__c, CreatedDate 
                FROM Blog_Feedback__c 
                ORDER BY CreatedDate DESC 
                LIMIT 50];
    }
}