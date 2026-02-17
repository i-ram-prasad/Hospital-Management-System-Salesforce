public with sharing class CAMPX_SponsorTrigger_Handler {
    public static void onBeforeInsert(List<CAMPX__Sponsor__c> newSponsor){
        for(CAMPX__Sponsor__c s : newSponsor){
            if (String.isBlank(s.CAMPX__Status__c)) {
                s.CAMPX__Status__c = 'Pending';
            }
            if (String.isBlank(s.CAMPX__Email__c)) {
                s.addError('A sponsor can not be created without an email address');
            }
        }
    }

    public static void setSponsorTier(List<CAMPX__Sponsor__c> sponsor){
        for(CAMPX__Sponsor__c s : sponsor){
            if(s.CAMPX__ContributionAmount__c == null || s.CAMPX__ContributionAmount__c <= 0){
                s.CAMPX__Tier__c = null;
            }else if (s.CAMPX__ContributionAmount__c < 1000) {
                s.CAMPX__Tier__c = 'Bronze';
            }else if(s.CAMPX__ContributionAmount__c < 5000){
                s.CAMPX__Tier__c = 'Silver';
            }else if(s.CAMPX__ContributionAmount__c >= 5000){
                s.CAMPX__Tier__c = 'Gold';
            }
        }
    }
}