# 📊 Day 17 (19/11): Derived Tables, Subqueries & Service Ranking  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Worked with **derived tables (subqueries in FROM)** to calculate reusable metrics.  
- Joined patients/staff tables with aggregated service statistics.  
- Calculated differences from an overall average using nested subqueries.  
- Built ranking logic using `CASE` to label services as Above / Average / Below the overall mean.  
- Strengthened skills for analytical reporting across multiple metrics.  

---

## 💻 Practice & Challenge Queries  

```sql
-- 1️⃣ Show each patient with their service’s average satisfaction.
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

-- 2️⃣ Derived table of service statistics.
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

-- 3️⃣ Staff with their service's total patient admissions.
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


-- 🧩 Challenge:
-- Rank services based on total admitted vs average admissions.
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
