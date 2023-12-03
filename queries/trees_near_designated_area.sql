
SELECT 
     tree_id, 
     spc_common, 
     health, 
     status, 
     ST_AsText(geometry) AS location
FROM 
     nyc_tree
WHERE 
     ST_DWithin(geometry, 'POINT(-73.96253174434912 40.80737875669467)'::geography, 804.672)
