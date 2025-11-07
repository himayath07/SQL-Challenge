# 📊 Day 5 (07/11): Aggregate Functions — COUNT, AVG, MIN, MAX, SUM  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced key **aggregate functions**: `COUNT`, `AVG`, `MIN`, `MAX`, and `SUM`.  
- Used `ROUND()` to format numeric results.  
- Combined aggregates with **GROUP BY** to summarize data across services and weeks.  

---

## 💻 Practice Queries  

```sql
-- 1️⃣ Count the total number of patients in the hospital.
SELECT 
    COUNT(*) AS Total_Patients
FROM patients;

-- 2️⃣ Calculate the average satisfaction score of all patients.
SELECT 
    ROUND(AVG(satisfaction), 2) AS Avg_Satisfaction_Score
FROM patients;

-- 3️⃣ Find the minimum and maximum age of patients.
SELECT 
    MIN(age) AS Min_Age,
    MAX(age) AS Max_Age
FROM patients;


🧩 Challenge Query sql

-- Calculate the total patients admitted, total refused, 
-- and average satisfaction per service per week.
SELECT 
    service,
    week,
    SUM(patients_admitted) AS No_Patients_Admitted,
    SUM(patients_refused) AS No_Patients_Refused,
    ROUND(AVG(patient_satisfaction), 2) AS Avg_Patient_Satisfaction
FROM services_weekly
GROUP BY service, week
ORDER BY week, service;


Day 5 strengthened my understanding of data aggregation in SQL.
I learned how to summarize and interpret hospital data effectively using aggregate functions.


#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataAnalytics #DataScience #UpskillingJourney


