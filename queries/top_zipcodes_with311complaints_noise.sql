
SELECT 
      incident_zip, 
      COUNT(*) AS complaint_count
FROM 
      nyc_311
WHERE 
      created_date BETWEEN '2022-10-01' AND '2023-09-30'
      AND complaint_type LIKE '%Noise%'
GROUP BY 
      incident_zip
ORDER BY 
      complaint_count DESC;
