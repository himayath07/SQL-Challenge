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
	sw.staff_morale,
    s.staff_id,
    s.staff_name,
    s.role
FROM services_weekly AS sw
LEFT JOIN staff AS s
ON s.service = sw.service
ORDER BY sw.service, sw.week, s.staff_name;

---3. Display all patients and their service's weekly statistics (if available).
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.service,
    sw.week,
    sw.patients_admitted,
    sw.patient_satisfaction,
    sw.event
FROM patients AS p
LEFT JOIN services_weekly AS sw
ON p.service = sw.service
ORDER BY p.name, sw.week;


--Challenge questions

--Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) 
--and the count of weeks they were present (from staff_schedule). Include staff members even if 
--they have no schedule records. Order by weeks present descending.
SELECT
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    COUNT(ss.week) AS weeks_present
FROM staff AS s
LEFT JOIN staff_schedule AS ss
    ON s.staff_id = ss.staff_id
	AND ss.present = 1
GROUP BY 
    s.staff_id,s.staff_name,s.role,s.service
ORDER BY 
    weeks_present DESC,s.staff_name;
