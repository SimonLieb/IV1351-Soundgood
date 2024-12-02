SELECT 
    i.id AS instructor_id,
    i.name AS instructor_name,
    l.lesson_count + e.ensemble_count AS total_lesson_count
FROM 
    instructor i
LEFT JOIN 
    (SELECT 
         instructor_id, 
         COUNT(*) AS lesson_count 
     FROM 
         lesson 
     WHERE 
         DATE_TRUNC('month', start_time) = DATE_TRUNC('month', CURRENT_DATE) 
     GROUP BY 
         instructor_id) l ON i.id = l.instructor_id
LEFT JOIN 
    (SELECT 
         instructor_id, 
         COUNT(*) AS ensemble_count 
     FROM 
         ensemble 
     WHERE 
         DATE_TRUNC('month', start_time) = DATE_TRUNC('month', CURRENT_DATE) 
     GROUP BY 
         instructor_id) e ON i.id = e.instructor_id
WHERE 
    l.lesson_count + e.ensemble_count > 2  -- threshold is 2 here, we change as needed
ORDER BY 
    total_lesson_count DESC;
