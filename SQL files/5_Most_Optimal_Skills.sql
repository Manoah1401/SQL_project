-- Most Optimal skills corresponding to the most amount of opportunities as well being the highest paid.

-- SELECT * FROM job_postings_fact ;
-- SELECT * FROM company_dim LIMIT 10;
-- SELECT * FROM skills_dim LIMIT 10;
-- SELECT * FROM skills_job_dim LIMIT 10;


SELECT 
    sd.skill_id,
    sd.skills,
    Count(jbf.job_id) as opportunities,
    ROUND(AVG(salary_year_avg),2) AS Avg_salary
FROM job_postings_fact AS jbf
    LEFT JOIN company_dim AS cd
    ON jbf.company_id = cd.company_id
    INNER JOIN skills_job_dim as sjd
    ON jbf.job_id = sjd.job_id
    LEFT JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL

GROUP BY sd.skill_id
HAVING
    Count(jbf.job_id)>10
ORDER BY
    opportunities DESC,
    Avg_salary DESC;