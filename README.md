# 🏥 Salesforce Hospital Management System

A robust, full-stack Salesforce application designed to streamline hospital operations. This system manages the end-to-end patient journey, from appointment scheduling and doctor availability to medical records and billing.

## 🚀 Key Features

### 1. 👨‍⚕️ Interactive Doctor Console (LWC)
* **Custom Dashboard:** Engineered a responsive **Lightning Web Component (LWC)** that serves as a command center for doctors.
* **Real-Time Actions:** Doctors can view "Pending Approval" appointments and approve or reject them instantly without navigating multiple tabs.
* **Backend Logic:** Powered by an **Apex Controller** using `@AuraEnabled(cacheable=true)` for high-performance data retrieval.

### 2. ⚡ Intelligent Automation (Flow & Apex)
* **Smart Email Notifications:** Built a **Record-Triggered Flow** that automatically sends confirmation emails to patients *only* when their appointment status changes to "Confirmed."
* **Conflict Detection:** Implemented a `before insert/update` **Apex Trigger** to strictly prevent **Double Booking**. The system checks the database for existing appointments at the same time for the same doctor and blocks the save operation.

### 3. 🛡️ Data Integrity & Security
* **Validation Rules:** * **Shift Enforcement:** Ensures appointments are only booked during a Doctor's working hours.
    * **Data Completeness:** Prevents doctors from confirming an appointment if the Patient is missing an email address, ensuring communication lines remain open.
* **Database Architecture:**
    * **Master-Detail Relationships:** utilized for strict data ownership (Patient → Medical Records).
    * **Junction Object:** The `Appointment` object connects Doctors and Patients, enabling many-to-many relationships.

## 🛠️ Tech Stack
* **Frontend:** Lightning Web Components (LWC), JavaScript (ES6+), HTML/CSS
* **Backend:** Apex (Triggers & Controllers), SOQL
* **Automation:** Salesforce Flow Builder, Validation Rules
* **Tools:** VS Code, Salesforce CLI (SFDX), Git/GitHub
* **CI/CD:** Metadata-driven deployment via `package.xml`

## 📸 Project Screenshots

### 1. Doctor's Console (LWC)
*A custom UI allowing doctors to manage their schedule instantly.*
<img width="800" height="500" alt="Doctor Console Dashboard" src="https://github.com/user-attachments/assets/bfebaa40-70bc-4f76-a190-98c758c3d7c7" />

### 2. Automation Logic (Flow)
*Backend automation that triggers email confirmations upon approval.*
<img width="800" height="600" alt="Flow Builder Logic" src="https://github.com/user-attachments/assets/f98bc460-3020-4262-93f4-af0dba5a4fa1" />

### 3. Database Schema
*A robust data model linking Patients, Doctors, and Medical Records.*
<img width="800" height="400" alt="Schema Builder" src="https://github.com/user-attachments/assets/de42d595-141f-4264-91f4-f102a5187896" />

## 📦 Data Schema
* **Doctor__c** (Parent to Appointment)
* **Contact** (Patient - Master to Appointment & Medical Record)
* **Appointment__c** (The Core Transaction Record)
* **Medical_Record__c** (Child of Contact)
* **Invoice__c** (Child of Appointment)

## 🔧 Installation & Setup

1.  **Clone the Repository**
    ```bash
    git clone [https://github.com/i-ram-prasad/Hospital-Management-System-Salesforce.git](https://github.com/i-ram-prasad/Hospital-Management-System-Salesforce.git)
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
* **Experience Cloud Portal:** Building a secure site for patients to log in, view their history, and book appointments self-service.
* **REST API Integration:** Connecting with external pharmacy systems to sync prescription data.
* **Analytics Studio:** Creating visual dashboards to track hospital revenue and doctor utilization rates.

---
*Created by Ram Prasad - Salesforce Developer*
