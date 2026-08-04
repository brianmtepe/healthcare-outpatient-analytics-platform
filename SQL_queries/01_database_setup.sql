/* HEALTHCARE OUTPATIENT DATABASE SETUP*/
DROP DATABASE IF EXISTS healthcare_outpatient_analytics;
CREATE DATABASE healthcare_outpatient_analytics;
USE healthcare_outpatient_analytics;

/* DEPARTMENT TABLE */
CREATE TABLE departments(
department_id INT PRIMARY KEY,
department_name VARCHAR(100) NOT NULL UNIQUE
);

/* DIAGNOSES TABLE */
CREATE TABLE diagnoses(
diagnosis_id INT PRIMARY KEY,
icd_code VARCHAR(20) NOT NULL,
diagnosis_name VARCHAR(150) NOT NULL,
category VARCHAR(100) NOT NULL
);

/* PROVIDERS TABLE */
CREATE TABLE providers(
provider_id INT PRIMARY KEY,
provider_name VARCHAR(150) NOT NULL,
cadre VARCHAR(80) NOT NULL,
department_id INT NOT NULL,
CONSTRAINT fk_provider_department
FOREIGN KEY(department_id)
REFERENCES departments(department_id)
);
ALTER TABLE providers
ADD COLUMN department_name VARCHAR(100),
ADD COLUMN years_experience INT,
ADD COLUMN employment_type VARCHAR(30),
ADD COLUMN provider_status VARCHAR(30)
;
/* PATIENTS TABLE */
CREATE TABLE patients(
patient_id INT PRIMARY KEY,
first_name VARCHAR(80),
last_name VARCHAR(80),
gender VARCHAR(10),
date_of_birth DATE,
age_group VARCHAR(30),
county VARCHAR(100),
insurance_type VARCHAR(80),
insurance_group VARCHAR(40),
registration_year INT,
registration_month VARCHAR(20)
);

ALTER TABLE patients
ADD COLUMN marital_status VARCHAR(30),
ADD COLUMN occupation VARCHAR(100),
ADD COLUMN phone_number VARCHAR(30),
ADD COLUMN email VARCHAR(150),
ADD COLUMN age INT,
ADD COLUMN age_category VARCHAR(30);
DESCRIBE patients;

/* VISITS TABLE */
CREATE TABLE visits(
visit_id INT PRIMARY KEY,
patient_id INT NOT NULL,
provider_id INT NOT NULL,
department_id INT NOT NULL,
diagnosis_id INT NOT NULL,
visit_date DATE,
arrival_time TIME,
waiting_time_minutes INT,
consultation_minutes INT,
bill_amount DECIMAL(10,2),
visit_type VARCHAR(30),
visit_year INT,
visit_month VARCHAR(20),
visit_day VARCHAR(20),
arrival_period VARCHAR(30),
waiting_category VARCHAR(30),
consultation_category VARCHAR(30),
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id),

FOREIGN KEY (provider_id)
REFERENCES providers(provider_id),

FOREIGN KEY (department_id)
REFERENCES departments(department_id),

FOREIGN KEY (diagnosis_id)
REFERENCES diagnoses(diagnosis_id)
);
ALTER TABLE visits
ADD COLUMN visit_quarter VARCHAR(10),
ADD COLUMN weekday VARCHAR(20),
ADD COLUMN arrival_hour INT,
ADD COLUMN peak_period VARCHAR(30),
ADD COLUMN revenue_band VARCHAR(30),
ADD COLUMN consultation_level VARCHAR(30),
ADD COLUMN weekend VARCHAR(5),
ADD COLUMN financial_year VARCHAR(15),
ADD COLUMN season VARCHAR(20),
ADD COLUMN clinic_load VARCHAR(20),
ADD COLUMN high_cost_visit VARCHAR(5),
ADD COLUMN repeat_patient VARCHAR(5),
ADD COLUMN chronic_case VARCHAR(5);
ALTER TABLE visits
MODIFY COLUMN weekend VARCHAR(10);
# populate visit_day 
UPDATE visits
SET visit_day=DAY(visit_date)
WHERE visit_id>0;
# Arrival period
UPDATE visits
SET arrival_period=
CASE
 WHEN arrival_hour BETWEEN 7 AND 10 THEN 'Peak Hours'
 ELSE 'Off Peak'
END
WHERE visit_id>0;
# Consultation category
UPDATE visits
SET consultation_category=
CASE
 WHEN consultation_minutes<=20 THEN 'Standard'
 ELSE 'Extended'
END
WHERE visit_id>0;












/* PERFORMANCE INDEXES */
CREATE INDEX idx_visit_date
ON visits(visit_date);
CREATE INDEX idx_department
ON visits(department_id);
CREATE INDEX idx_patient
ON visits(patient_id);
CREATE INDEX idx_provider
ON visits(provider_id);
CREATE INDEX idx_diagnosis
ON visits(diagnosis_id);

SELECT*
FROM diagnoses;
SELECT COUNT(*) FROM visits;
SELECT* FROM visits;
TRUNCATE TABLE visits;






