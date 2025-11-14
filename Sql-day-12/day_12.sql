--Practice questions

--1. Find all weeks in services_weekly where no special event occurred.
SELECT 
    DISTINCT week,
	event
FROM services_weekly
WHERE event IS NULL 
   OR LOWER(event) = 'none'
ORDER BY week;

--2. Count how many records have null or empty event values.
SELECT 
    COUNT(*) AS Null_event_values
FROM services_weekly
WHERE event IS NULL 
   OR LOWER(event) = 'none';
   
--3. List all services that had at least one week with a special event.
SELECT DISTINCT service
FROM services_weekly
WHERE event IS NOT NULL
  AND LOWER(event) <> 'none'
ORDER BY service;

--Challenge questions

--Analyze the event impact by comparing weeks with events vs weeks without events. Show: event status
--('With Event' or 'No Event'), count of weeks, average patient satisfaction, and average staff morale. 
--Order by average patient satisfaction descending. 
SELECT 
    CASE
        WHEN event IS NOT NULL AND event <> '' AND LOWER(event) <> 'none'
            THEN 'With Event'
        ELSE 'No Event'
    END AS event_status,
	
	COUNT(DISTINCT week) AS week_count,
	ROUND(AVG(patient_satisfaction),2) AS Avg_satisfaction,
	ROUND(AVG(staff_morale),2) AS Avg_staff_morale
FROM services_weekly
GROUP BY event_status
ORDER BY Avg_satisfaction DESC;
	


