/*
Question:
- This query is to find the top paying skills for data science related jobs in sri lanka 
Why:- It's very important to have a clear understanding on the income level one can target with his skill stack and 
this query will provide insights and stats about them
*/


SELECT
  sd.skills AS skill,
  MEDIAN(jpf.salary_year_avg) AS median_salary,
  COUNT (jpf.*) AS demand_count
FROM 
  data_jobs.job_postings_fact AS jpf
INNER JOIN data_jobs.skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
INNER JOIN data_jobs.skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE 
  job_country = 'Sri Lanka'
GROUP BY
  sd.skills
ORDER BY median_salary DESC 
LIMIT 10 ;

/*

Key insights from the above query are as follows,
- php & cassandra has got the highest median salary but deifinitely they are rare skills
- next up we got oracle and ssis with 163782.0 with an average of about 100 demand count
- at 5 we got aurora with just 5 jobs mentioning the skill
- then we have airflow and aws with 147500.0 and aws with the highest demand count among top 10 skills
- postgresql, pandas and excel rounds up the top 10

┌────────────┬───────────────┬──────────────┐
│   skill    │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ php        │      188412.5 │            9 │
│ cassandra  │      188412.5 │           34 │
│ oracle     │      163782.0 │           99 │
│ ssis       │      163782.0 │          112 │
│ aurora     │      155500.0 │            5 │
│ airflow    │      147500.0 │          122 │
│ aws        │      147500.0 │          417 │
│ postgresql │      115250.0 │           75 │
│ pandas     │      101750.0 │           73 │
│ excel      │       98500.0 │          274 │
├────────────┴───────────────┴──────────────┤
│ 10 rows                         3 columns │
└───────────────────────────────────────────┘

*/