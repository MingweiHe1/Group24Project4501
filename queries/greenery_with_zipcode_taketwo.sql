
SELECT 
     t.zipcode, 
     COUNT(*) as tree_count
FROM 
     nyc_zipcode z
JOIN 
     nyc_tree t ON ST_Contains(z.geometry, t.geometry)
WHERE 
     t.status = 'Alive'
GROUP BY 
     t.zipcode
ORDER BY 
     tree_count DESC
LIMIT 2;
