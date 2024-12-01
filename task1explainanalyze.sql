EXPLAIN ANALYZE
WITH LessonCounts AS (
    SELECT 
        EXTRACT(YEAR FROM start_time) AS Year,
        EXTRACT(MONTH FROM start_time) AS Month,
        COUNT(*) FILTER (WHERE max_num_of_students = 1 AND min_num_of_students = 1) AS SoloLessons,
        COUNT(*) FILTER (WHERE max_num_of_students > 1 OR min_num_of_students > 1) AS GroupLessons
    FROM lesson
    GROUP BY EXTRACT(YEAR FROM start_time), EXTRACT(MONTH FROM start_time)
),
EnsembleCounts AS (
    SELECT 
        EXTRACT(YEAR FROM start_time) AS Year,
        EXTRACT(MONTH FROM start_time) AS Month,
        COUNT(*) AS EnsembleLessons
    FROM ensemble
    GROUP BY EXTRACT(YEAR FROM start_time), EXTRACT(MONTH FROM start_time)
)
SELECT 
    l.Year AS Year,
    l.Month AS Month,
    (l.SoloLessons + l.GroupLessons + e.EnsembleLessons) AS TotalLessons,
    l.SoloLessons AS SoloLessons,
    l.GroupLessons AS GroupLessons,
    e.EnsembleLessons AS EnsembleLessons
FROM LessonCounts l
INNER JOIN EnsembleCounts e 
    ON l.Year = e.Year AND l.Month = e.Month
ORDER BY Year, Month;