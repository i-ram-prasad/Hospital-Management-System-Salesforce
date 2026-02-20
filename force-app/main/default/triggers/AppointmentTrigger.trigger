trigger AppointmentTrigger on Appointment__c (before insert, before update, after insert) {
    if(Trigger.isBefore){

    }

    if(Trigger.isAfter && Trigger.isInsert){
        AppointmentTrigger_Handler.createInvoiceOnBooking(Trigger.new);
    } 
}