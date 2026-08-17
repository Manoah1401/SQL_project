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

/*
[
  {
    "skill_id": 0,
    "skills": "sql",
    "opportunities": "3083",
    "avg_salary": "96435.33"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "opportunities": "2143",
    "avg_salary": "86418.90"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "opportunities": "1840",
    "avg_salary": "101511.85"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "opportunities": "1659",
    "avg_salary": "97978.08"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "opportunities": "1073",
    "avg_salary": "98707.80"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "opportunities": "1044",
    "avg_salary": "92323.60"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "opportunities": "527",
    "avg_salary": "82940.76"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "opportunities": "524",
    "avg_salary": "88315.61"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "opportunities": "500",
    "avg_salary": "93707.36"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "opportunities": "500",
    "avg_salary": "93707.36"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "opportunities": "336",
    "avg_salary": "96191.42"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "opportunities": "332",
    "avg_salary": "100964.19"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "opportunities": "319",
    "avg_salary": "105399.62"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "opportunities": "291",
    "avg_salary": "106439.84"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "opportunities": "288",
    "avg_salary": "97266.97"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "opportunities": "271",
    "avg_salary": "98019.82"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "opportunities": "260",
    "avg_salary": "103855.35"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "opportunities": "241",
    "avg_salary": "111577.72"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "opportunities": "212",
    "avg_salary": "85292.80"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "opportunities": "187",
    "avg_salary": "113001.94"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "opportunities": "185",
    "avg_salary": "93844.97"
  },
  {
    "skill_id": 189,
    "skills": "sap",
    "opportunities": "183",
    "avg_salary": "92446.21"
  },
  {
    "skill_id": 198,
    "skills": "outlook",
    "opportunities": "180",
    "avg_salary": "80680.33"
  },
  {
    "skill_id": 195,
    "skills": "sharepoint",
    "opportunities": "174",
    "avg_salary": "89027.16"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "opportunities": "155",
    "avg_salary": "84129.61"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "opportunities": "153",
    "avg_salary": "91805.12"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "opportunities": "145",
    "avg_salary": "107931.30"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "opportunities": "140",
    "avg_salary": "110888.27"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "opportunities": "135",
    "avg_salary": "100213.87"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "opportunities": "129",
    "avg_salary": "91536.86"
  },
  {
    "skill_id": 201,
    "skills": "alteryx",
    "opportunities": "124",
    "avg_salary": "105579.57"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "opportunities": "108",
    "avg_salary": "108331.04"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "opportunities": "102",
    "avg_salary": "112880.74"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "opportunities": "102",
    "avg_salary": "97234.75"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "opportunities": "100",
    "avg_salary": "100932.78"
  },
  {
    "skill_id": 190,
    "skills": "spreadsheet",
    "opportunities": "100",
    "avg_salary": "78465.89"
  },
  {
    "skill_id": 204,
    "skills": "visio",
    "opportunities": "99",
    "avg_salary": "101035.82"
  },
  {
    "skill_id": 141,
    "skills": "express",
    "opportunities": "96",
    "avg_salary": "108221.35"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "opportunities": "90",
    "avg_salary": "110767.07"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "opportunities": "90",
    "avg_salary": "107968.80"
  },
  {
    "skill_id": 15,
    "skills": "matlab",
    "opportunities": "89",
    "avg_salary": "99908.55"
  },
  {
    "skill_id": 26,
    "skills": "c",
    "opportunities": "89",
    "avg_salary": "98714.56"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "opportunities": "84",
    "avg_salary": "105237.60"
  },
  {
    "skill_id": 170,
    "skills": "windows",
    "opportunities": "80",
    "avg_salary": "86512.83"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "opportunities": "78",
    "avg_salary": "113065.48"
  },
  {
    "skill_id": 23,
    "skills": "crystal",
    "opportunities": "76",
    "avg_salary": "87327.33"
  },
  {
    "skill_id": 184,
    "skills": "dax",
    "opportunities": "75",
    "avg_salary": "99548.74"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "opportunities": "74",
    "avg_salary": "112249.64"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "opportunities": "71",
    "avg_salary": "116387.26"
  },
  {
    "skill_id": 56,
    "skills": "mysql",
    "opportunities": "71",
    "avg_salary": "101381.40"
  },
  {
    "skill_id": 14,
    "skills": "c#",
    "opportunities": "71",
    "avg_salary": "97247.74"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "opportunities": "68",
    "avg_salary": "105695.51"
  },
  {
    "skill_id": 200,
    "skills": "cognos",
    "opportunities": "66",
    "avg_salary": "90407.22"
  },
  {
    "skill_id": 202,
    "skills": "ms access",
    "opportunities": "65",
    "avg_salary": "84872.71"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "opportunities": "62",
    "avg_salary": "114153.12"
  },
  {
    "skill_id": 16,
    "skills": "t-sql",
    "opportunities": "60",
    "avg_salary": "95722.65"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "opportunities": "59",
    "avg_salary": "115479.53"
  },
  {
    "skill_id": 216,
    "skills": "github",
    "opportunities": "59",
    "avg_salary": "101498.36"
  },
  {
    "skill_id": 169,
    "skills": "linux",
    "opportunities": "58",
    "avg_salary": "114883.20"
  },
  {
    "skill_id": 10,
    "skills": "html",
    "opportunities": "55",
    "avg_salary": "84382.71"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "opportunities": "54",
    "avg_salary": "107397.56"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "opportunities": "49",
    "avg_salary": "114057.87"
  },
  {
    "skill_id": 226,
    "skills": "terminal",
    "opportunities": "46",
    "avg_salary": "83567.30"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "opportunities": "44",
    "avg_salary": "111496.45"
  },
  {
    "skill_id": 57,
    "skills": "postgresql",
    "opportunities": "44",
    "avg_salary": "106852.94"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "opportunities": "40",
    "avg_salary": "129999.16"
  },
  {
    "skill_id": 191,
    "skills": "microstrategy",
    "opportunities": "39",
    "avg_salary": "94485.56"
  },
  {
    "skill_id": 21,
    "skills": "visual basic",
    "opportunities": "39",
    "avg_salary": "86972.33"
  },
  {
    "skill_id": 67,
    "skills": "db2",
    "opportunities": "38",
    "avg_salary": "107130.29"
  },
  {
    "skill_id": 168,
    "skills": "unix",
    "opportunities": "37",
    "avg_salary": "111123.32"
  },
  {
    "skill_id": 102,
    "skills": "jupyter",
    "opportunities": "37",
    "avg_salary": "103522.46"
  },
  {
    "skill_id": 105,
    "skills": "gdpr",
    "opportunities": "33",
    "avg_salary": "105328.92"
  },
  {
    "skill_id": 20,
    "skills": "powershell",
    "opportunities": "32",
    "avg_salary": "105040.78"
  },
  {
    "skill_id": 108,
    "skills": "matplotlib",
    "opportunities": "31",
    "avg_salary": "99307.10"
  },
  {
    "skill_id": 11,
    "skills": "css",
    "opportunities": "30",
    "avg_salary": "85317.07"
  },
  {
    "skill_id": 25,
    "skills": "php",
    "opportunities": "29",
    "avg_salary": "109051.51"
  },
  {
    "skill_id": 214,
    "skills": "docker",
    "opportunities": "28",
    "avg_salary": "99261.57"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "opportunities": "26",
    "avg_salary": "113607.71"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "opportunities": "26",
    "avg_salary": "113607.71"
  },
  {
    "skill_id": 106,
    "skills": "scikit-learn",
    "opportunities": "26",
    "avg_salary": "103932.15"
  },
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "opportunities": "26",
    "avg_salary": "103088.79"
  },
  {
    "skill_id": 112,
    "skills": "plotly",
    "opportunities": "25",
    "avg_salary": "106602.86"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "opportunities": "24",
    "avg_salary": "120646.83"
  },
  {
    "skill_id": 236,
    "skills": "smartsheet",
    "opportunities": "24",
    "avg_salary": "71221.46"
  },
  {
    "skill_id": 137,
    "skills": "phoenix",
    "opportunities": "23",
    "avg_salary": "109259.09"
  },
  {
    "skill_id": 104,
    "skills": "spring",
    "opportunities": "22",
    "avg_salary": "97453.61"
  },
  {
    "skill_id": 211,
    "skills": "jenkins",
    "opportunities": "21",
    "avg_salary": "101418.62"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "opportunities": "20",
    "avg_salary": "125226.20"
  },
  {
    "skill_id": 31,
    "skills": "perl",
    "opportunities": "20",
    "avg_salary": "124685.75"
  },
  {
    "skill_id": 32,
    "skills": "assembly",
    "opportunities": "20",
    "avg_salary": "85389.70"
  },
  {
    "skill_id": 12,
    "skills": "bash",
    "opportunities": "19",
    "avg_salary": "105074.72"
  },
  {
    "skill_id": 248,
    "skills": "zoom",
    "opportunities": "19",
    "avg_salary": "89791.42"
  },
  {
    "skill_id": 110,
    "skills": "react",
    "opportunities": "16",
    "avg_salary": "88567.19"
  },
  {
    "skill_id": 219,
    "skills": "atlassian",
    "opportunities": "15",
    "avg_salary": "117965.60"
  },
  {
    "skill_id": 193,
    "skills": "splunk",
    "opportunities": "15",
    "avg_salary": "112927.60"
  },
  {
    "skill_id": 249,
    "skills": "microsoft teams",
    "opportunities": "15",
    "avg_salary": "85570.03"
  },
  {
    "skill_id": 247,
    "skills": "slack",
    "opportunities": "15",
    "avg_salary": "83441.95"
  },
  {
    "skill_id": 235,
    "skills": "planner",
    "opportunities": "15",
    "avg_salary": "77039.12"
  },
  {
    "skill_id": 58,
    "skills": "neo4j",
    "opportunities": "12",
    "avg_salary": "108646.42"
  },
  {
    "skill_id": 59,
    "skills": "elasticsearch",
    "opportunities": "12",
    "avg_salary": "107815.75"
  },
  {
    "skill_id": 136,
    "skills": "angular",
    "opportunities": "12",
    "avg_salary": "102103.25"
  },
  {
    "skill_id": 120,
    "skills": "seaborn",
    "opportunities": "12",
    "avg_salary": "98747.83"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "opportunities": "11",
    "avg_salary": "118406.68"
  }
]
*/