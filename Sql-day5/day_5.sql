--Practice questions

--Count the total number of patients in the hospital.
SELECT 
     COUNT(*) AS Total_Patients
FROM patients 

--Calculate the average satisfaction score of all patients.
SELECT 
     ROUND(AVG(satisfaction),2) AS Avg_Satisfaction_Score
FROM patients 

--Find the minimum and maximum age of patients.
SELECT 
     MIN(age) AS Min_Age,
	 MAX(age) AS Max_age
FROM patients

--Challenge questions

--Calculate the total number of patients admitted, total patients refused, and the average patient 
--satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.
SELECT service,week,
     SUM(patients_admitted) AS No_Patients_Admitted,
     SUM(patients_refused) AS No_Patients_Refused,
     ROUND(AVG(patient_satisfaction), 2) AS Avg_Patient_Satisfaction
FROM services_weekly
GROUP BY service,week
ORDER BY week, service

