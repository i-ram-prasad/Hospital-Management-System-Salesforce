import { LightningElement, wire, track } from 'lwc';
import getPendingAppointments from '@salesforce/apex/DoctorConsoleController.getPendingAppointments';
import updateAppointmentStatus from '@salesforce/apex/DoctorConsoleController.updateAppointmentStatus';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const COLUMNS = [
    { label: 'ID', fieldName: 'Name' },
    { label: 'Patient Name', fieldName: 'PatientName' }, // Matches the flattened data below
    { label: 'Time', fieldName: 'Appointment_Time__c', type: 'date', 
      typeAttributes: { day: 'numeric', month: 'short', hour: '2-digit', minute: '2-digit' }},
    { label: 'Status', fieldName: 'Status__c' },
    { type: 'button', typeAttributes: { label: 'Approve', name: 'approve', variant: 'brand', iconName: 'utility:check' }},
    { type: 'button', typeAttributes: { label: 'Reject', name: 'reject', variant: 'destructive', iconName: 'utility:close' }}
];

export default class DoctorConsole extends LightningElement {
    columns = COLUMNS;
    @track tableData = [];
    wiredResult;
    error;

    @wire(getPendingAppointments)
    wiredAppointments(result) {
        this.wiredResult = result;
        const { data, error } = result;

        if (data) {
            this.tableData = data.map(row => {
                return { 
                    ...row, 
                    // This uses the Relationship Name from your screenshot (Patient__r)
                    PatientName: row.Patient__r ? row.Patient__r.Name : 'Unknown'
                };
            });
            this.error = undefined;
        } else if (error) {
            console.error('ERROR:', error);
            this.error = error;
            this.tableData = undefined;
        }
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        if (actionName === 'approve') this.updateStatus(row.Id, 'Confirmed');
        else if (actionName === 'reject') this.updateStatus(row.Id, 'Cancelled');
    }

    updateStatus(id, status) {
        updateAppointmentStatus({ appointmentId: id, status: status })
            .then(() => {
                this.dispatchEvent(new ShowToastEvent({ title: 'Success', message: `Appointment ${status}`, variant: 'success' }));
                return refreshApex(this.wiredResult);
            })
            .catch(error => {
                this.dispatchEvent(new ShowToastEvent({ title: 'Error', message: error.body.message, variant: 'error' }));
            });
    }
}