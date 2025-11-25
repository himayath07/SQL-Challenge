--practice questions
Select * from staff
--1. Rank patients by satisfaction score within each service.
SELECT
    patient_id,
    name AS patient_name,
    service,
    satisfaction,
    RANK() OVER (
        PARTITION BY service
        ORDER BY satisfaction DESC
    ) AS satisfaction_rank
FROM patients
ORDER BY service, satisfaction_rank, patient_name;

--2. Assign row numbers to staff ordered by their name.
SELECT
    staff_id,
    staff_name,
    role,
    service,
    ROW_NUMBER() OVER (
        ORDER BY staff_name
    ) AS row_num
FROM staff
ORDER BY row_num;

--3. Rank services by total patients admitted.
SELECT
    service,
    total_admitted,
    RANK() OVER (
        ORDER BY total_admitted DESC
    ) AS admission_rank
FROM (
        SELECT 
            service,
            SUM(patients_admitted) AS total_admitted
        FROM services_weekly
        GROUP BY service
     ) AS svc
ORDER BY admission_rank, service;

--challenge question

--For each service, rank the weeks by patient satisfaction score (highest first). Show service, week, 
--patient_satisfaction, patients_admitted, and the rank. Include only the top 3 weeks per service.
SELECT
    service,
    week,
    patient_satisfaction,
    patients_admitted,
    satisfaction_rank
FROM (
        SELECT
            service,
            week,
            patient_satisfaction,
            patients_admitted,
            RANK() OVER (
                PARTITION BY service
                ORDER BY patient_satisfaction DESC
            ) AS satisfaction_rank
        FROM services_weekly
     ) AS ranked
WHERE satisfaction_rank <= 3
ORDER BY service, satisfaction_rank, week;