## Name: HIMBA Aimee Mireille
## ID: 28220
## Group: Tuesday, B
## Department: Information Management
## Course:  Database Development with PL/SQL (INSY 8311)
## Lecture: Eric Maniraguha 
## Date: 04/12/2025

## Project Title: Intelligent Healthcare Appointment Optimizer with Predictive Analytics

##  PHASE I: Problem Statement & Presentation

### 1. Project Idea & Problem Statement 

Healthcare facilities often struggle with inefficient scheduling, patient no-shows, and long wait 
times. These challenges lead to revenue loss and poor patient experiences. 
This project proposes an Intelligent Healthcare Appointment Optimizer, built entirely in 
PL/SQL, to predict patient no-shows, manage urgent cases efficiently, and dynamically 
reschedule appointments. 

Objectives: 

• Reduce the impact of no-shows and increase clinic revenue. 

• Prioritize urgent cases to improve care delivery.

• Optimize provider schedules automatically. 

### 2. Core Functionalities 

• Predictive No-Show Scoring: Calculates a risk score (0–1) using patient history, 
appointment type, time, and booking lead time.

• Dynamic Scheduling: Suggests optimal time slots and checks provider availability in real
time. 

• Smart Waitlist Management: Automatically fills cancelled slots with best-matched 
patients based on urgency and compatibility. 

• Automated Reports: Generates daily risk alerts and performance dashboards for clinic 
staff. 

### 3. Database Design 

The database includes five main tables: 

• PATIENTS: Stores patient details and no-show history. 

• PROVIDERS: Contains doctor information and status. 

• APPOINTMENTS: Tracks appointments, urgency level, and calculated no-show risk 
scores.

• WAITLIST: Holds patients waiting for open slots. 

• APPOINTMENT_AUDIT_TRAIL: Logs every status change for accountability. 

All tables use foreign keys to maintain integrity and support complex scheduling logic. 

### 4. PL/SQL Components 

The system’s intelligence is implemented in a package named appointment_optimizer_pkg, 
which includes: 

• Function calculate_no_show_risk: Computes patient no-show probability using rule
based logic. 

• Procedure handle_cancellation: Replaces cancelled appointments with suitable 
waitlisted patients.

• Procedure populate_daily_risk_report: Generates a daily report of high-risk 
appointments.

• Trigger trg_calc_risk_before_insert_update: Automatically calculates risk before 
inserting or updating an appointment. 

• Trigger trg_audit_status_change: Records every appointment status change for tracking 
and analysis. 

### 5. Future Enhancements 

• System Integration: Use UTL_HTTP to send SMS/email notifications to waitlisted 
patients.

• Machine Learning Upgrade: Replace rule-based risk scoring with predictive analytics 
models. 

• Provider Load Balancing: Distribute appointments based on provider workload and 
availability.

 ## PHASE II: Business Process Modeling

This business process models how a healthcare facility schedules patient appointments using an MIS-driven intelligent system enhanced with predictive analytics. The process begins when a patient requests an appointment and ends when the appointment is confirmed and an SMS notification is sent. The system improves efficiency by validating patient data, checking doctor availability, predicting no-show risks, and suggesting optimal appointment slots.

### Main Components of the System

The system consists of five main components represented as swimlanes in the BPMN diagram:

Patient: Initiates the appointment request.

Receptionist: Verifies patient details and confirms appointments.

MIS Appointment System: Checks doctor availability and processes scheduling data.

Predictive Analytics Engine: Calculates no-show risk and recommends optimal time slots.

Doctor: Reviews and confirms availability.

![bpmn](https://github.com/mileycyiza-droid/tue_28220_mireille_healthcare_appointment_db/blob/main/BPMN.png)

### MIS Functions Explained

The system performs core MIS functions including:

• Data Collection: Captures patient information and doctor schedules.

• Data Processing: Matches availability and applies scheduling rules.

• Decision Support: Uses predictive analytics to assess no-show risks and optimize scheduling.

• Communication: Sends appointment confirmations and notifications to patients.

### Organizational Impact

Implementing this system significantly improves healthcare operations by reducing patient waiting times, minimizing overbooking, and balancing doctor workloads. Administrative efficiency is increased through automation, while patient satisfaction improves due to faster and more reliable appointment scheduling. The system also supports better resource planning and service delivery.

### Analytics Opportunities Identified

• Forecasting peak appointment demand periods.

• Identifying patients with high no-show risk.

• Predicting doctor workload and availability.

•Detecting delays and scheduling bottlenecks for continuous improvement.

### PHASE III: Logical Model Design

### ER Diagram
The ER diagram models patients, doctors, appointments, waitlists, and audit logs, with primary and foreign keys enforcing integrity and derived attributes supporting predictive analytics for no-show risk and scheduling optimization.

![er diadram](https://github.com/mileycyiza-droid/tue_28220_mireille_healthcare_appointment_db/blob/main/ERD%20PL%20DIAGRAM.png)

## Normalization

## First Normal Form (1NF) – Eliminate Repeating Groups

• All tables have atomic (indivisible) values.

• No multivalued attributes exist (e.g., phone numbers, appointments, providers are stored in separate rows).

• Each table has a primary key to uniquely identify records.

## Second Normal Form (2NF) – Eliminate Partial Dependencies

• All non-key attributes depend on the entire primary key.

• No table uses a composite primary key where attributes depend on only part of it.

## Third Normal Form (3NF) – Eliminate Transitive Dependencies

• Non-key attributes do not depend on other non-key attributes.

• Descriptive data is moved to its own entity.

### Justification of Normalization Approach

The database is normalized to 3NF to:

• Reduce redundancy

• Prevent update anomalies

• Ensure data integrity

• Improve performance for transactional operations

• Support accurate predictive analytics

Normalization is balanced with BI needs by using audit and fact tables for analysis.

### Data Dictionary
## PATIENTS
| Column          | Data Type    | Description               |
| --------------- | ------------ | ------------------------- |
| patient_id (PK) | INT          | Unique patient identifier |
| full_name       | VARCHAR(100) | Patient full name         |
| date_of_birth   | DATE         | Patient DOB               |
| phone           | VARCHAR(20)  | Contact number            |
| no_show_count   | INT          | Total missed appointments |

## DOCTORS
| Column           | Data Type    | Description              |
| ---------------- | ------------ | ------------------------ |
| doctor_id (PK)   | INT          | Unique doctor identifier |
| full_name        | VARCHAR(100) | Doctor name              |
| specialization   | VARCHAR(100) | Medical specialty        |
| status           | VARCHAR(50)  | Availability status      |

## APPOINTMENTS
| Column               | Data Type    | Description                   |
| -------------------- | ------------ | ----------------------------- |
| appointment_id (PK)  | INT          | Appointment identifier        |
| patient_id (FK)      | INT          | References PATIENTS           |
| doctors_id (FK)      | INT          | References DOCTORS            |
| appointment_datetime | TIMESTAMP    | Date & time                   |
| urgency_level        | VARCHAR(50)  | Urgency classification        |
| status               | VARCHAR(50)  | Scheduled/Cancelled/Completed |
| no_show_risk         | DECIMAL(3,2) | Derived risk score            |

## WAITLIST
| Column           | Data Type | Description              |
| ---------------- | --------- | ------------------------ |
| waitlist_id (PK) | INT       | Waitlist entry ID        |
| patient_id (FK)  | INT       | References PATIENTS      |
| requested_slot   | TIMESTAMP | Desired appointment time |
| priority_level   | INT       | Urgency ranking          |
| date_added       | TIMESTAMP | Date added               |

## APPOINTMENT_AUDIT_TRAIL
| Column              | Data Type   | Description             |
| ------------------- | ----------- | ----------------------- |
| audit_id (PK)       | INT         | Audit identifier        |
| appointment_id (FK) | INT         | References APPOINTMENTS |
| old_status          | VARCHAR(50) | Previous status         |
| new_status          | VARCHAR(50) | Updated status          |
| change_timestamp    | TIMESTAMP   | Time of change          |
| changed_by          | VARCHAR(50) | System/User             |

## Constraints Documented

• Primary Keys enforce uniqueness

• Foreign Keys enforce referential integrity

• NOT NULL on critical fields

• Status fields use controlled values

## Assumptions

• One appointment is linked to one patient and one provider

• No-show risk is calculated dynamically

• Historical records are never deleted

• Audit trail is append-only

## BI (Business Intelligence) Considerations
## Fact vs Dimension Tables

• Fact Table: APPOINTMENTS

    • Measures: no_show_risk, appointment_count

• Dimension Tables: PATIENTS, PROVIDERS, TIME

## Slowly Changing Dimensions (SCD)

• PATIENTS: Type 1 (overwrite changes)

• PROVIDERS: Type 2 (track history for workload analysis)

## Aggregation Levels

• Daily appointments

• Monthly no-show trends

• Provider workload per period

• Urgency-based scheduling metrics

## Audit Trail Design

• APPOINTMENT_AUDIT_TRAIL captures:

    • Status changes

    • Time of change

    • Responsible actor

• Supports compliance, analytics, and performance monitoring

### PHASE IV: Database Creation

## Database creation(PDB Setup) 
tue_28220_mireille_healthcare_appointment_db

## Admin User Details

Username: mireille_admin

Password: mireille

Privileges: DBA (Super Admin)

## Tablespace configuration

![tablespace](https://github.com/mileycyiza-droid/tue_28220_mireille_healthcare_appointment_db/blob/main/Tablespace%20creation.png?raw=true)

## User setup documentation

User setup involves creating a super admin user (mireille_admin) with DBA privileges inside the pluggable database to manage schema objects, security, and system operations, ensuring controlled and secure access to the healthcare appointment system.

## Project structure overview

The project is organized into clearly separated directories for database setup scripts, schema definitions, PL/SQL logic, documentation (ERD, BPMN, screenshots), and a central README to ensure maintainability, clarity, and easy GitHub submission.

### PHASE V: Table Implementation & Data Insertion

## Database Schema Creation
The database schema creation was successful, with all tables, constraints, and relationships created without errors and verified within the pluggable database.

![table creation]()

![results](https://github.com/mileycyiza-droid/tue_28220_mireille_healthcare_appointment_db/commit/7658ee904ecb8582cc4655fd348cfa50e1c60524)

## Data Insertion
Realistic sample data was inserted to represent real healthcare scenarios, including normal cases and edge cases.The data was checked to ensure it follows all business rules and database constraints.

![insert](https://github.com/mileycyiza-droid/tue_28220_mireille_healthcare_appointment_db/commit/076852db44e5b617037beafe766169c5608addcd)

## Data Integrity
Data integrity was verified using SELECT queries to ensure constraints were enforced and relationships between tables were valid.Foreign key checks confirmed that no orphan or inconsistent records exist.

## Testing Queries Documentation

Several SQL queries were executed to validate system functionality:

• Basic Retrieval:
Simple SELECT * queries were used to confirm data availability in each table.

• Join Queries:
Multi-table joins retrieved combined information such as patient names, doctor details, and appointment schedules.

• Aggregation Queries:
GROUP BY queries were used to analyze appointment counts per doctor, no-show trends, and daily scheduling volume.

• Subqueries:
Subqueries identified high-risk no-show patients and providers with the highest workload.


### PHASE VI: Database Interaction & Transactions

## Procedure
I create procedures to handle database tasks automatically, like adding or updating patients and appointments.This makes the system faster, safer, and easier to manage.

```sql
CREATE OR REPLACE PROCEDURE add_patient (
    p_first_name IN VARCHAR2,
    p_last_name  IN VARCHAR2,
    p_age        IN NUMBER
)
IS
BEGIN
    INSERT INTO patients(first_name, last_name, age)
    VALUES (p_first_name, p_last_name, p_age);
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE add_doctor (
    p_first_name IN VARCHAR2,
    p_last_name  IN VARCHAR2,
    p_specialty  IN VARCHAR2
)
IS
BEGIN
    INSERT INTO doctors(first_name, last_name, specialty)
    VALUES (p_first_name, p_last_name, p_specialty);
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE add_appointment (
    p_patient_id IN NUMBER,
    p_doctor_id  IN NUMBER,
    p_date_time  IN DATE
)
IS
BEGIN
    INSERT INTO appointments(patient_id, doctor_id, appointment_date)
    VALUES (p_patient_id, p_doctor_id, p_date_time);
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE update_appointment_status (
    p_appointment_id IN NUMBER,
    p_status         IN VARCHAR2
)
IS
BEGIN
    UPDATE appointments
    SET status = p_status
    WHERE appointment_id = p_appointment_id;
    COMMIT;
END;
/

```
---

## Functions

Functions are used in this project to retrieve specific information from the database.They return a single value, such as patient age, appointment count, or doctor availability, which helps in decision-making and reporting within the Healthcare Appointment System.






