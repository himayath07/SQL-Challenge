# 🪜 Day 19 (21/11): Window Functions — RANK & ROW_NUMBER  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced using **window functions**: `RANK()` and `ROW_NUMBER()`.  
- Learned how **PARTITION BY** allows ranking within each group (service-level ranking).  
- Generated ordered staff lists and service performance ranks.  
- Used window functions inside subqueries to filter top-N results.  
- Built multi-level ranking reports combining satisfaction, admissions, and weekly performance.  

---

## 💻 Practice & Challenge Queries  

```sql
-- 1️⃣ Rank patients by satisfaction score within each service.
SELECT
    patient_id,
    name AS patient_name,
    service,
    satisfaction,
    RANK() OVER (
        PARTITION BY service
        ORDER BY satisfaction DESC
    ) AS satisfaction_rank
FROM patients
ORDER BY service, satisfaction_rank, patient_name;

-- 2️⃣ Assign row numbers to staff ordered by their name.
SELECT
    staff_id,
    staff_name,
    role,
    service,
    ROW_NUMBER() OVER (
        ORDER BY staff_name
    ) AS row_num
FROM staff
ORDER BY row_num;

-- 3️⃣ Rank services by total patients admitted.
SELECT
    service,
    total_admitted,
    RANK() OVER (
        ORDER BY total_admitted DESC
    ) AS admission_rank
FROM (
        SELECT 
            service,
            SUM(patients_admitted) AS total_admitted
        FROM services_weekly
        GROUP BY service
     ) AS svc
ORDER BY admission_rank, service;

-- 🧩 Challenge:
-- Top 3 weeks per service ranked by patient satisfaction.
SELECT
    service,
    week,
    patient_satisfaction,
    patients_admitted,
    satisfaction_rank
FROM (
        SELECT
            service,
            week,
            patient_satisfaction,
            patients_admitted,
            RANK() OVER (
                PARTITION BY service
                ORDER BY patient_satisfaction DESC
            ) AS satisfaction_rank
        FROM services_weekly
     ) AS ranked
WHERE satisfaction_rank <= 3
ORDER BY service, satisfaction_rank, week;
