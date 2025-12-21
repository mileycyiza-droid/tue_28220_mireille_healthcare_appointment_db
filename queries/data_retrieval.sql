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

