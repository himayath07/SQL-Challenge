# 📈 Day 20 (22/11): Advanced Window Functions — Running Totals & Moving Averages  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Learned to compute **running totals** using `SUM() OVER (ORDER BY ...)`.  
- Calculated **moving averages** using window frames (`ROWS BETWEEN x PRECEDING AND CURRENT ROW`).  
- Used cumulative window functions alongside GROUP BY results.  
- Built multi-metric trend reports combining running totals, moving averages, and deviations from service averages.  
- Gained strong practical experience with analytical SQL used in dashboards and time-series reports.  

---

## 💻 Practice & Challenge Queries  

```sql
-- 1️⃣ Running total of patients admitted by week for each service.
SELECT
    week,
    patients_admitted,
    service,
    SUM(patients_admitted) OVER (
        PARTITION BY service 
        ORDER BY week
    ) AS running_total
FROM services_weekly;

-- 2️⃣ 4-week moving average of patient satisfaction.
SELECT
    service,
    week,
    patient_satisfaction,
    ROUND(
        AVG(patient_satisfaction) OVER (
            PARTITION BY service
            ORDER BY week
            ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
        ), 2
    ) AS moving_4week_avg_satisfaction
FROM services_weekly
ORDER BY service, week;

-- 3️⃣ Cumulative patient refusals by week (all services).
SELECT
    week,
    SUM(patients_refused) AS refused_this_week,
    SUM(SUM(patients_refused)) OVER (
        ORDER BY week
    ) AS cumulative_refused
FROM services_weekly
GROUP BY week
ORDER BY week;

-- 🧩 Challenge:
-- Trend analysis for weeks 10–20 with cumulative + moving averages + deviation from avg.
SELECT
    service,
    week,
    patients_admitted,
    SUM(patients_admitted) OVER (
        PARTITION BY service
        ORDER BY week
    ) AS cumulative_admissions,
    ROUND(
        AVG(patient_satisfaction) OVER (
            PARTITION BY service
            ORDER BY week
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2
    ) AS moving_3week_avg_satisfaction,
    patients_admitted 
        - AVG(patients_admitted) OVER (PARTITION BY service)
        AS admission_diff_from_avg
FROM services_weekly
WHERE week BETWEEN 10 AND 20
ORDER BY service, week;
