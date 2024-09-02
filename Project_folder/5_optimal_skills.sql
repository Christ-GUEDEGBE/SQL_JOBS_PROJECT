/*5-What are the most optimal skills to learn?
Why? Target skills that offers job security (high demand) and financial benefits (high salaries),
offering strategic insights for career development in data analytics
*/

WITH PREM AS 
(   
    SELECT AVG (jpc.salary_year_avg) AS MOY,
    skills_dim.skill_id,
    skills_dim.skills
    FROM job_postings_fact AS jpc
    INNER JOIN skills_job_dim ON jpc.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id

    WHERE jpc.salary_year_avg IS NOT NULL AND
        jpc.job_title_short LIKE '%Data Analyst%' AND 
        jpc.job_work_from_home=TRUE
        
    GROUP BY skills_dim.skill_id, skills_dim.skills
    --I grouped by the ids because this is good practice, I could have done it by the skills.
    --I add the skills so that it is a column of prems.
    --I can do it because each id corresponds to one here so it doesn't change anything.
),
DEUS AS
(   
   
    SELECT COUNT (skills) AS nombre_compet,
    skills_job_dim.skill_id
    FROM job_postings_fact AS jpc

    INNER JOIN skills_job_dim ON jpc.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
    WHERE jpc.salary_year_avg IS NOT NULL AND
        jpc.job_title_short LIKE '%Data Analyst%' AND 
        jpc.job_work_from_home=TRUE

    GROUP BY skills_job_dim.skill_id
)

SELECT PREM.skill_id,
MOY,
nombre_compet,
PREM.skills
FROM PREM

INNER JOIN DEUS ON PREM.skill_id = DEUS.skill_id

LIMIT 25

