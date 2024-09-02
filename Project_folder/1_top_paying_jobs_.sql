/*1-What are the top paying jobs for my role? (Data Analyst)
-Identify the top 10 highest-paying Data Analyst roles that are available remotely
-Focuses on job postings withy specified salaries(remove nulls)
-Why? Highlight the top-paying opportunities for data analysts, offering insights into*/

SELECT 
salary_year_avg,
job_title_short,
job_work_from_home
FROM job_postings_fact AS job_postings_fact

WHERE job_title_short LIKE '%Data Analyst%'
AND job_work_from_home= true
AND salary_year_avg IS NOT NULL

ORDER BY salary_year_avg desc

LIMIT 20
