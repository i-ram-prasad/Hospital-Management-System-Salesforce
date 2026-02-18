public with sharing class DoctorConsoleController {

    @AuraEnabled(cacheable=true)
    public static List<Appointment__c> getPendingAppointments() {
        return [
            SELECT Id, Name, Appointment_Time__c, Patient__r.Name, Status__c
            FROM Appointment__c
            WHERE Status__c = 'Pending Approval'
            ORDER BY Appointment_Time__c ASC
        ];
    }

    @AuraEnabled
    public static String updateAppointmentStatus(String appointmentId, String status) {
        try {
            Appointment__c appt = new Appointment__c(Id = appointmentId, Status__c = status);
            update appt;
            return 'Success';
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}