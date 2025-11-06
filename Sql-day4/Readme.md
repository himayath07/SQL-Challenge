# 🧠 Day 4 (06/11): Limiting Query Results with LIMIT & OFFSET  
**21 Days SQL Challenge — Indian Data Club**

---

## 📘 Learnings  
- Learned to **control result size** using `LIMIT` to show specific rows.  
- Used **OFFSET** to skip initial rows in a query.  
- Combined `ORDER BY`, `LIMIT`, and `OFFSET` to extract ranked or paginated results.  

---

## 💻 Practice Queries  

```sql
-- 1️⃣ Display the first 5 patients from the patients table.
SELECT * 
FROM patients
LIMIT 5;

-- 2️⃣ Show patients 11–20 using OFFSET.
SELECT * 
FROM patients
LIMIT 10 OFFSET 10;

-- 3️⃣ Get the 10 most recent patient admissions based on arrival_date.
SELECT * 
FROM patients
ORDER BY arrival_date DESC
LIMIT 10;
🧩 Challenge Query
sql
Copy code
-- Find the 3rd to 7th highest patient satisfaction scores,
-- showing patient_id, name, service, and satisfaction.
SELECT patient_id, name, service, satisfaction
FROM patients
ORDER BY satisfaction DESC
LIMIT 5 OFFSET 2;

Reflection:
Day 4 helped me understand how to paginate data efficiently.
The use of LIMIT and OFFSET made it easier to fetch ranked results and specific data ranges from large datasets.

#SQLWithIDC #IndianDataClub #SQLChallenge #LearnSQL #DataScience #Upskilling #DatabaseLearning