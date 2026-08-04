USE healthcare_outpatient_analytics;

/* EXECUTIVE KPI DASHBOARD VIEWS */
CREATE OR REPLACE VIEW vw_executive_summary AS
SELECT
COUNT(*) AS total_visits,
COUNT(DISTINCT patient_id) AS unique_patients,
ROUND(AVG(waiting_time_minutes),1) AS avg_waiting_time,
ROUND(AVG(consultation_minutes),1) AS avg_consultation_time,
ROUND(SUM(bill_amount),2) AS total_revenue,
ROUND(AVG(bill_amount),2) AS avg_bill
FROM visits;

/* DEPARTMENTS PERFORMANCE */
CREATE OR REPLACE VIEW vw_department_performance AS
SELECT
COUNT(v.visit_id) AS total_visits,
ROUND(AVG(v.waiting_time_minutes),1) AS avg_waiting,
ROUND(AVG(v.consultation_minutes),1) AS avg_consultation,
ROUND(SUM(v.bill_amount),2) AS revenue
FROM visits v
JOIN departments d
ON v.department_id=d.department_id
GROUP BY d.department_name;

/* MONTHLY OUTPATIENT TRENDS */
CREATE OR REPLACE VIEW vw_monthly_trends AS 
SELECT
visit_year,
visit_month,
COUNT(*) AS visits,
ROUND(SUM(bill_amount),2) AS revenue
FROM visits
GROUP BY
visit_year,
visit_month
ORDER BY
visit_year,
FIELD(
visit_month,
'January','February','March','April',
'May','June','July','August','September',
'October','November','December'
);

/* WAITING TIME ANALYSIS */
CREATE OR REPLACE VIEW vw_waiting_analysis AS
SELECT
d.department_name,
AVG(v.waiting_time_minutes)avg_wait,
MAX(v.waiting_time_minutes)longest_wait,
COUNT(*)visits
FROM visits v
JOIN departments d
ON v.department_id=d.department_id
GROUP BY d.department_name;

/* PROVIDER WORKFLOW */
CREATE OR REPLACE VIEW vw_provider_workload AS
SELECT
    p.provider_id,
    p.provider_name,
    d.department_name,

    COUNT(v.visit_id) AS total_visits,

    ROUND(
        COUNT(v.visit_id) /
        NULLIF(COUNT(DISTINCT v.visit_date),0),
        2
    ) AS average_daily_workload,

    ROUND(AVG(v.consultation_minutes),1) AS avg_consultation,

    ROUND(AVG(v.waiting_time_minutes),1) AS avg_waiting,

    ROUND(SUM(v.bill_amount),2) AS total_revenue,

    ROUND(AVG(v.bill_amount),2) AS average_bill

FROM providers p

LEFT JOIN visits v
ON p.provider_id = v.provider_id

LEFT JOIN departments d
ON v.department_id = d.department_id

GROUP BY

    p.provider_id,
    p.provider_name,
    d.department_name;

/* DIAGNOSIS TRENDS */
CREATE OR REPLACE VIEW vw_diagnosis_trends AS
SELECT

    d.diagnosis_name,

    v.visit_year,

    v.visit_month,

    MONTH(v.visit_date) AS visit_month_num,

    COUNT(*) AS total_cases,

    ROUND(AVG(v.bill_amount),2) AS average_bill,

    ROUND(AVG(v.consultation_minutes),1) AS avg_consultation,

    ROUND(AVG(v.waiting_time_minutes),1) AS avg_waiting

FROM visits v

JOIN diagnoses d
ON v.diagnosis_id=d.diagnosis_id

GROUP BY

    d.diagnosis_name,
    v.visit_year,
    v.visit_month,
    MONTH(v.visit_date);

/* REVENUE ANALYSIS */
CREATE OR REPLACE VIEW vw_department_revenue AS 
SELECT
d.department_name,
SUM(v.bill_amount)revenue
FROM visits v
JOIN departments d
ON v.department_id=d.department_id
GROUP BY d.department_name
ORDER BY revenue DESC;

CREATE OR REPLACE VIEW vw_provider_workload AS
SELECT
    p.provider_id,
    p.provider_name,
    COUNT(v.visit_id) AS total_visits,
    ROUND(COUNT(v.visit_id)/COUNT(DISTINCT v.visit_date),2) AS average_daily_workload
FROM providers p
LEFT JOIN visits v
ON p.provider_id = v.provider_id
GROUP BY
    p.provider_id,
    p.provider_name;

SELECT
visit_day,
arrival_period,
consultation_category
FROM visits
LIMIT 10;
