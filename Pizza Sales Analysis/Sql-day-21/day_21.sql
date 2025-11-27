--practice questions

-- 1. Create a CTE to calculate service statistics, then query from it
WITH service_stats AS (
    SELECT 
        service,
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
        ROUND(AVG(staff_morale), 2) AS avg_morale
    FROM services_weekly
    GROUP BY service
)

SELECT *
FROM service_stats
ORDER BY total_admitted DESC;


-- Q.2. Use multiple CTEs to break down a complex query into logical steps.
WITH service_totals AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admissions
    FROM services_weekly
    GROUP BY service
),
overall_avg AS (
    SELECT ROUND(AVG(total_admissions)) AS avg_admissions
    FROM service_totals
)
SELECT
    st.service,
    st.total_admissions,
    oa.avg_admissions,
    ROUND(st.total_admissions - oa.avg_admissions) AS diff_from_avg
FROM service_totals st
CROSS JOIN overall_avg oa
ORDER BY st.total_admissions DESC;


-- Q.3. Build a CTE for staff utilization and join it with patient data.
WITH staff_util AS (
    SELECT
        staff_id,
        service,
        COUNT(week) AS weeks_present
    FROM staff_schedule
    GROUP BY staff_id, service
)
SELECT
    p.patient_id,
    p.name AS patient_name,
    p.service,
    su.staff_id,
    su.weeks_present
FROM patients p
LEFT JOIN staff_util su
    ON p.service = su.service
ORDER BY p.patient_id, su.staff_id;

--challenge question

--Create a comprehensive hospital performance dashboard using CTEs. Calculate: 1) Service-level metrics 
--(total admissions, refusals, avg satisfaction), 2) Staff metrics per service (total staff, avg weeks 
--present), 3) Patient demographics per service (avg age, count). Then combine all three CTEs to create a 
--final report showing service name, all calculated metrics, and an overall performance score (weighted 
--average of admission rate and satisfaction). Order by performance score descending.
WITH 
service_stats AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admissions,
        SUM(patients_refused) AS total_refusals,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
        ROUND(
            SUM(patients_admitted)::decimal 
            / NULLIF(SUM(patients_admitted + patients_refused), 0),2) AS admission_rate
    FROM services_weekly
    GROUP BY service
),
staff_stats AS (
    SELECT
        service,
        COUNT(DISTINCT staff_id) AS total_staff,
        ROUND(AVG(present), 2) AS avg_weeks_present
    FROM staff_schedule
    GROUP BY service
),
patient_demo AS (
    SELECT
        service,
        ROUND(AVG(age), 1) AS avg_age,
        COUNT(*) AS patient_count
    FROM patients
    GROUP BY service
),
final_dashboard AS (
    SELECT
        ss.service,
        ss.total_admissions,
        ss.total_refusals,
        ss.avg_satisfaction,
        ss.admission_rate,
        st.total_staff,
        st.avg_weeks_present,
        pd.avg_age,
        pd.patient_count,
        ROUND(
            (0.6 * ss.admission_rate) + 
            (0.4 * ss.avg_satisfaction / 10),3) AS performance_score
    FROM service_stats ss
    LEFT JOIN staff_stats st USING (service)
    LEFT JOIN patient_demo pd USING (service)
)
SELECT *
FROM final_dashboard
ORDER BY performance_score DESC;