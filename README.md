# 🏥 Salesforce Hospital Management System

A robust, full-stack Salesforce application designed to streamline hospital operations. This system manages the end-to-end patient journey, from appointment scheduling and doctor availability to medical records and billing.

## 🚀 Key Features

### 1. Smart Appointment Scheduling (Apex Trigger)
* **Conflict Detection:** Implemented a `before insert/update` Apex Trigger to strictly prevent **Double Booking**. The system checks the database for existing appointments at the same time for the same doctor and blocks the save operation with a custom error.
* **Shift Enforcement:** Validation Rules ensure appointments can only be booked during a Doctor's defined working hours (`Shift_Start_Time__c` and `Shift_End_Time__c`).

### 2. Data Model & Architecture
* **Patient Management:** Customized the standard `Contact` object to track patient history.
* **Doctor Management:** Custom object with specialized fields for Specialization and Consultation Fees.
* **Clinical & Financial Data:**
    * **Medical Records:** Master-Detail relationship to Patient ensures strict data ownership.
    * **Invoices:** Master-Detail relationship to Appointment allows for Roll-Up Summaries of revenue.
* **Junction Object:** The `Appointment` object serves as the connecting link between Doctors and Patients.

### 3. Automation & Logic
* **Auto-Numbering:** Appointments are automatically assigned unique IDs (e.g., `APT-0001`) for easy reference.
* **Status Workflow:** Tracks appointments from `Pending` -> `Confirmed` -> `Completed` -> `Cancelled`.

## 🛠️ Tech Stack
* **Language:** Apex (Triggers & Handlers), SOQL
* **Metadata:** Custom Objects, Fields, Validation Rules, Page Layouts
* **Tools:** VS Code, Salesforce CLI (SFDX), Git/GitHub
* **CI/CD:** Metadata-driven deployment via `package.xml`

## 📦 Data Schema
* **Doctor__c** (Parent to Appointment)
* **Contact** (Patient - Master to Appointment & Medical Record)
* **Appointment__c** (The Core Transaction Record)
* **Medical_Record__c** (Child of Contact)
* **Invoice__c** (Child of Appointment)

## 📸 Project Screenshots

### 1. Doctor's Console (LWC)
*A custom Lightning Web Component allowing doctors to approve/reject appointments instantly.*
![Doctor Console](./assets/doctor-console.png)

### 2. Automation Logic (Flow)
*Backend automation that triggers email confirmations upon approval.*
![Flow Diagram](./assets/flow-diagram.png)

### 3. Database Schema
*A robust data model linking Patients, Doctors, and Medical Records.*
![Schema Builder](./assets/schema.png)

## 🔧 Installation & Setup

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/i-ram-prasad/Hospital-Management-System-Salesforce.git
    cd Hospital-Management-System-Salesforce
    ```

2.  **Authorize Your Org**
    ```bash
    sfdx auth:web:login -a MyDevOrg
    ```

3.  **Deploy to Salesforce**
    ```bash
    sfdx force:source:deploy -p force-app
    ```

## 🔮 Future Enhancements
* **LWC Patient Portal:** Building a Lightning Web Component for patients to view their own history.
* **Email Notifications:** Automating confirmation emails using Salesforce Flow.
* **Reports & Dashboards:** Visualizing hospital revenue and doctor utilization.

---
*Created by Ram Prasad - *
