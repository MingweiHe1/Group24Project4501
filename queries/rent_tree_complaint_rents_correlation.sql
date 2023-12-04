


WITH Rent AS (
    SELECT 
        zipcode, 
        AVG(rent) AS avg_rent,
        RANK() OVER (ORDER BY AVG(rent)) AS rent_rank_asc,
        RANK() OVER (ORDER BY AVG(rent) DESC) AS rent_rank_desc
    FROM 
        nyc_zillow
    WHERE 
        recorded_date >= '2023-01-01' AND recorded_date < '2023-02-01'    
    GROUP BY 
        zipcode
),
Tree AS (
    SELECT 
        zipcode, 
        COUNT(*) AS tree_count
    FROM 
        nyc_tree
    GROUP BY 
        zipcode
),
Complaint AS (
    SELECT 
        incident_zip, 
        COUNT(*) AS complaint_count
    FROM 
        nyc_311
    GROUP BY 
        incident_zip
)
SELECT 
    r.zipcode,
    TO_CHAR(r.avg_rent, 'FM9,999,999.00') AS average_rent,
    t.tree_count,
    c.complaint_count
FROM 
    Rent r
LEFT JOIN 
    Tree t ON r.zipcode = t.zipcode::bigint
LEFT JOIN 
    Complaint c ON r.zipcode = c.incident_zip::bigint
WHERE 
    r.rent_rank_asc <= 5 OR r.rent_rank_desc <= 5
ORDER BY 
    r.rent_rank_desc, r.rent_rank_asc;
    
