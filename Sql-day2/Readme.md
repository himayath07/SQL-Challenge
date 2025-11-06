# 🧠 Day 2 (04/11): Filtering Data with WHERE Clause  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced using the **WHERE** clause for filtering data.  
- Explored **comparison** (`>`, `<`, `=`) and **logical** (`AND`, `OR`, `IN`) operators.  
- Learned how to filter records based on multiple conditions.  
- Understood the use of **BETWEEN**, **IS NULL**, and string literals in SQL.  
- Strengthened query-writing precision for real-world datasets.  

---

## 💻 Practice Queries

```sql
-- 1️⃣ Find all patients who are older than 60 years.
SELECT * 
FROM patients
WHERE age > 60;

-- 2️⃣ Retrieve all staff members who work in the 'Emergency' service.
SELECT * 
FROM staff
WHERE service = 'Emergency';

-- 3️⃣ List all weeks where more than 100 patients requested admission in any service.
SELECT week, patients_request, patients_admitted, service 
FROM services_weekly
WHERE patients_request > 100;

🧩 Challenge Query sql

-- Find all patients admitted to 'Surgery' service with a satisfaction score below 70,
-- showing their patient_id, name, age, and satisfaction score.
SELECT patient_id, name, age, satisfaction
FROM patients
WHERE service = 'Surgery' AND satisfaction < 70;

Day 2 focused on mastering conditional queries using the WHERE clause.
Filtering is a key part of SQL data analysis — today’s challenge improved both accuracy and query logic.


#SQLWithIDC #IndianDataClub #SQLChallenge #DataAnalytics #LearnSQL #DataScience #UpskillingJourney

