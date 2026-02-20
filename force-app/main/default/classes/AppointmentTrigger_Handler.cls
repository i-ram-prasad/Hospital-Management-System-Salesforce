public with sharing class AppointmentTrigger_Handler {
    public static void createInvoiceOnBooking(List<Appointment__c> appList){
        List<Invoice__c> invoiceToCreate = new List<Invoice__c>();
        Set<Id> doctorsId = new Set<Id>();

        //Collect All doctors Ids to Query their fee
        for (Appointment__c appt : appList) {
            if (appt.Doctor__c != null) {
                doctorsId.add(appt.Doctor__c);
            }
        }
        //Query the doctors to get their consultaiton fee
        Map<Id, Doctor__c> docMap = new Map<Id, Doctor__c>();
        if(!doctorsId.isEmpty()){
            docMap = new Map<Id, Doctor__c>([
                SELECT Id, Consultation_Fee__c 
                FROM Doctor__c
                WHERE Id IN :doctorsId
            ]);
        }

        //Build the Invoice
        for(Appointment__c appt : appList){
            Invoice__c inv = new Invoice__c();
            inv.Billable_Visit__c = appt.Id;
            inv.Patient__c = appt.Patient__c;

            Decimal fee = 0;

            if(appt.Doctor__c != null && docMap.containsKey(appt.Doctor__c)){
                Decimal docFee = docMap.get(appt.Doctor__c).Consultation_Fee__c;
                fee = docFee != null ? docFee : 0;
            }

            inv.Total_Amount__c = fee;

            invoiceToCreate.add(inv);

        }
        //save to Database

        if(!invoiceToCreate.isEmpty()){
            insert invoiceToCreate;
        }

    }
}