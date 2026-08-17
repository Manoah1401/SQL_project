    --SELECT count(job_id) FROM job_postings_fact WHERE job_title_short = 'Data Analyst' AND job_location = 'Anywhere';
    --SELECT * FROM skills_dim limit 10;
    --SELECT job_id FROM skills_job_dim where skill_id=0;
    with jobs AS(
        SELECT
            sjd.skill_id,
            COUNT(jbf.job_id) AS Number_of_jobs,
            ROUND((((COUNT(jbf.job_id)::DECIMAL) / (SELECT 
                                            count(job_id) 
                                        FROM 
                                            job_postings_fact 
                                        WHERE 
                                            job_title_short = 'Data Analyst')
                                        ) * 100.00),2) AS percentage 
        FROM
            job_postings_fact as jbf
            INNER JOIN skills_job_dim as sjd
            on jbf.job_id = sjd.job_id
        WHERE
            job_title_short = 'Data Analyst' 
        GROUP BY
            sjd.skill_id
        )

    SELECT
        jobs.skill_id,
        sd.skills,
        jobs.percentage
    FROM
        jobs
        LEFT JOIN skills_dim as sd
        on jobs.skill_id = sd.skill_id
    ORDER BY jobs.Number_of_jobs desc
    LIMIT 5


-- Result:
-- Around 47% of jobs posted have sql as a required skill
-- Followed by excel with just under 35%
-- Python, tableau and power bi are the other commonly required skills