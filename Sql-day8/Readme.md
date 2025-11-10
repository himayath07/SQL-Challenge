# 🔠 Day 8 (10/11): String Functions & Conditional Logic  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Explored **string manipulation functions** like `UPPER()`, `LOWER()`, `LENGTH()`, and `CONCAT()`.  
- Practiced creating **custom derived columns** using the `CASE` statement.  
- Learned how to categorize data dynamically with conditional logic.  
- Combined **functions** and **filters** to generate meaningful summaries.  

---

## 💻 Practice Queries  

```sql

-- 1️⃣ Convert all patient names to uppercase.
SELECT 
    UPPER(name) AS upper_patients_name
FROM patients;

-- 2️⃣ Find the length of each staff member's name.
SELECT 
    staff_name,
    LENGTH(staff_name) AS name_length
FROM staff;

-- 3️⃣ Concatenate staff_id and staff_name with a hyphen separator.
SELECT 
    staff_id,
    staff_name,
    CONCAT(staff_id, '-', staff_name) AS staff_id_and_name
FROM staff;


🧩 Challenge Query

-- Create a patient summary showing:patient_id, full name in uppercase, service in lowercase,name length, age, and age category
-- ('Senior', 'Adult', 'Minor'). Only include patients with names longer than 10 characters.
SELECT 
    patient_id,
    UPPER(name) AS full_name,
    LOWER(service) AS service,
    LENGTH(name) AS name_length,
    age,
    CASE
        WHEN age >= 65 THEN 'Senior'
        WHEN age >= 18 THEN 'Adult'
        ELSE 'Minor'
    END AS age_category
FROM patients
WHERE LENGTH(name) > 10;



Reflection : 
Day 8 was all about string operations and conditional expressions in SQL.
By combining CASE with string functions, I learned to transform and enrich raw data into more insightful and categorized outputs.


#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataAnalytics #DataScience #UpskillingJourney

