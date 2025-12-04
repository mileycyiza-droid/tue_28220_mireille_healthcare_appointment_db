## Name: HIMBA Aimee Mireille
## ID: 28220
## Group: Tuesday, B
## Department: Information Management
## Course:  Database Development with PL/SQL (INSY 8311)
## Lecture: Eric Maniraguha 
## Date: 04/12/2025

## Project Title: Intelligent Healthcare Appointment Optimizer with Predictive Analytics

##  PHASE I: Problem Statement & Presentation

1. Project Idea & Problem Statement 

Healthcare facilities often struggle with inefficient scheduling, patient no-shows, and long wait 
times. These challenges lead to revenue loss and poor patient experiences. 
This project proposes an Intelligent Healthcare Appointment Optimizer, built entirely in 
PL/SQL, to predict patient no-shows, manage urgent cases efficiently, and dynamically 
reschedule appointments. 

Objectives: 
• Reduce the impact of no-shows and increase clinic revenue. 
• Prioritize urgent cases to improve care delivery. 
• Optimize provider schedules automatically. 

2. Core Functionalities 

• Predictive No-Show Scoring: Calculates a risk score (0–1) using patient history, 
appointment type, time, and booking lead time. 
• Dynamic Scheduling: Suggests optimal time slots and checks provider availability in real
time. 
• Smart Waitlist Management: Automatically fills cancelled slots with best-matched 
patients based on urgency and compatibility. 
• Automated Reports: Generates daily risk alerts and performance dashboards for clinic 
staff. 

3. Database Design 

The database includes five main tables: 
• PATIENTS: Stores patient details and no-show history. 
• PROVIDERS: Contains doctor information and status. 
• APPOINTMENTS: Tracks appointments, urgency level, and calculated no-show risk 
scores. 
• WAITLIST: Holds patients waiting for open slots. 
• APPOINTMENT_AUDIT_TRAIL: Logs every status change for accountability. 
All tables use foreign keys to maintain integrity and support complex scheduling logic. 

4. PL/SQL Components 

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

5. Future Enhancements 

• System Integration: Use UTL_HTTP to send SMS/email notifications to waitlisted 
patients. 
• Machine Learning Upgrade: Replace rule-based risk scoring with predictive analytics 
models. 
• Provider Load Balancing: Distribute appointments based on provider workload and 
availability.

 ## PHASE II: Business Process Modeling

Define Scope
This business process models how a healthcare facility manages appointment scheduling using an MIS-driven intelligent system.
The process supports key MIS functions such as data processing, workflow automation, and decision support. The goal is to reduce
long waiting times, avoid overbooking, and improve doctor availability planning. Outcomes include optimized scheduling,
timely patient service, improved resource utilization, and predictive insights for future demand.

Key Entities
Users / Actors
•	Patient – Requests appointment and provides required information.
•	Receptionist – Verifies patient details and initiates appointment request.
•	System (MIS + Predictive Engine) – Checks availability, analyzes historical data, suggests optimal slots.
•	Doctor – Reviews upcoming schedule and confirms/updates availability.

Departments / Systems
•	Reception / Front Desk
•	Healthcare MIS Database
•	Predictive Analytics Engine
•	Medical Department

Roles & Responsibilities
•	Patient: Requests scheduling.
•	Receptionist: Provides human verification and final confirmation.
•	MIS System: Matches schedules, checks conflicts, stores data.
•	Predictive Model: Forecasts busy periods and suggests best appointment time.
•	Doctor: Ensures schedule accuracy.

Logical Flow Assurance
•	Process begins with patient request.
•	MIS validates and checks availability.
•	Predictive model intervenes when necessary.
•	Decision points clearly marked: e.g., “Slot Available?”
•	Ends only after confirmation SMS is sent.

MIS Function Explanation
The system performs MIS tasks such as:
•	Data collection (patient & doctor schedules)
•	Data processing (availability matching)
•	Decision support (predictive recommendations)
•	Communication (notifications to users)

Organizational Impact
•	Reduced patient waiting times
•	Increased scheduling accuracy
•	Balanced doctor workload
•	Enhanced customer satisfaction
•	Improved operational efficiency through automation

Analytics Opportunities Identified
•	Demand forecasting for peak days
•	Identifying high-risk no-show patients
•	Predictive doctor utilization
•	Delay pattern detection



 
