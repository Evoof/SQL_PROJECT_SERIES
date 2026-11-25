# Project 03: Student Performance Analysis

**Level:** Beginner

## Overview
You have just joined a secondary school as a junior data analyst. The principal wants to understand how students are performing, which factors affect their scores, and which students need extra support. In this project you will set up a PostgreSQL database, clean the data, explore it, and answer 10 business questions using SQL. It is ideal for anyone starting their SQL journey.

## Skills Covered
`WHERE` · `LIKE` · `BETWEEN` · `AVG` · `MIN` / `MAX` · `ROUND` · `GROUP BY` · `ORDER BY` · `LIMIT` · `CASE WHEN` · calculated columns · `DELETE`

## Dataset
500 students across Grades 7 to 12. Scores are out of 100.

| Column | Description |
|--------|-------------|
| student_id | Unique ID for each student |
| student_name | Full name of the student |
| gender | Male or Female |
| age | Age of the student |
| grade_level | Grade the student is in (7 to 12) |
| math_score | Maths score |
| english_score | English score |
| science_score | Science score |
| attendance_pct | Percentage of school days attended |
| study_hours_per_week | Hours the student studies each week |
| extracurricular | Whether the student takes part in extracurricular activities (Yes/No) |
| internet_access | Whether the student has internet access at home (Yes/No) |

## Objectives
1. **Set up the database:** Create `p3_student_db`, create a table called `student_performance`, and import the CSV.
2. **Data exploration:** Find the total students, the grade levels, and the youngest and oldest student.
3. **Data cleaning:** Find and delete any records with missing values.
4. **Business analysis:** Use SQL to answer the business questions below.

## Business Questions
1. Write a query to retrieve all Grade 12 students who scored above 70 in Maths.
2. Write a query to retrieve all students whose name starts with `A` and who are aged between 15 and 17.
3. Write a query to find the average score for each subject, and the highest and lowest Maths score.
4. Write a query to find the number of students and the average attendance for each grade level.
5. Write a query to find the average score in each subject for each gender.
6. Write a query to find the top 10 students based on their average score across the three subjects.
7. Write a query to group students into performance bands based on their average score and count the students in each band (Distinction: 70 and above, Credit: 60 to 69, Pass: 50 to 59, Fail: below 50).
8. Write a query to compare the average score of students with internet access and students without it.
9. Write a query to group students by weekly study hours (Low: under 5, Medium: 5 to 10, High: over 10) and find the average score in each group.
10. Write a query to find the number of at-risk students for each grade level (attendance below 75% and an average score below 50).

## How to Participate
1. Download the dataset
2. Create the database and the table in PostgreSQL, then import the CSV
3. Clean the data and write your queries for the business questions
4. Share your solution link or screenshots with me

## Solution
Coming soon.
