# 🔗 Day 13 (15/11): Working with JOINS in SQL  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced using **INNER JOIN** to combine data from multiple tables.  
- Joined datasets using the common field **service** across patients, staff, and weekly service tables.  
- Learned how to enrich data by bringing in related information from connected tables.  
- Built multi-table reports for patients, staff, and service performance.  
- Used **subqueries + joins** to filter grouped data (e.g., services with more than 5 staff).  

---

## 💻 Practice & Challenge Queries  

```sql
-- 1️⃣ Join patients and staff to show patient and staff working in the same service.
SELECT
    p.patient_id,
    p.name,
    s.staff_name,
    p.service
FROM patients AS p
INNER JOIN staff AS s
    ON p.service = s.service;

-- 2️⃣ Join weekly service data with staff schedule.
SELECT
    sw.week,
    sw.month,
    sw.service,
    sw.patients_admitted,
    sw.patient_satisfaction,
    sw.staff_morale,
    s.staff_id,
    s.staff_name,
    s.role
FROM services_weekly AS sw
INNER JOIN staff_schedule AS s
    ON sw.service = s.service
ORDER BY sw.week, sw.service;

-- 3️⃣ Patient report with staff assigned to the same service.
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    p.age,
    p.satisfaction,
    s.staff_id,
    s.staff_name,
    s.role
FROM patients AS p
INNER JOIN staff_schedule AS s
    ON p.service = s.service
ORDER BY p.service, p.name, s.staff_name;


-- 🧩 Challenge:
-- Comprehensive report: patients + total staff per service (only services with >5 staff).
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    p.age,
    s.total_staff
FROM patients AS p
INNER JOIN (
    SELECT 
        service,
        SUM(present) AS total_staff
    FROM staff_schedule
    GROUP BY service
    HAVING SUM(present) > 5
) AS s
    ON p.service = s.service
ORDER BY 
    s.total_staff DESC,
    p.name;



Reflection
Day 13 focused on using JOINS to connect tables and extract meaningful combined insights.
I learned how to merge datasets, compare fields across tables, and use subqueries to create filtered join results — powerful skills for real-world analytics.


#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataAnalytics #DataScience #UpskillingJourney