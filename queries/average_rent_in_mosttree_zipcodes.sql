

SELECT 
    t.zipcode, 
    TO_CHAR(AVG(z.rent), 'FM9,999.99') as average_rent
FROM 
    (
        SELECT 
            CAST(zipcode AS text), -- Cast to text if needed
            COUNT(*) AS tree_count
        FROM 
            nyc_tree
        WHERE 
            status = 'Alive'
        GROUP BY 
            zipcode
        ORDER BY 
            COUNT(*) DESC
        LIMIT 10
    ) AS t
JOIN 
    nyc_zillow z ON t.zipcode = CAST(z.zipcode AS text) -- Cast to text if needed
WHERE 
    z.recorded_date BETWEEN '2023-08-01' AND '2023-08-31'
GROUP BY 
    t.zipcode, t.tree_count
ORDER BY 
    average_rent DESC
