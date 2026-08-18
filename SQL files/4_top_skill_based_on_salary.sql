-- To find the top skill based on salary
-- Sort the Data analyst jobs based on salary
-- The skills required for these jobs
-- Find the average salary per skill
-- Why? => To understand the ROI for learning each skill

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) as Average_Salary
FROM
    job_postings_fact AS jbf
    INNER JOIN skills_job_dim as sjd
    on jbf.job_id = sjd.job_id
    INNER JOIN skills_dim as sd
    on sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst' and salary_year_avg is NOT NULL AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    Average_Salary DESC
LIMIT 10
