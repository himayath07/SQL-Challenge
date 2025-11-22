--practice questions

--1. Show each patient with their service’s average satisfaction as an additional column
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    p.satisfaction,
    sw.avg_satisfaction AS service_avg_satisfaction
FROM patients AS p
LEFT JOIN (
        SELECT 
            service,
            AVG(patient_satisfaction) AS avg_satisfaction
        FROM services_weekly
        GROUP BY service
    ) AS sw
    ON p.service = sw.service
ORDER BY p.name;

--2. Create a derived table of service statistics and query from it
SELECT 
    sw.service,
    sw.total_admitted,
    sw.total_refused,
    sw.avg_satisfaction,
    sw.avg_staff_morale
FROM (
        SELECT 
            service,
            SUM(patients_admitted) AS total_admitted,
            SUM(patients_refused) AS total_refused,
            ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
            ROUND(AVG(staff_morale), 2) AS avg_staff_morale
        FROM services_weekly
        GROUP BY service
     ) AS sw
ORDER BY sw.avg_satisfaction DESC;

---- 3. Display staff with their service's total patient count as a calculated field
SELECT 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    sw.total_admitted AS service_total_admitted
FROM staff AS s
LEFT JOIN (
        SELECT 
            service,
            SUM(patients_admitted) AS total_admitted
        FROM services_weekly
        GROUP BY service
    ) AS sw
    ON s.service = sw.service
ORDER BY sw.total_admitted DESC, s.staff_name;

--challenge question

--Create a report showing each service with: service name, total patients admitted, the difference between 
--their total admissions and the average admissions across all services, and a rank indicator 
--('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.
SELECT
    sw.service,
    sw.total_admitted,
    ROUND(sw.total_admitted - overall.avg_admissions, 2) AS diff_from_avg,
    CASE
        WHEN sw.total_admitted > overall.avg_admissions THEN 'Above Average'
        WHEN sw.total_admitted = overall.avg_admissions THEN 'Average'
        ELSE 'Below Average'
    END AS rank_indicator
FROM
    (
        SELECT 
            service,
            SUM(patients_admitted) AS total_admitted
        FROM services_weekly
        GROUP BY service
    ) AS sw,
    (
        SELECT 
            AVG(service_total) AS avg_admissions
        FROM (
            SELECT SUM(patients_admitted) AS service_total
            FROM services_weekly
            GROUP BY service
        ) AS t
    ) AS overall
ORDER BY sw.total_admitted DESC;

