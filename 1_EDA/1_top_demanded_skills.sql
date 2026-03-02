/*
Question: What are the most in-demand skills for Data science jobs in Sri Lanka
- Join job postings to inner join skills_dim and skills_job_dim to run the query
- Identify in-demand skills for Data science professionals
- Focus on job postings from Sri Lanka
- Why? Retrieves the skills with the highest demand in the Sri Lankan job market for data science jobs,
    providing insights into the most valuable skills for aspiring professionals in Sri Lanka.
*/

SELECT
  sd.skills AS skill,
  COUNT (jpf.*) AS demand_count
FROM 
  data_jobs.job_postings_fact AS jpf
INNER JOIN data_jobs.skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
INNER JOIN data_jobs.skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE 
  job_country = 'Sri Lanka'
GROUP BY
  sd.skills
ORDER BY demand_count DESC
LIMIT 10 ;

/*

Let's extract the key insights of this project,

- SQL comes on top with a demand count of 1003 and reamined as the most in demand skill in for data science
  closely followed by python in second with 872 count in demand.
- Azure & AWS shows growing demand specially in cloud architecture based work, 
  Azure leads the way with 517 count followed by AWS with 417 
- POwer BI is fifith with 393 demand count representing the eager to use business analytics tools
- Spark and Tableu comes next with a demand average of 375
- Microsoft excel is still in the top 10 showing the necessity of spreadsheet tools in companies
- Hadoop and r rounds the top 10 with both having roughly 230 demand count each

┌──────────┬──────────────┐
│  skill   │ demand_count │
│ varchar  │    int64     │
├──────────┼──────────────┤
│ sql      │         1003 │
│ python   │          872 │
│ azure    │          557 │
│ aws      │          417 │
│ power bi │          393 │
│ spark    │          390 │
│ tableau  │          361 │
│ excel    │          274 │
│ hadoop   │          236 │
│ r        │          229 │
├──────────┴──────────────┤
│ 10 rows       2 columns │
└─────────────────────────┘

*/








