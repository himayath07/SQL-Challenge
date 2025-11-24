# 🔄 Day 18 (20/11): UNION, UNION ALL & Combining Data  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced combining data from multiple tables using **UNION** and **UNION ALL**.  
- Understood the difference:  
  - **UNION** → removes duplicates  
  - **UNION ALL** → keeps all rows, including duplicates  
- Created merged lists of patients and staff.  
- Used UNION for category-based filtering (high vs low satisfaction).  
- Built combined personnel–patient reports with type labels.  

---

## 💻 Practice & Challenge Queries  

```sql
-- 1️⃣ Combine patient names and staff names into a single list.
SELECT 
    name AS patient_name
FROM patients
UNION
SELECT
    staff_name
FROM staff;

-- 2️⃣ Union of high and low satisfaction patients.
SELECT 
    patient_id,
    name AS patient_name,
    satisfaction,
    'High Satisfaction' AS category
FROM patients
WHERE satisfaction > 90
UNION
SELECT 
    patient_id,
    name AS patient_name,
    satisfaction,
    'Low Satisfaction' AS category
FROM patients
WHERE satisfaction < 50;

-- 3️⃣ List all unique names from both patients and staff.
SELECT name AS patient_name
FROM patients
UNION
SELECT staff_name
FROM staff;


-- 🧩 Challenge:
-- Comprehensive personnel + patient list for Surgery/Emergency.
SELECT
    p.patient_id AS identifier,
    p.name AS full_name,
    'Patient' AS type,
    p.service
FROM patients AS p
WHERE p.service IN ('surgery', 'emergency')
UNION ALL
SELECT
    s.staff_id AS identifier,
    s.staff_name AS full_name,
    'Staff' AS type,
    s.service
FROM staff AS s
WHERE s.service IN ('surgery', 'emergency')
ORDER BY 
    type,
    service,
    full_name;
