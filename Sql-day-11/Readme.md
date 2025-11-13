# 🔍 Day 11 (13/11): Identifying Unique Data with DISTINCT  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced retrieving **unique values** from tables using `DISTINCT`.  
- Used `ORDER BY` to sort unique data clearly.  
- Learned how to find **unique combinations** using `GROUP BY`.  
- Strengthened skills in filtering out irrelevant values like `NULL` and `'none'`.  

---

## 💻 Practice Questions   

```sql
-- 1️⃣ List all unique services in the patients table.
SELECT 
    DISTINCT service
FROM patients
ORDER BY service;

-- 2️⃣ Find all unique staff roles in the hospital.
SELECT 
    DISTINCT role
FROM staff
ORDER BY role;

-- 3️⃣ Get distinct months from the services_weekly table.
SELECT 
    DISTINCT month
FROM services_weekly
ORDER BY month;


## 🧩 Challenge Question:

-- Find all unique combinations of service and event type where events are not NULL or 'none',
-- and count the occurrences of each combination.

SELECT 
    service,
    event,
    COUNT(*) AS occurrence_count
FROM services_weekly
WHERE event IS NOT NULL 
  AND LOWER(event) <> 'none'
GROUP BY service, event
ORDER BY occurrence_count DESC;


Reflection :
Day 11 helped me understand how to extract unique information and analyze event patterns using DISTINCT and GROUP BY. These techniques are essential for de-duplicating data and discovering meaningful combinations in datasets.

#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataAnalytics #DataScience #UpskillingJourney