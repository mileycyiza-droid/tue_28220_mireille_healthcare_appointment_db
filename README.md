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

![patients](https://github.com/mileycyiza-droid/tue_28220_mireille_healthcare_appointment_db/blob/main/BPMN.png)

### MIS Functions Explained

The system performs core MIS functions including:

Data Collection: Captures patient information and doctor schedules.

Data Processing: Matches availability and applies scheduling rules.

Decision Support: Uses predictive analytics to assess no-show risks and optimize scheduling.

Communication: Sends appointment confirmations and notifications to patients.

### Organizational Impact

Implementing this system significantly improves healthcare operations by reducing patient waiting times, minimizing overbooking, and balancing doctor workloads. Administrative efficiency is increased through automation, while patient satisfaction improves due to faster and more reliable appointment scheduling. The system also supports better resource planning and service delivery.

### Analytics Opportunities Identified

Forecasting peak appointment demand periods.

Identifying patients with high no-show risk.

Predicting doctor workload and availability.

Detecting delays and scheduling bottlenecks for continuous improvement.

### PHASE III: Logical Model Design

### ER Diagram
The ER diagram models patients, providers, appointments, waitlists, and audit logs, with primary and foreign keys enforcing integrity and derived attributes supporting predictive analytics for no-show risk and scheduling optimization.

