--Practice questions

--1. Join patients and staff based on their common service field (show patient and staff who work in same service).
SELECT
    p.patient_id,
	p.name,
	s.staff_name,
	p.service
FROM patients as p
INNER JOIN staff as s
ON p.service = s.service

--2. Join services_weekly with staff to show weekly service data with staff information.
SELECT
    sw.week,
    sw.month,
    sw.service,
    sw.patients_admitted,
    sw.patient_satisfaction,
    sw.staff_morale,
    s.staff_id,
	s.staff_name,
	s.role
FROM services_weekly as sw
INNER JOIN staff_schedule AS s
ON sw.service = s.service
ORDER BY sw.week, sw.service;

--3. Create a report showing patient information along with staff assigned to their service
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    p.age,
    p.satisfaction,
    s.staff_id,
    s.staff_name,
    s.role
FROM patients AS p
INNER JOIN staff_schedule AS s
ON p.service = s.service
ORDER BY p.service, p.name, s.staff_name;

--Challenge questions

-- Create a comprehensive report showing patient_id, patient name, age, service, and the total 
--number of staff members available in their service. Only include patients from services that have 
--more than 5 staff members. Order by number of staff descending, then by patient name. 
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    p.age,
    s.total_staff
FROM patients AS p
INNER JOIN (
    SELECT 
        service,
        SUM(present) AS total_staff
    FROM staff_schedule
    GROUP BY service
    HAVING SUM(present) > 5
) AS s
ON p.service = s.service
ORDER BY 
    s.total_staff DESC,
    p.name;



