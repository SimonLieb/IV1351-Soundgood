--- Added additional data values to the Task 1 query to return results for October, November, and December instead of only December --- : 

INSERT INTO lesson (instrument_type, start_time, end_time, locale, min_num_of_students, max_num_of_students, lvl, instructor_id)
VALUES
    ('Guitar', '2024-10-01 10:00:00+00', '2024-10-01 12:00:00+00', 'Room 104', 1, 1, 1, 1),
    ('Piano', '2024-10-02 13:00:00+00', '2024-10-02 15:00:00+00', 'Room 230', 1, 1, 2, 2),
    ('Drums', '2024-10-03 09:00:00+00', '2024-10-03 11:00:00+00', 'Aula Magna', 2, 3, 3, 3),
    ('Violin', '2024-10-04 16:00:00+00', '2024-10-04 18:00:00+00', 'Cantina', 2, 4, 2, 2),
	('Piano', '2024-11-02 13:00:00+00', '2024-11-02 15:00:00+00', 'Room 230', 1, 1, 2, 2),
    ('Drums', '2024-11-03 09:00:00+00', '2024-11-03 11:00:00+00', 'Aula Magna', 2, 3, 3, 3),
    ('Violin', '2024-11-04 16:00:00+00', '2024-11-04 18:00:00+00', 'Cantina', 2, 4, 2, 2);

INSERT INTO ensemble (start_time, end_time, genre, locale, min_num_of_students, max_num_of_students, lvl, instructor_id)
VALUES
    ('2024-10-01 10:00:00+00', '2024-10-01 12:00:00+00', 'Rock', 'Room 104', 1, 5, 1, 1),
    ('2024-10-02 13:00:00+00', '2024-10-02 15:00:00+00', 'Classical', 'Room 230', 1, 3, 2, 2),
    ('2024-10-03 09:00:00+00', '2024-10-03 11:00:00+00', 'Jazz', 'Aula Magna', 2, 6, 3, 3),
    ('2024-11-04 16:00:00+00', '2024-11-04 18:00:00+00', 'Hip-hop', 'Cantina', 1, 4, 2, 4),
    ('2024-11-05 18:00:00+00', '2024-11-05 20:00:00+00', 'K-Pop', 'Room 301', 1, 5, 1, 5);
