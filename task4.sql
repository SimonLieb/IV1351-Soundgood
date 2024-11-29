
CREATE OR REPLACE VIEW next_week_ensembles AS
SELECT 
    TO_CHAR(start_time, 'Day') AS day_of_week,
    genre,
    (max_num_of_students - COUNT(student_ensemble.student_id)) AS free_seats
FROM 
    ensemble
LEFT JOIN 
    student_ensemble ON ensemble.id = student_ensemble.ensemble_id
WHERE 
    start_time >= CURRENT_DATE AND start_time < CURRENT_DATE + INTERVAL '1 week'
GROUP BY 
    day_of_week, genre, max_num_of_students
ORDER BY 
    EXTRACT(DOW FROM MIN(start_time)), genre;

SELECT * FROM next_week_ensembles;
