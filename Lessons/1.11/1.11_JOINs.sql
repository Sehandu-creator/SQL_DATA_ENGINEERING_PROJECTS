SELECT 
   cd.name as company_name,
   COUNT (jpf.*) as postings_count
FROM
   job_postings_fact as jpf
LEFT JOIN company_dim as cd
   ON jpf.company_id = cd.company_id
GROUP BY cd.name;



  