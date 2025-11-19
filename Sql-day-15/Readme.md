# 🔗 Day 15 (17/11): Advanced LEFT JOINS & Multi-Table Analysis  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced **multi-table LEFT JOINs** across patients, staff, staff_schedule, and services_weekly.  
- Identified mismatched and missing data using LEFT JOIN to ensure complete reporting.  
- Built multi-level reports combining patient details, service details, and staff availability.  
- Used conditional joins to match staff presence for specific weeks.  
- Generated a week-specific service analysis report using aggregated metrics.  

---

## 💻 Practice & Challenge Queries  

```sql
-- 1️⃣ Show all staff members and their schedule information (include staff with NO schedule entries).
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

-- 2️⃣ List all services and their corresponding staff (include services even if NO staff assigned).
SELECT 
    sw.service,
    sw.week,
    sw.month,
    sw.staff_morale,
    s.staff_id,
    s.staff_name,
    s.role
FROM services_weekly AS sw
LEFT JOIN staff AS s
    ON sw.service = s.service
ORDER BY sw.service, sw.week, s.staff_name;

-- 3️⃣ Join patients, staff, and staff_schedule to show patient service + staff availability.
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

-- 4️⃣ Combine services_weekly with staff and staff_schedule for full service analysis.
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

-- 5️⃣ Multi-table patient admissions + staff presence report.
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


-- 🧩 Challenge:
-- Comprehensive service analysis report for week 20.
SELECT
    sw.service,
    sw.patients_admitted AS total_patients_admitted,
	sw.patients_refused AS total_refused,
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
GROUP BY sw.service,sw.patients_admitted,sw.patients_refused
ORDER BY total_patients_admitted DESC;


Reflection:
Day 15 was focused on deep multi-table joins, combining four tables to build analytical reports.
Week-based conditions, LEFT JOIN logic, and aggregated metrics provided strong real-world reporting experience.


#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataAnalytics #DataScience #UpskillingJourney
