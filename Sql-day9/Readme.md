# 📅 Day 9 (11/11): Working with Dates & Duration in SQL  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced extracting **date components** using `EXTRACT()` (Year, Month).  
- Calculated **duration differences** between two dates (e.g., stay length).  
- Applied **GROUP BY** and **HAVING** with date-based calculations.  
- Learned how to analyze patient stays and filter based on average duration.  

---

## 💻 Practice Queries  

```sql
-- 1️⃣ Extract the year from all patient arrival dates.
SELECT 
    arrival_date,
    EXTRACT(YEAR FROM arrival_date) AS arrival_year
FROM patients;	 

-- 2️⃣ Calculate the length of stay for each patient.
SELECT 
    name,
    arrival_date,
    departure_date,
    (departure_date - arrival_date) AS length_of_stay
FROM patients;

-- 3️⃣ Find all patients who arrived in a specific month (e.g., March).
SELECT 
    name,
    arrival_date
FROM patients
WHERE EXTRACT(MONTH FROM arrival_date) = 3;


🧩 Challenge Query

-- Calculate the average length of stay (in days) for each service, showing only services where the average stay is more than 7 days.
-- Also include the count of patients and sort by average stay descending.
SELECT 
    service,
    COUNT(*) AS patient_count,
    ROUND(AVG(departure_date - arrival_date), 2) AS avg_length_of_stay
FROM patients
GROUP BY service
HAVING AVG(departure_date - arrival_date) > 7
ORDER BY avg_length_of_stay DESC;


Reflection :
Day 9 introduced powerful date-based analysis in SQL.
By using functions like EXTRACT() and date subtraction, I learned to calculate stay durations, analyze seasonal trends, and identify long-term patients.


#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataAnalytics #DataScience #UpskillingJourney