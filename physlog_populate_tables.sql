-- Dummy Data Generation Script

-- Addresses
INSERT INTO address (street, zip, city, country)
VALUES
    ('123 Oak St', '90210', 'Beverly Hills', 'USA'),
    ('456 Maple Ave', '10001', 'New York', 'USA'),
    ('789 Pine Ln', '30301', 'Atlanta', 'USA'),
    ('101 Birch Rd', '90001', 'Los Angeles', 'USA'),
    ('202 Cedar Blvd', '60601', 'Chicago', 'USA');

-- Instructors
INSERT INTO instructor (ssn, name, mail, gender, can_teach_ensembles, phone_number)
VALUES
    ('123-45-6789', 'John Doe', 'johndoe@email.com', 'Male', TRUE, '123-456-7890'),
    ('987-65-4321', 'Jane Smith', 'janesmith@email.com', 'Female', FALSE, '987-654-3210'),
    ('555-55-5555', 'Alice Johnson', 'alicejohnson@email.com', 'Female', TRUE, '555-555-5555'),
    ('111-22-3333', 'Bob Brown', 'bobbrown@email.com', 'Male', TRUE, '111-222-3333'),
    ('444-55-6666', 'Charlie Black', 'charlieblack@email.com', 'Male', FALSE, '444-555-6666');

-- Instructor Addresses
INSERT INTO instructor_address (instructor_id, address_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Instructor Availability
INSERT INTO instructor_availability (start_time, end_time, instructor_id)
VALUES
    ('2024-11-15 09:00:00+00', '2024-11-15 12:00:00+00', 1),
    ('2024-11-15 14:00:00+00', '2024-11-15 17:00:00+00', 2),
    ('2024-11-15 08:00:00+00', '2024-11-15 11:00:00+00', 3),
    ('2024-11-15 13:00:00+00', '2024-11-15 16:00:00+00', 4),
    ('2024-11-15 10:00:00+00', '2024-11-15 13:00:00+00', 5);

-- Lessons
INSERT INTO lesson (instrument_type, start_time, end_time, locale, min_num_of_students, max_num_of_students, lvl, instructor_id)
VALUES
    ('Guitar', '2024-11-16 10:00:00+00', '2024-11-16 12:00:00+00', 'Room 104', 1, 1, 1, 1),
    ('Piano', '2024-11-16 13:00:00+00', '2024-11-16 15:00:00+00', 'Room 230', 1, 1, 2, 2),
    ('Drums', '2024-11-16 09:00:00+00', '2024-11-16 11:00:00+00', 'Aula Magna', 2, 3, 3, 3),
    ('Violin', '2024-11-16 16:00:00+00', '2024-11-16 18:00:00+00', 'Cantina', 2, 4, 2, 4),
    ('Flute', '2024-11-16 18:00:00+00', '2024-11-16 20:00:00+00', 'Room 301', 2, 5, 1, 5);

-- Ensembles
INSERT INTO ensemble (start_time, end_time, genre, locale, min_num_of_students, max_num_of_students, lvl, instructor_id)
VALUES
    ('2024-11-16 10:00:00+00', '2024-11-16 12:00:00+00', 'Rock','Room 104', 1, 5, 1, 1),
    ('2024-11-16 13:00:00+00', '2024-11-16 15:00:00+00', 'Classical','Room 230', 1, 3, 2, 2),
    ('2024-11-16 09:00:00+00', '2024-11-16 11:00:00+00', 'Jazz','Aula Magna', 2, 6, 3, 3),
    ('2024-11-16 16:00:00+00', '2024-11-16 18:00:00+00', 'Hip-hop','Cantina', 1, 4, 2, 4),
    ('2024-11-16 18:00:00+00', '2024-11-16 20:00:00+00', 'K-Pop','Room 301', 1, 5, 1, 5);

-- Pricing Scheme
INSERT INTO pricing_scheme (lesson_type, lesson_level, price, sibling_discount, start_time, end_time)
VALUES
    ('solo', 1, 249.99, 25, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00'),
    ('solo', 2, 299.99, 25, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00'),
    ('solo', 3, 349.99, 25, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00'),
    ('group', 1, 249.99, 25, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00'),
    ('group', 2, 299.99, 25, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00'),
    ('group', 3, 349.99, 25, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00'),
    ('ensemble', 1, 249.99, 25, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00'),
    ('ensemble', 2, 299.99, 25, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00'),
    ('ensemble', 3, 349.99, 25, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00');

-- Rental Price Scheme
INSERT INTO rental_price_scheme (monthly_cost, start_time, end_time)
VALUES
    (99.99, '2020-01-01 00:00:00+00', '2020-12-31 23:59:59+00'),
    (120.00, '2021-01-01 00:00:00+00', '2021-12-31 23:59:59+00'),
    (149.99, '2022-01-01 00:00:00+00', '2022-12-31 23:59:59+00'),
    (199.99, '2023-01-01 00:00:00+00', '2023-12-31 23:59:59+00'),
    (249.99, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00');

-- Students
INSERT INTO student (ssn, name, mail, gender, enrollment_date, phone_number)
VALUES
    ('123-45-6789', 'Michael Brown', 'michaelb@email.com', 'Male', '2024-11-01 10:00:00+00', '123-456-7890'),
    ('987-65-4321', 'Sophia Green', 'sophiagreen@email.com', 'Female', '2024-11-01 10:00:00+00', '987-654-3210'),
    ('555-55-5555', 'David White', 'davidwhite@email.com', 'Male', '2024-11-02 10:00:00+00', '555-555-5555'),
    ('111-22-3333', 'Olivia Blue', 'oliviablue@email.com', 'Female', '2024-11-02 10:00:00+00', '111-222-3333'),
    ('444-55-6666', 'Ethan Black', 'ethanblack@email.com', 'Male', '2024-11-03 10:00:00+00', '444-555-6666');

-- Student contact persons
INSERT INTO contact_person (student_id, name, mail, phone_number)
VALUES
    (1, 'Michael Bigsby', 'michaelb@email.com', '123-456-7890'),
    (2, 'Sophie Rotterdam', 'sophiagreen@email.com', '987-654-3210'),
    (3, 'David Quick', 'davidwhite@email.com', '555-555-5555'),
    (4, 'Oliver Twist', 'oliviablue@email.com', '111-222-3333'),
    (5, 'Huckleberry Finn', 'ethanblack@email.com', '444-555-6666');

-- Student Addresses
INSERT INTO student_address (student_id, address_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Student Lessons
INSERT INTO student_lesson (lesson_id, student_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Student ensemble
INSERT INTO student_ensemble (ensemble_id, student_id)
VALUES
    (1, 5),
    (2, 4),
    (3, 3),
    (4, 2),
    (5, 1);

-- Student Siblings
INSERT INTO student_siblings (student_id_1, student_id_2)
VALUES
    (1, 2),
    (3, 4);

-- Instruments
INSERT INTO instrument (type, brand, name)
VALUES
    ('Guitar', 'Fender', 'Stratocaster'),
    ('Piano', 'Yamaha', 'U1'),
    ('Drums', 'Pearl', 'Masters'),
    ('Violin', 'Stradivarius', 'Model 1710'),
    ('Flute', 'Gemeinhardt', 'Model 3SHB');

-- Lesson Fees (with payment_date if already paid)
INSERT INTO lesson_fee (lesson_id, student_id, pricing_scheme_id, payment_date)
VALUES
    (1, 1, 1, '2024-11-15 10:00:00+00'),
    (2, 2, 1, '2024-11-15 10:00:00+00'),
    (3, 3, 1, NULL),
    (4, 4, 1, '2024-11-15 10:00:00+00'),
    (5, 5, 1, '2024-11-15 10:00:00+00');

-- Ensemble Fees (with payment_date if already paid)
INSERT INTO ensemble_fee (ensemble_id, student_id, pricing_scheme_id, payment_date)
VALUES
    (1, 1, 1, '2024-11-15 10:00:00+00'),
    (2, 2, 1, '2024-11-15 10:00:00+00'),
    (3, 3, 1, '2024-11-15 10:00:00+00'),
    (4, 4, 1, NULL),
    (5, 5, 1, '2024-11-15 10:00:00+00');

--Instrument rentals
INSERT INTO student_instrument_rental(student_id, instrument_id, rental_price_scheme_id, rental_start_time, rental_end_time)
VALUES
    (1, 1, 1, '2024-11-15 10:00:00+00', NULL), -- Ongoing rental
    (2, 1, 1, '2024-11-15 10:00:00+00', '2024-12-15 10:00:00+00'), -- Finished rental
    (3, 2, 1, '2024-11-01 08:30:00+00', '2024-11-15 08:30:00+00'), -- Short rental
    (4, 3, 1, '2024-10-15 09:00:00+00', NULL), -- Long-term ongoing
    (5, 4, 1, '2024-11-20 10:00:00+00', '2024-12-20 10:00:00+00'); -- Scheduled rental


-- Rental Payments
INSERT INTO rental_payment (payment_date, student_instrument_rental_id)
VALUES
    ('2024-11-10 10:00:00+00', 2),
    ('2024-11-11 10:00:00+00', 3),
    ('2024-11-12 10:00:00+00', 5);

-- Instructor Instruments
INSERT INTO instructor_instrument (instructor_id, instrument_id, teaching_level)
VALUES
    (1,1,2),
    (2,1,1),
    (2,2,3),
    (2,4,2),
    (3,1,3);