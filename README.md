# Introduction
📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/SQL%20files/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

[The Data](https://www.lukebarousse.com/sql) is packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:
1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code**: My go-to for database management and executing SQL queries.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.
```sql
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
```
Here's the breakdown of the top data analyst jobs in 2026:

- **Wide Salary Range**: Top 10 paying data analyst roles span from $184,000 to $650,000, indicating significant salary potential in the field.
- **Diverse Employers**: Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
- **Job Title Variety**: There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

![Top Paying Graph](asset\1.jpg)
Top Paying Roles Bar graph visualizing the salary for the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.
```sql
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
```
Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2026:

- SQL is leading with a bold count of 8.
- Python follows closely with a bold count of 7.
- Tableau is also highly sought after, with a bold count of 6. 
- Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.

![Most In Demand](asset\2.jpg)
Top Paying Skills Bar graph visualizing the count of skills for the top 10 paying jobs for data analysts; ChatGPT generated this graph from my SQL query results

### 3. In-Demand Skills for Data Analysts
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
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
```
Here's the breakdown of the most demanded skills for data analysts in 2026

- SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
- Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

    | Skill    | Demand Count |
    |----------|-------------:|
    | SQL      | 92,628        |
    | Excel    | 67,031        |
    | Python   | 57,326        |
    | Tableau  | 46,554        |
    | Power BI | 39,468       |

Table of the demand for the top 5 skills in data analyst job postings

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
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
    job_title_short = 'Data Analyst' and salary_year_avg is NOT NULL
GROUP BY
    skills
ORDER BY
    Average_Salary DESC
LIMIT 5
```
Here's a breakdown of the results for top paying skills for Data Analysts:

- **High Demand for Big Data & ML Skills**: Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
- **Software Development & Deployment Proficiency**: Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, with a premium on skills that facilitate automation and efficient data pipeline management.
- **Cloud Computing Expertise**: Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, suggesting that cloud proficiency significantly boosts earning potential in data analytics.

    | Skill    | Average Salary |
    |----------|-------------:|
    | pyspark      | 208,172        |
    | bitbucket    | 189,154       |
    | couchbase   | 160,515        |
    | watson  | 4160,515         |
    | datarobot | 155,485       |

Table of the average salary for the top 5 paying skills for data analysts

### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
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
```
| Skill ID | Skills      | Average Salary ($) | Number of opportunities |
| :--- | :--- | ---: | ---: |
| 0   | sql          | 3083 | $96,435 |
| 181 | excel  | 2143 | $86,418 |
| 1  | python      | 1840 | $101,511 |
| 182  | tableau   | 1073 | $97,978 |
| 5  | r       | 1044 | $98,707 |
| 183  | powerbi    | 527 | $92,323 |
| 188  | word         | 524 | $82,940 |
| 196   | powerpoint       | 17 | $88,315 |
| 186 | sas        | 500 | $106,683 |
| 7 | sas        | 500 | $937,707.36 |

Table of the most optimal skills for data analyst sorted by salary

Here's a breakdown of the most optimal skills for Data Analysts in 2026:

- **High-Demand Programming Languages**: Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand, their average salaries are around $101,397 for Python and $100,499 for R, indicating that proficiency in these languages is highly valued but also widely available.
- **Cloud Tools and Technologies**: Skills in specialized technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
- **Business Intelligence and Visualization Tools**: Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries around $99,288 and $103,795, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
- **Database Technologies:** The demand for skills in traditional and NoSQL databases (Oracle, SQL Server, NoSQL) with average salaries ranging from $97,786 to $104,534, reflects the enduring need for data storage, retrieval, and management expertise.
# What I Learned
Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

🧩 **Complex Query Crafting**: Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.

📊 **Data Aggregation**: Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.

💡 **Analytical Wizardry**: Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.
# Conclusions
### Insights
From the analysis, several general insights emerged:

1. The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!
2. Skills for Top-Paying Jobs: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. Most In-Demand Skills: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. Skills with Higher Salaries: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.
5. Optimal Skills for Job Market Value: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.
### Closing Thoughts
This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.