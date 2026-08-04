USE healthcare_outpatient_analytics;
SELECT DATABASE() AS active_database;

SELECT COUNT(*) AS departments FROM departments;
SELECT COUNT(*) AS providers FROM providers;
SELECT COUNT(*) AS diagnoses FROM diagnoses;
SELECT COUNT(*) AS patients FROM patients;
SELECT COUNT(*) AS visits FROM visits;

/* PRIMARY KEY VALIDATION */
SELECT COUNT(*) Total_rows,
COUNT(DISTINCT patient_id) UniquePatients
FROM patients;

/* NULL VALUE VALIDATION */
SELECT* FROM patients
WHERE
first_name IS NULL
OR last_name IS NULL
OR gender IS NULL;

SELECT* FROM visits
WHERE 
visit_date IS NULL
OR bill_amount IS NULL
OR patient_id IS NULL;

/* FOREIGN KEY */
SELECT
COUNT(*)
FROM visits v
LEFT JOIN patients p
ON v.patient_id=p.patient_id
WHERE p.patient_id IS NULL;

/* DUPLICATE VISIT ID */
SELECT 
visit_id,
COUNT(*)
FROM visits
GROUP BY visit_id
HAVING COUNT(*)>1;

/* DATE VALIDATION */
SELECT
MIN(visit_date),
MAX(visit_date)
FROM visits;

/* WAITING TIME VALIDATION */
SELECT
MIN(waiting_time_minutes),
MAX(waiting_time_minutes),
AVG(waiting_time_minutes)
FROM visits;

/* REVENUE VALIDATION */
SELECT
MIN(bill_amount),
MAX(bill_amount),
AVG(bill_amount),
SUM(bill_amount)
FROM visits;

/* VALIDATE SQL VIEWS */
SELECT * 
FROM vw_executive_summary;
SELECT*
FROM vw_department_performance;
SELECT*
FROM vw_monthly_trends;
SELECT*
FROM vw_waiting_analysis;
SELECT*
FROM vw_provider_workload;
SELECT*
FROM vw_diagnosis_trends;
SELECT*
FROM vw_department_revenue;


DESCRIBE visits;

SHOW INDEX FROM visits;







 







