--Practice questions

---1. Show all staff members and their schedule information (including those with no schedule entries).
SELECT 
    s.staff_id,
    s.staff_name,
    s.role,
    ss.week,
    ss.service,
    ss.present
FROM staff AS s
LEFT JOIN staff_schedule AS ss 
ON s.staff_id = ss.staff_id
ORDER BY s.staff_id, ss.week;

---2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
SELECT 
    sw.service,
    sw.week,
    sw.month,
	sw.staff_morale,
    s.staff_id,
    s.staff_name,
    s.role
FROM servi AS s
LEFT JOIN staff_schedule AS ss 
ON s.staff_id = ss.staff_id
ORDER BY s.staff_id, ss.week;

--1. Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    s.staff_id,
    s.staff_name,
    s.role,
    ss.week,
    ss.present
FROM patients AS p
LEFT JOIN staff AS s
   ON p.service = s.service
LEFT JOIN staff_schedule AS ss
   ON s.staff_id = ss.staff_id
ORDER BY p.name, s.staff_name, ss.week;

--2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis
SELECT 
    sw.week,
    sw.month,
    sw.service,
    sw.patients_admitted,
    sw.patient_satisfaction,
    sw.event,   
    s.staff_id,
    s.staff_name,
    s.role,  
    ss.present
FROM services_weekly AS sw
LEFT JOIN staff AS s
    ON sw.service = s.service
LEFT JOIN staff_schedule AS ss
    ON s.staff_id = ss.staff_id
       AND sw.week = ss.week
ORDER BY sw.service, sw.week, s.staff_id;

--3. Create a multi-table report showing patient admissions with staff information.
SELECT
    p.patient_id,
    p.name AS patient_name,
    p.service,
    p.age,
    sw.week,
    sw.month,
    sw.patients_admitted,
    sw.patient_satisfaction,
    sw.staff_morale,
    sw.event,
    s.staff_id,
    s.staff_name,
    s.role,
    ss.present AS staff_present
FROM patients AS p
LEFT JOIN services_weekly AS sw
    ON p.service = sw.service
LEFT JOIN staff AS s
    ON p.service = s.service
LEFT JOIN staff_schedule AS ss
    ON s.staff_id = ss.staff_id
   AND sw.week = ss.week
ORDER BY p.name, sw.week, s.staff_name;
	
--Challenge questions

--Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted 
--that week, total patients refused, average patient satisfaction, count of staff assigned to service, and 
--count of staff present that week. Order by patients admitted descending.
SELECT
    sw.service,
    SUM(sw.patients_admitted) AS total_patients_admitted,
	SUM(sw.patients_refused) AS total_refused,
    ROUND(AVG(sw.patient_satisfaction),2) AS avg_satisfaction,
	COUNT(DISTINCT s.staff_id) AS staff_assigned,
	COUNT(DISTINCT CASE 
                      WHEN ss.present = 1 AND ss.week = 20 THEN ss.staff_id 
                   END) AS staff_present_week20
FROM services_weekly AS sw
LEFT JOIN staff AS s
    ON sw.service = s.service
LEFT JOIN staff_schedule AS ss
    ON s.staff_id = ss.staff_id 
   AND ss.week = 20
WHERE sw.week = 20 
GROUP BY sw.service
ORDER BY total_patients_admitted DESC;

