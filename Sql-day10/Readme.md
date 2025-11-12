# 🧩 Day 10 (12/11): Conditional Categorization with CASE Statements  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Learned to use the **CASE** statement for creating conditional categories in SQL.  
- Practiced classifying data dynamically (e.g., satisfaction level, age groups, and role categories).  
- Combined **aggregate functions** with `CASE` to generate service-level performance insights.  
- Strengthened analytical thinking by converting numeric data into meaningful labels.  

---

## 💻 Practice Queries  

```sql
-- 1️⃣ Categorize patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
SELECT 
    patient_id,
    name,
    satisfaction,
    CASE
        WHEN satisfaction >= 80 THEN 'High'
        WHEN satisfaction >= 50 THEN 'Medium'
        ELSE 'Low'
    END AS satisfaction_level
FROM patients;

-- 2️⃣ Label staff roles as 'Medical' or 'Support' based on role type.
SELECT 
    staff_id,
    staff_name,
    role,
    CASE
        WHEN role IN ('doctor', 'nurse') THEN 'Medical'
        ELSE 'Support'
    END AS role_category
FROM staff;

-- 3️⃣ Create age groups for patients (0–18, 19–40, 41–65, 65+).
SELECT 
    patient_id,
    name,
    age,
    CASE
        WHEN age BETWEEN 0 AND 18 THEN '0-18'
        WHEN age BETWEEN 19 AND 40 THEN '19-40'
        WHEN age BETWEEN 41 AND 65 THEN '41-65'
        ELSE '65+'
    END AS age_group
FROM patients;


🧩 Challenge Query

-- Create a service performance report showing service name, total patients admitted, 
-- and performance category based on satisfaction score.
SELECT 
    service,
    SUM(patients_admitted) AS total_admitted,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    CASE
        WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
        WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'
        WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'
        ELSE 'Needs Improvement'
    END AS performance_category
FROM services_weekly
GROUP BY service
ORDER BY AVG(patient_satisfaction) DESC;


Reflection:
Day 10 emphasized conditional categorization in SQL using the CASE statement.
It’s a powerful feature for transforming raw numeric data into insightful categories — essential for reporting and analytics.

#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataAnalytics #DataScience #UpskillingJourney