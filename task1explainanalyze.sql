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
    COALESCE(l.Year, e.Year) AS Year,
    COALESCE(l.Month, e.Month) AS Month,
    COALESCE(SoloLessons, 0) + COALESCE(GroupLessons, 0) + COALESCE(EnsembleLessons, 0) AS TotalLessons,
    COALESCE(SoloLessons, 0) AS SoloLessons,
    COALESCE(GroupLessons, 0) AS GroupLessons,
    COALESCE(EnsembleLessons, 0) AS EnsembleLessons
FROM LessonCounts l
FULL OUTER JOIN EnsembleCounts e ON l.Year = e.Year AND l.Month = e.Month
ORDER BY Year, Month;
