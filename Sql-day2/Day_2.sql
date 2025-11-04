--Practice Questions
--Find all patients who are older than 60 years.
select * from patients
where age>60

--Retrieve all staff members who work in the 'Emergency' service.
select * from staff
where service = 'emergency'

--List all weeks where more than 100 patients requested admission in any service.
SELECT week, patients_request, patients_admitted, service 
FROM services_weekly
WHERE patients_request>100;

--Challenge Questions
--Find all patients admitted to 'Surgery' service with a satisfaction score below 70, 
--showing their patient_id, name, age, and satisfaction score.
Select patient_id, name, age, satisfaction
from patients
where service ='surgery' and satisfaction>70