/*4-What are the top skills based on salary for my role?
Why It reveals how different skills salary impact levels for data analyst and
helps identify the most financially rewarding skills to acquire or improve
*/

SELECT AVG (jpc.salary_year_avg) AS MOY, skills -- je peux me permettre de mettre skills ici
--pcq apres une jointure a été faite
--Je n'ai pas besoin d'inclure dans le select les colonnes de la condition where 
FROM job_postings_fact AS jpc
INNER JOIN skills_job_dim ON jpc.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id

WHERE jpc.salary_year_avg IS NOT NULL AND
      jpc.job_title_short LIKE '%Data Analyst%' AND 
      jpc.job_work_from_home=TRUE
     
GROUP BY skills
ORDER BY MOY DESC
LIMIT 25
