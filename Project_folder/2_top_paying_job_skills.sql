/*2-What are the skills required for these top paying-roles?
-Why? It provides a detailled look at which high paying job demand certains skills, 
helping job seekers a detailed look understand Which skills to develop that align top salaries
*/ 

WITH etc AS 
( 
SELECT *
FROM skills_job_dim
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
INNER JOIN job_postings_fact ON skills_job_dim.job_id=job_postings_fact.job_id

)

SELECT etc.job_title_short,
etc.job_work_from_home,
etc.salary_year_avg,
etc.skills
--,name AS comp_name
FROM etc 
--LEFT JOIN company_dim ON etc.company_id=company_dim.company_id   ******* (completely optional...)
WHERE
    etc.job_title_short LIKE '%Data Analyst%' AND
    etc.salary_year_avg IS NOT NULL AND
    etc.job_work_from_home='TRUE'
    
ORDER BY etc.salary_year_avg DESC
LIMIT 10
