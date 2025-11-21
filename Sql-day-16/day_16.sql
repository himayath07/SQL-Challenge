--practice questions

--1. Find patients who are in services with above-average staff count.
SELECT
     p.patient_id,
	 p.name AS patient_name,
	 p.service
FROM patients AS p
WHERE p.service IN( 
     SELECT s.service
     FROM staff AS s
	 GROUP BY s.service
	 HAVING COUNT(s.staff_id)>(
         SELECT AVG(staff_count)
		 FROM(
           SELECT COUNT(staff_id)AS staff_count
		   FROM staff
		   GROUP BY service
		     )
	)
);

--2. List staff who work in services that had any week with patient satisfaction below 70.
SELECT
    s.staff_id,
    s.staff_name,
    s.service,
    s.role
FROM staff AS s
WHERE s.service IN (
    SELECT sw.service
    FROM services_weekly AS sw
    WHERE sw.patient_satisfaction < 70
);

--3. Show patients from services where total admitted patients exceed 1000.
SELECT
    p.patient_id,
	p.name AS patient_name,
	p.service
FROM patients AS p
WHERE p.service IN (
    SELECT sw.service
    FROM services_weekly AS sw
	GROUP BY service
    HAVING SUM(sw.patients_admitted) > 1000
);

--Challenge Query

--Find all patients who were admitted to services that had at least one week where patients were refused AND 
--the average patient satisfaction for that service was below the overall hospital average satisfaction. 
--Show patient_id, name, service, and their personal satisfaction score.
SELECT
    p.patient_id,
	p.name AS patient_name,
	p.satisfaction AS patient_satisfaction,
	p.service
FROM patients AS p
WHERE p.service IN (
    SELECT sw.service
    FROM services_weekly AS sw
	GROUP BY sw.service
	 HAVING 
        SUM(patients_refused) > 0
        AND AVG(patient_satisfaction) < (
                SELECT AVG(patient_satisfaction)
                FROM services_weekly
            )
)
ORDER BY p.service, patient_satisfaction;