--Checking if table exist
DROP TABLE IF exists students_performance;

--Creating the students_performance table
CREATE TABLE students_performance(
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
gender VARCHAR(10),
age INT,
grade_level INT,
math_score INT,
engilsh_score INT,
science_score INT,
attendance INT,
study_hours_per_week INT,
extracurricular VARCHAR(5),
internet_access VARCHAR(5)
);

--Loading the data into the table
COPY students_performance
FROM '/private/tmp/student_performance.csv'
WITH (FORMAT csv, HEADER true);

--Checking the dataset
SELECT *
FROM students_performance;

---- Total number of students
SELECT COUNT(*)
FROM students_performance;

-- Check for NULL values
SELECT *
FROM students_performance
WHERE
	student_name IS NULL OR
	gender IS NULL OR
	age IS NULL OR
	grade_level IS NULL OR
	math_score IS NULL OR
	engilsh_score IS NULL OR
	science_score IS NULL OR
	attendance IS NULL OR
	study_hours_per_week IS NULL OR
	extracurricular IS NULL OR
	internet_access IS NULL;

-- Delete the records with NULL values
DELETE FROM students_performance
WHERE
	student_name IS NULL OR
	gender IS NULL OR
	age IS NULL OR
	grade_level IS NULL OR
	math_score IS NULL OR
	engilsh_score IS NULL OR
	science_score IS NULL OR
	attendance IS NULL OR
	study_hours_per_week IS NULL OR
	extracurricular IS NULL OR
	internet_access IS NULL;

--DATA EXPLORATION
SELECT COUNT(*) AS total_students
FROM students_performance;

-- Grade levels in the dataset
SELECT DISTINCT grade_level
FROM students_performance
ORDER BY grade_level;

-- Youngest and oldest student
SELECT
	MIN(age) AS youngest_student,
	MAX(age) AS oldest_student
FROM students_performance;

-- Unique values in gender
SELECT DISTINCT gender
FROM students_performance
ORDER BY gender;

--BUSINESS QUESTIONS

--Write a query to retrieve all Grade 12 students who scored above 70 in Maths.
SELECT student_name, math_score, grade_level
FROM students_performance
WHERE grade_level = 12 AND math_score > 70
ORDER BY math_score;

--Write a query to retrieve all students whose name starts with A and who are aged between 15 and 17.
SELECT *
FROM students_performance
WHERE student_name LIKE 'A%' AND
	age BETWEEN 15 AND 17;

--Write a query to find the average score for each subject, and the highest and lowest Maths score.
SELECT
	ROUND(AVG(math_score),2) AS math_avg,
	ROUND(AVG(engilsh_score),2) AS english_avg,
	ROUND(AVG(science_score),2) AS science_avg,
	MAX(math_score) AS highest_math_score,
	MIN(math_score) AS lowest_math_score
FROM students_performance;
	
--Write a query to find the number of students and the average attendance for each grade level.
SELECT
	grade_level,
	COUNT(*) AS totao_num_students,
	ROUND(AVG(attendance),2) AS avg_grade
FROM students_performance
GROUP BY grade_level
ORDER BY grade_level;

--Write a query to find the average score in each subject for each gender.
SELECT gender,
	ROUND(AVG(math_score),2) AS math_avg,
	ROUND(AVG(engilsh_score),2) AS english_avg,
	ROUND(AVG(science_score),2) AS science_avg
FROM students_performance
GROUP BY gender;

--Write a query to find the top 10 students based on their average score across the three subjects.
SELECT student_id,student_name,grade_level,
	ROUND(((math_score+engilsh_score+science_score)/3),2) AS total_avg_score
FROM students_performance
GROUP BY student_id
ORDER BY total_avg_score DESC
LIMIT 10;

--Write a query to group students into performance bands based on their average score and count the students in each band (Distinction: 70 and above, Credit: 60 to 69, Pass: 50 to 59, Fail: below 50).
SELECT
	CASE
		WHEN ROUND(((math_score+engilsh_score+science_score)/3),2) >= 70 THEN 'Distinction'
		WHEN ROUND(((math_score+engilsh_score+science_score)/3),2) >= 60 THEN 'Credit'
		WHEN ROUND(((math_score+engilsh_score+science_score)/3),2) >= 50 THEN 'Pass'
		ELSE 'Fail'
	END AS performance_band,
	COUNT(*) AS total_students
FROM students_performance
GROUP BY performance_band
ORDER BY total_students DESC;

--Write a query to compare the average score of students with internet access and students without it.
SELECT internet_access,
	ROUND(AVG(math_score + engilsh_score + science_score)/3, 2) AS avg_score_students
FROM students_performance
GROUP BY internet_access;

--Write a query to group students by weekly study hours (Low: under 5, Medium: 5 to 10, High: over 10) and find the average score in each group.
SELECT
	CASE
		WHEN study_hours_per_week < 5 THEN 'Low'
		WHEN study_hours_per_week BETWEEN 5 AND 10 THEN 'Medium'
		ELSE 'High'
	END AS students_level,
	ROUND(AVG((math_score+engilsh_score+science_score)/3),2) AS avg_score_students
FROM students_performance
GROUP BY students_level;

--Write a query to find the number of at-risk students for each grade level (attendance below 75% and an average score below 50).
SELECT grade_level,
	COUNT(*) AS no_of_at_risk_std
FROM students_performance
WHERE attendance < 75 AND
	(math_score + engilsh_score + science_score)/3 < 50
GROUP BY grade_level
ORDER BY no_of_at_risk_std DESC;












