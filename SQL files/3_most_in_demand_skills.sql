-- The skill that is in the most demand for the role data analyst
-- top 5
-- Why? Job seekers can understand what the most in demand skills are for the role


SELECT 
    skills,
    COUNT(JBF.job_id) as Demand
FROM
    job_postings_fact AS jbf
    INNER JOIN skills_job_dim as sjd
    on jbf.job_id = sjd.job_id
    INNER JOIN skills_dim as sd
    on sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    Demand DESC
LIMIT 5