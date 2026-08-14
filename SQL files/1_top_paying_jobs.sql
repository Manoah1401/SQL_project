--top 10 Data Analyst Roles available remotely
--Focus on jobs that have a salary posted
--Why? => to highlight top paying jobs for a Data Analyst, offering insights into employement opportunities

--SELECT * FROM job_postings_fact LIMIT 10;

WITH top_salaries AS(
    SELECT 
        job_id,
        job_title,
        company_id,
        job_via,
        job_schedule_type,
        job_posted_date :: DATE,
        salary_year_avg
    FROM 
        job_postings_fact
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_work_from_home = TRUE AND 
        salary_year_avg is NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    ts.job_id,
    ts.job_title,
    cd.name Company_Name,
    ts.job_via,
    ts.job_schedule_type,
    ts.job_posted_date :: DATE,
    ts.salary_year_avg
FROM
    top_salaries AS ts
    LEFT JOIN company_dim as cd
    ON ts.company_id = cd.company_id


