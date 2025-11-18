# 🔗 Day 14 (16/11): LEFT JOIN & Handling Missing Data  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Practiced using **LEFT JOIN** to include all records from one table even when matches don’t exist.  
- Learned how LEFT JOIN helps identify missing or incomplete data (null matches).  
- Combined multiple tables (patients, staff, services) to build enriched reports.  
- Used conditional joins (e.g., present = 1) to filter attendance data.  
- Created utilization reports by combining aggregation + joins.  

---

## 💻 Practice & Challenge Queries  

```sql
-- 1️⃣ Show all staff and their schedule details (include staff with NO schedule records).
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

-- 2️⃣ List all services and their corresponding staff (include services with NO staff assigned).
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

-- 3️⃣ Display all patients and their weekly service statistics.
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


-- 🧩 Challenge:
-- Staff utilisation report including all staff, even if no schedule exists.
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
    s.staff_id, s.staff_name, s.role, s.service
ORDER BY 
    weeks_present DESC, s.staff_name;


Reflection
Day 14 focused on LEFT JOIN, which is essential for building complete reports even when data is missing.
This helped identify staff without schedules, services without staff, and patient services without weekly entries.
Understanding left joins is crucial for real-world datasets where information is often incomplete.

#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataAnalytics #DataScience #UpskillingJourney