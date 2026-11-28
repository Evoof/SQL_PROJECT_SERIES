# Project 04: Employee Workforce Analysis

**Level:** Beginner
**Database:** `p4_hr_db`
**Solution release date:** [add date]

## Overview
You have just joined a growing company as a junior HR data analyst. Management wants to understand the workforce: who the highest earners are, how salaries compare across departments and genders, how hiring has changed over the years, and which departments perform best. In this project you will set up a PostgreSQL database, clean the data, explore it, and answer 10 business questions using SQL. It is ideal for anyone starting their SQL journey.

## Skills Covered
`WHERE` · `ORDER BY` · `LIMIT` · `COUNT` · `SUM` · `AVG` · `ROUND` · `GROUP BY` · `HAVING` · `EXTRACT` · `CASE WHEN` · `DELETE`

## Dataset
File: [`employee_workforce.csv`](./employee_workforce.csv)
400 employees across 7 departments. All salaries are monthly and in Naira (₦).

| Column | Description |
|--------|-------------|
| employee_id | Unique ID for each employee |
| employee_name | Full name of the employee |
| gender | Male or Female |
| age | Age of the employee |
| department | Department the employee works in |
| job_level | Junior, Mid-level, Senior or Manager |
| hire_date | Date the employee was hired |
| monthly_salary | Monthly salary in Naira |
| performance_rating | Performance rating from 1 to 5 |
| employment_type | Full-time, Part-time or Contract |
| city | City where the employee is based |
| leave_days_taken | Number of leave days taken this year |

## Objectives
1. **Set up the database:** Create `p4_hr_db`, create a table called `employees`, and import the CSV.
2. **Data exploration:** Find the total employees, the departments, the job levels, and the earliest and latest hire date.
3. **Data cleaning:** Find and delete any records with missing values.
4. **Business analysis:** Use SQL to answer the business questions below.

## Business Questions
1. Write a query to retrieve all Managers hired before `2020-01-01`, longest-serving first.
2. Write a query to find the 10 highest-paid employees (show name, department, job level and salary).
3. Write a query to find the number of employees and the total monthly salary bill for each department, highest salary bill first.
4. Write a query to find the number of employees hired in each year.
5. Write a query to find the average monthly salary of each gender within each job level.
6. Write a query to group employees into salary bands and count the employees in each (Low: below 300,000, Medium: 300,000 to 700,000, High: above 700,000).
7. Write a query to find the departments whose average performance rating is above 3.5.
8. Write a query to find the average number of leave days taken in each department, highest first.
9. Write a query to find the number of top performers (rating of 5) in each department.
10. Write a query to find the number of employees and the average monthly salary for each employment type.

## How to Participate
1. Download the dataset
2. Create the database and the table in PostgreSQL, then import the CSV
3. Clean the data and write your queries for the business questions
4. Share your solution link or screenshots with me

## Solution
Coming soon.
