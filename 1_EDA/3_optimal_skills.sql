/*
Question - What are the most optimal skills in data science field in sri lanka balancing both the salary and the demand?
- Create a ranking column that combines the demand count and the median salary to identify the most valuable skills
-Focus only on job postings from sri lanka with a specified salary
Why? - It gives the balance between the demand vs the financial reward rather than allowing rare, 
difficult skills to distort the quality of the results
*/

SELECT
  sd.skills AS skill,
  MEDIAN(jpf.salary_year_avg) AS median_salary,
  -- COUNT(jpf.salary_year_avg) AS demand_count,
  ROUND(ln(COUNT(jpf.salary_year_avg)) ,2) AS corrected_demand,
  ROUND((MEDIAN(jpf.salary_year_avg) * ln(COUNT(jpf.salary_year_avg))) / 100000 ,2) AS optimal_score
FROM 
  data_jobs.job_postings_fact AS jpf
INNER JOIN data_jobs.skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
INNER JOIN data_jobs.skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE 
  job_country = 'Sri Lanka' AND 
  salary_year_avg IS NOT NULL
GROUP BY
  sd.skills
ORDER BY optimal_score DESC 
LIMIT 10;

/*

Optimal score on different data science related skills based on the sri lankan market is as follows,

┌────────────┬───────────────┬──────────────────┬───────────────┐
│   skill    │ median_salary │ corrected_demand │ optimal_score │
│  varchar   │    double     │      double      │    double     │
├────────────┼───────────────┼──────────────────┼───────────────┤
│ azure      │       77590.0 │             2.48 │          1.93 │
│ sql        │       72500.0 │             2.64 │          1.91 │
│ python     │       70000.0 │             2.71 │           1.9 │
│ aws        │      147500.0 │              1.1 │          1.62 │
│ power bi   │       79200.0 │             1.95 │          1.54 │
│ php        │      188412.5 │             0.69 │          1.31 │
│ cassandra  │      188412.5 │             0.69 │          1.31 │
│ databricks │       72386.5 │             1.79 │           1.3 │
│ excel      │       98500.0 │              1.1 │          1.08 │
│ pyspark    │       59000.0 │             1.79 │          1.06 │
├────────────┴───────────────┴──────────────────┴───────────────┤
│ 10 rows                                             4 columns │
└───────────────────────────────────────────────────────────────┘

*/

