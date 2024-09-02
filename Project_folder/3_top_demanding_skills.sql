/*3-What are the most in-demand skills for my role?
-Why? Retrieve the top 5 skills with the highest demand in the job market*/
SELECT COUNT (skills) AS nombre_compet,
skills
FROM job_postings_fact AS jpc

INNER JOIN skills_job_dim ON jpc.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE jpc.salary_year_avg IS NOT NULL AND
      jpc.job_title_short LIKE '%Data Analyst%' AND 
      jpc.job_work_from_home=TRUE

GROUP BY skills
ORDER BY nombre_compet DESC

LIMIT 5