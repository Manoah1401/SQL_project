--for the top 10 Data Analyst Roles available remotely, what are the skills you need to achieve it
--  Top 10 highest paying jobs
--  Specific skills for these jobs
--Why? => Helps job seekers to understand what skills they need to acquire in order to target the top paying jobs
--SELECT * FROM job_postings_fact LIMIT 10;

WITH top_salaries AS(
    SELECT 
        job_id,
        job_title,
        name as Company_Name,
        job_via,
        job_schedule_type,
        job_posted_date :: DATE,
        salary_year_avg
    FROM 
        job_postings_fact AS jbf
        LEFT JOIN company_dim as cd
        ON jbf.company_id = cd.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_work_from_home = TRUE AND 
        salary_year_avg is NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

-- SELECT * from top_salaries;

SELECT
    ts.job_id,
    job_title,
    Company_Name,
    job_via,
    job_schedule_type,
    job_posted_date :: DATE,
    salary_year_avg,
    skills
FROM
    top_salaries as ts
    INNER JOIN skills_job_dim AS sjd
    ON ts.job_id = sjd.job_id
    LEFT JOIN skills_dim as sd
    ON sjd.skill_id = sd.skill_id

/*
Result:
SQL seems to be the skill commonly found in the highest paying data analyst jobs
followed by Python and Tableau
*/




