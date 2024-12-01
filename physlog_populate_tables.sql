-- Dummy Data Generation Script

-- Addresses
INSERT INTO address (street, zip, city, country)
VALUES
    ('123 Oak St', '90210', 'Beverly Hills', 'USA'),
    ('456 Maple Ave', '10001', 'New York', 'USA'),
    ('789 Pine Ln', '30301', 'Atlanta', 'USA'),
    ('101 Birch Rd', '90001', 'Los Angeles', 'USA'),
    ('202 Cedar Blvd', '60601', 'Chicago', 'USA'),
    ('303 Elm St', '94105', 'San Francisco', 'USA'),
    ('404 Oak Ave', '33101', 'Miami', 'USA'),
    ('505 Birch Blvd', '60602', 'Chicago', 'USA'),
    ('606 Pine St', '80101', 'Denver', 'USA'),
    ('707 Maple Dr', '10002', 'New York', 'USA');

-- Instructors
INSERT INTO instructor (ssn, name, mail, gender, can_teach_ensembles, phone_number)
VALUES
    ('123-45-6789', 'John Doe', 'johndoe@email.com', 'Male', TRUE, '123-456-7890'),
    ('987-65-4321', 'Jane Smith', 'janesmith@email.com', 'Female', FALSE, '987-654-3210'),
    ('555-55-5555', 'Alice Johnson', 'alicejohnson@email.com', 'Female', TRUE, '555-555-5555'),
    ('111-22-3333', 'Bob Brown', 'bobbrown@email.com', 'Male', TRUE, '111-222-3333'),
    ('444-55-6666', 'Charlie Black', 'charlieblack@email.com', 'Male', FALSE, '444-555-6666'),
    ('777-88-9999', 'David Green', 'davidgreen@email.com', 'Male', TRUE, '777-888-9999'),
    ('888-99-0000', 'Emily White', 'emilywhite@email.com', 'Female', TRUE, '888-999-0000'),
    ('123-12-3456', 'Michael Blue', 'michaelblue@email.com', 'Male', FALSE, '123-555-1234'),
    ('432-11-6543', 'Sophia Red', 'sophiared@email.com', 'Female', TRUE, '432-654-9876'),
    ('987-21-8765', 'Oliver Black', 'oliverblack@email.com', 'Male', TRUE, '987-654-3211');

-- Instructor Addresses
INSERT INTO instructor_address (instructor_id, address_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Instructor Availability
INSERT INTO instructor_availability (start_time, end_time, instructor_id)
VALUES
    ('2024-12-02 09:00:00+00', '2024-12-02 12:00:00+00', 1),
    ('2024-12-02 13:00:00+00', '2024-12-02 16:00:00+00', 2),
    ('2024-12-03 08:00:00+00', '2024-12-03 11:00:00+00', 3),
    ('2024-12-04 10:00:00+00', '2024-12-04 13:00:00+00', 4),
    ('2024-12-05 14:00:00+00', '2024-12-05 17:00:00+00', 5),
    ('2024-12-06 09:00:00+00', '2024-12-06 12:00:00+00', 6),
    ('2024-12-02 15:00:00+00', '2024-12-02 18:00:00+00', 7),
    ('2024-12-03 10:00:00+00', '2024-12-03 13:00:00+00', 8),
    ('2024-12-04 12:00:00+00', '2024-12-04 15:00:00+00', 9),
    ('2024-12-05 09:00:00+00', '2024-12-05 12:00:00+00', 10);

-- Lessons
INSERT INTO lesson (instrument_type, start_time, end_time, locale, min_num_of_students, max_num_of_students, lvl, instructor_id)
VALUES
    ('Guitar', '2024-12-02 10:00:00+00', '2024-12-02 12:00:00+00', 'Room 104', 1, 1, 1, 1),
    ('Piano', '2024-12-02 13:00:00+00', '2024-12-02 15:00:00+00', 'Room 230', 1, 1, 2, 2),
    ('Drums', '2024-12-03 09:00:00+00', '2024-12-03 11:00:00+00', 'Aula Magna', 2, 3, 3, 3),
    ('Violin', '2024-12-04 16:00:00+00', '2024-12-04 18:00:00+00', 'Cantina', 2, 4, 2, 2),
    ('Flute', '2024-12-05 18:00:00+00', '2024-12-05 20:00:00+00', 'Room 301', 2, 5, 1, 4),
    ('Guitar', '2024-12-03 10:00:00+00', '2024-12-03 12:00:00+00', 'Room 104', 1, 1, 1, 1),
    ('Piano', '2024-12-04 13:00:00+00', '2024-12-04 15:00:00+00', 'Room 230', 1, 1, 2, 5),
    ('Drums', '2024-12-05 09:00:00+00', '2024-12-05 11:00:00+00', 'Aula Magna', 2, 3, 3, 6),
    ('Violin', '2024-12-06 16:00:00+00', '2024-12-06 18:00:00+00', 'Cantina', 2, 4, 2, 7),
    ('Flute', '2024-12-06 18:00:00+00', '2024-12-06 20:00:00+00', 'Room 301', 2, 5, 1, 9);

-- Ensembles
INSERT INTO ensemble (start_time, end_time, genre, locale, min_num_of_students, max_num_of_students, lvl, instructor_id)
VALUES
    ('2024-12-02 10:00:00+00', '2024-12-02 12:00:00+00', 'Rock','Room 104', 1, 5, 1, 1),
    ('2024-12-02 13:00:00+00', '2024-12-02 15:00:00+00', 'Classical','Room 230', 1, 3, 2, 2),
    ('2024-12-03 09:00:00+00', '2024-12-03 11:00:00+00', 'Jazz','Aula Magna', 2, 6, 3, 3),
    ('2024-12-04 16:00:00+00', '2024-12-04 18:00:00+00', 'Hip-hop','Cantina', 1, 4, 2, 4),
    ('2024-12-05 18:00:00+00', '2024-12-05 20:00:00+00', 'K-Pop','Room 301', 1, 5, 1, 5),
    ('2024-12-03 10:00:00+00', '2024-12-03 12:00:00+00', 'Rock','Room 104', 1, 5, 1, 1),
    ('2024-12-04 13:00:00+00', '2024-12-04 15:00:00+00', 'Classical','Room 230', 1, 3, 2, 2),
    ('2024-12-05 09:00:00+00', '2024-12-05 11:00:00+00', 'Jazz','Aula Magna', 2, 6, 3, 3),
    ('2024-12-06 16:00:00+00', '2024-12-06 18:00:00+00', 'Hip-hop','Cantina', 1, 4, 2, 4),
    ('2024-12-06 18:00:00+00', '2024-12-06 20:00:00+00', 'K-Pop','Room 301', 1, 5, 1, 5);

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
    ('123-45-6789', 'Sophia Green', 'sophiagreen@email.com', 'Female', '2024-11-01 10:00:00+00', '123-456-7890'),
    ('987-65-4321', 'Jackson White', 'jacksonwhite@email.com', 'Male', '2024-11-02 10:00:00+00', '987-654-3210'),
    ('555-55-5555', 'Olivia Blue', 'oliviablue@email.com', 'Female', '2024-11-03 10:00:00+00', '555-555-5555'),
    ('111-22-3333', 'Lucas Brown', 'lucasbrown@email.com', 'Male', '2024-11-04 10:00:00+00', '111-222-3333'),
    ('444-55-6666', 'Liam Yellow', 'liamyellow@email.com', 'Male', '2024-11-05 10:00:00+00', '444-555-6666'),
    ('777-88-9999', 'Emma Red', 'emmasred@email.com', 'Female', '2024-11-06 10:00:00+00', '777-888-9999'),
    ('888-99-0000', 'Isabella Black', 'isabellablack@email.com', 'Female', '2024-11-07 10:00:00+00', '888-999-0000'),
    ('123-12-3456', 'James White', 'jameswhite@email.com', 'Male', '2024-11-08 10:00:00+00', '123-555-1234'),
    ('432-11-6543', 'Mason Gray', 'masongray@email.com', 'Male', '2024-11-09 10:00:00+00', '432-654-9876'),
    ('987-21-8765', 'Amelia Orange', 'ameliaorange@email.com', 'Female', '2024-11-10 10:00:00+00', '987-654-3211');

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
    (1, 3),
    (2, 4),
    (2, 5),
    (3, 6),
    (3, 7),
    (4, 5),
    (4, 8),
    (5, 6),
    (6, 9),
    (7, 8),
    (7, 10),
    (8, 9),
    (9, 10),
    (1, 4),
    (2, 6),
    (3, 8),
    (4, 7),
    (5, 9),
    (6, 10);

-- Instruments
INSERT INTO instrument (type, brand, name)
VALUES
    ('Guitar', 'Fender', 'Stratocaster'),
    ('Piano', 'Yamaha', 'U1'),
    ('Drums', 'Pearl', 'Masters'),
    ('Violin', 'Stradivarius', 'Model 1710'),
    ('Flute', 'Gemeinhardt', 'Model 3SHB'),
    ('Guitar', 'Gibson', 'Les Paul'),
    ('Piano', 'Kawai', 'K-300'),
    ('Drums', 'Ludwig', 'Classic Maple'),
    ('Violin', 'Guarneri', 'Del Gesù'),
    ('Flute', 'Muramatsu', 'EX'),
    ('Saxophone', 'Selmer', 'Series III'),
    ('Trumpet', 'Bach', 'Stradivarius'),
    ('Clarinet', 'Buffet', 'E11'),
    ('Trombone', 'Yamaha', 'YSL-354'),
    ('Cello', 'Bohemian', 'Model C200'),
    ('Bass Guitar', 'Ibanez', 'SR305'),
    ('Drums', 'Tama', 'Starclassic'),
    ('Piano', 'Steinway', 'Model D'),
    ('Electric Guitar', 'PRS', 'Custom 24');

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
INSERT INTO instructor_instrument (instructor_id, instrument_type, teaching_level)
VALUES
    (1, 'Guitar', 2), -- Instructor 1, Guitar (Stratocaster), Level 2
    (2, 'Guitar', 1), -- Instructor 2, Guitar (Stratocaster), Level 1
    (2, 'Piano', 3), -- Instructor 2, Piano (U1), Level 3
    (2, 'Violin', 2), -- Instructor 2, Violin (Model 1710), Level 2
    (3, 'Guitar', 3), -- Instructor 3, Guitar (Stratocaster), Level 3
    (4, 'Flute', 1), -- Instructor 4, Flute (Model 3SHB), Level 1
    (5, 'Piano', 2), -- Instructor 5, Piano (K-300), Level 2
    (1, 'Drums', 3), -- Instructor 1, Drums (Masters), Level 3
    (3, 'Guitar', 2), -- Instructor 3, Guitar (Les Paul), Level 2
    (4, 'Violin', 1), -- Instructor 4, Violin (Del Gesù), Level 1
    (2, 'Drums', 3), -- Instructor 2, Drums (Classic Maple), Level 3
    (1, 'Flute', 2), -- Instructor 1, Flute (EX), Level 2
    (5, 'Trumpet', 3), -- Instructor 5, Trumpet (Stradivarius), Level 3
    (4, 'Clarinet', 2), -- Instructor 4, Clarinet (E11), Level 2
    (3, 'Trombone', 1), -- Instructor 3, Trombone (YSL-354), Level 1
    (2, 'Cello', 3), -- Instructor 2, Cello (Model C200), Level 3
    (1, 'Bass guitar', 2), -- Instructor 1, Bass Guitar (SR305), Level 2
    (5, 'Electric  guitar', 1); -- Instructor 5, Electric Guitar (Custom 24), Level 1