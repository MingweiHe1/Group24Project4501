
SELECT 
     zipcode, 
     COUNT(*) AS tree_count
FROM 
     nyc_tree
WHERE 
     status = 'Alive'
GROUP BY 
     zipcode
ORDER BY 
     tree_count DESC
LIMIT 10;
