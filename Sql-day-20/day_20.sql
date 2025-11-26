--practice questions

--1. Calculate running total of patients admitted by week for each service.
SELECT
    week,
	patients_admitted,
	service,
	SUM(patients_admitted) OVER(PARTITION BY service ORDER BY week) AS running_total
FROM services_weekly;

--2. Find the moving average of patient satisfaction over 4-week periods.
SELECT
    service,
    week,
    patient_satisfaction,
    ROUND(AVG(patient_satisfaction) OVER (
            PARTITION BY service
            ORDER BY week
            ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
        ),2) AS moving_4week_avg_satisfaction
FROM services_weekly
ORDER BY service,week;

--3. Show cumulative patient refusals by week across all services.
SELECT
    week,
    SUM(patients_refused) AS refused_this_week,
    SUM(SUM(patients_refused)) OVER (
        ORDER BY week
    ) AS cumulative_refused
FROM services_weekly
GROUP BY week
ORDER BY week;

--challenge question

--Create a trend analysis showing for each service and week: week number, patients_admitted, running total 
--of patients admitted (cumulative), 3-week moving average of patient satisfaction (current week and 2 prior 
--weeks), and the difference between current week admissions and the service average. Filter for weeks 10-20 only.
SELECT
    service,
    week,
    patients_admitted,
	SUM(patients_admitted) OVER (
        PARTITION BY service
        ORDER BY week
    ) AS cumulative_admissions,
	ROUND(AVG(patient_satisfaction) OVER (
            PARTITION BY service
            ORDER BY week
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),2) AS moving_3week_avg_satisfaction,
	patients_admitted - AVG(patients_admitted) OVER (PARTITION BY service)
      AS admission_diff_from_avg
FROM services_weekly
WHERE week BETWEEN 10 AND 20
ORDER BY service, week;