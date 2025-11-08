# 🧮 Day 6 (08/11): Grouping Data with GROUP BY  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced summarizing data using the **GROUP BY** clause.  
- Combined it with aggregate functions like **COUNT**, **SUM**, and **AVG**.  
- Calculated grouped insights such as average age, total patients, and admission rates.  
- Strengthened understanding of how aggregation supports analytical reporting.  

---

## 💻 Practice Queries  

```sql
-- 1️⃣ Count the number of patients by each service.
SELECT 
    service,
    COUNT(*) AS total_patients
FROM patients
GROUP BY service;

-- 2️⃣ Calculate the average age of patients grouped by service.
SELECT 
    service,
    ROUND(AVG(age), 2) AS average_age
FROM patients
GROUP BY service;

-- 3️⃣ Find the total number of staff members per role.
SELECT 
    role,
    COUNT(*) AS total_staff
FROM staff
GROUP BY role;

-- (Optional) View weekly service data
SELECT * FROM services_weekly;


🧩 Challenge Query
sql

-- For each hospital service, calculate the total patients admitted, total refused,
-- and the admission rate (percentage of requests that were admitted).
SELECT 
    service,
    SUM(patients_admitted) AS total_patients_admitted,
    SUM(patients_refused) AS total_patients_refused,
    ROUND((SUM(patients_admitted) / SUM(patients_request)) * 100, 2) AS admission_rate
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;

Reflection
Day 6 focused on grouping and aggregation — key concepts in SQL analytics.
Using GROUP BY helped transform raw data into meaningful summaries like patient trends and service performance.

#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataAnalytics #DataScience #UpskillingJourney