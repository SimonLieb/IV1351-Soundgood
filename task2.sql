SELECT 
    COALESCE(sibling_count.count, 0) AS number_of_siblings,
    COUNT(s.id) AS student_count
FROM 
    student s
LEFT JOIN 
    (SELECT 
         student_id_1 AS student_id, COUNT(*) AS count 
     FROM 
         student_siblings 
     GROUP BY 
         student_id_1
     UNION ALL
     SELECT 
         student_id_2 AS student_id, COUNT(*) AS count 
     FROM 
         student_siblings 
     GROUP BY 
         student_id_2) AS sibling_count
ON 
    s.id = sibling_count.student_id
GROUP BY 
    sibling_count.count
ORDER BY 
    number_of_siblings;