# 📝 Day 12 (14/11): Handling NULLs & Event-Based Analysis  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced identifying and filtering **NULL** and `'none'` values.  
- Learned how to clean event data using conditional checks.  
- Extracted unique weeks and services based on event presence.  
- Used a `CASE` expression to categorize event vs. no-event weeks.  
- Performed comparative analysis using aggregation.  

---

## 💻 Practice Queries  

```sql
-- 1️⃣ Find all weeks where no special event occurred.
SELECT 
    DISTINCT week,
    event
FROM services_weekly
WHERE event IS NULL 
   OR LOWER(event) = 'none'
ORDER BY week;

-- 2️⃣ Count how many records have null or empty event values.
SELECT 
    COUNT(*) AS Null_event_values
FROM services_weekly
WHERE event IS NULL 
   OR LOWER(event) = 'none';

-- 3️⃣ List all services that had at least one week with a special event.
SELECT DISTINCT service
FROM services_weekly
WHERE event IS NOT NULL
  AND LOWER(event) <> 'none'
ORDER BY service;


🧩 Challenge

-- Analyze event impact by comparing weeks with events vs. without events.
-- Show: event status, week count, avg patient satisfaction, avg staff morale.
SELECT 
    CASE
        WHEN event IS NOT NULL AND event <> '' AND LOWER(event) <> 'none'
            THEN 'With Event'
        ELSE 'No Event'
    END AS event_status,
    
    COUNT(DISTINCT week) AS week_count,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    ROUND(AVG(staff_morale), 2) AS avg_staff_morale
FROM services_weekly
GROUP BY event_status
ORDER BY avg_satisfaction DESC;


Reflection:

Day 12 focused on cleaning and analyzing event-driven data.
Understanding how to handle NULL, 'none', and empty values is essential for reliable insights.
The challenge helped compare the impact of events on satisfaction and morale effectively.


#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataAnalytics #DataScience #UpskillingJourney