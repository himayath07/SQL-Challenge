# 📊 Day 3 (05/11): Sorting Data with ORDER BY  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Learned how to **sort query results** using the `ORDER BY` clause.  
- Practiced sorting in both **ascending (ASC)** and **descending (DESC)** order.  
- Explored sorting by **multiple columns** for better result organization.  
- Applied sorting with **LIMIT** to get top results efficiently.  

---

## 💻 Practice Queries

```sql
-- 1️⃣ List all patients sorted by age in descending order.
SELECT name, age 
FROM patients
ORDER BY age DESC;

-- 2️⃣ Show all services_weekly data sorted by week ascending and patients_request descending.
SELECT * 
FROM services_weekly
ORDER BY week ASC, patients_request DESC;

-- 3️⃣ Display staff members sorted alphabetically by their names.
SELECT * 
FROM staff
ORDER BY staff_name ASC;
🧩 Challenge Query
sql
Copy code
-- Retrieve the top 5 weeks with the highest patient refusals across all services,
-- showing week, service, patients_refused, and patients_request.
SELECT week, service, patients_refused, patients_request
FROM services_weekly
ORDER BY patients_refused DESC
LIMIT 5;


Reflection:
Day 3 focused on mastering data sorting in SQL.
Understanding how to organize data output with ORDER BY and LIMIT made data insights clearer and more structured.

#SQLWithIDC #IndianDataClub #SQLChallenge #DataAnalytics #LearnSQL #DataScience #UpskillingJourney