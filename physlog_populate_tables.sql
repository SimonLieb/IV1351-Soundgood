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
INSERT INTO lesson (instrument_type, start_time, end_time, genre, min_num_of_students, max_num_of_students, lvl, instructor_id)
VALUES
    ('Guitar', '2024-11-16 10:00:00+00', '2024-11-16 12:00:00+00', 'Rock', 1, 5, 1, 1),
    ('Piano', '2024-11-16 13:00:00+00', '2024-11-16 15:00:00+00', 'Classical', 1, 3, 2, 2),
    ('Drums', '2024-11-16 09:00:00+00', '2024-11-16 11:00:00+00', 'Jazz', 2, 6, 3, 3),
    ('Violin', '2024-11-16 16:00:00+00', '2024-11-16 18:00:00+00', 'Baroque', 1, 4, 2, 4),
    ('Flute', '2024-11-16 18:00:00+00', '2024-11-16 20:00:00+00', 'Folk', 1, 5, 1, 5);

-- Pricing Scheme
INSERT INTO pricing_scheme (beginner_solo_price, advanced_solo_price, beginner_group_price, advanced_group_price, beginner_ensemble_price, advanced_ensemble_price, sibling_discount, start_time, end_time, is_active)
VALUES
    (50.00, 80.00, 40.00, 70.00, 60.00, 90.00, 10.00, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00', TRUE);

-- Rental Price Scheme
INSERT INTO rental_price_scheme (monthly_cost, start_time, end_time, is_active)
VALUES
    (30.00, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00', TRUE);

-- Students
INSERT INTO student (ssn, name, mail, gender, contact_person_name, contact_person_phone_number, enrollment_date, phone_number)
VALUES
    ('123-45-6789', 'Michael Brown', 'michaelb@email.com', 'Male', 'Susan Brown', '987-654-3210', '2024-11-01 10:00:00+00', '123-456-7890'),
    ('987-65-4321', 'Sophia Green', 'sophiagreen@email.com', 'Female', 'Paul Green', '123-456-7890', '2024-11-01 10:00:00+00', '987-654-3210'),
    ('555-55-5555', 'David White', 'davidwhite@email.com', 'Male', 'Linda White', '555-555-5555', '2024-11-02 10:00:00+00', '555-555-5555'),
    ('111-22-3333', 'Olivia Blue', 'oliviablue@email.com', 'Female', 'James Blue', '111-222-3333', '2024-11-02 10:00:00+00', '111-222-3333'),
    ('444-55-6666', 'Ethan Black', 'ethanblack@email.com', 'Male', 'Emily Black', '444-555-6666', '2024-11-03 10:00:00+00', '444-555-6666');

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

-- Student Siblings
INSERT INTO student_siblings (student_id_1, student_id_2)
VALUES
    (1, 2),
    (3, 4);

-- Instruments
INSERT INTO instrument (type, brand, name, is_rented, rental_start_time, rental_end_time, student_id)
VALUES
    ('Guitar', 'Fender', 'Stratocaster', TRUE, '2024-01-01 00:00:00+00', '2024-12-31 23:59:59+00', 1),
    ('Piano', 'Yamaha', 'U1', FALSE, NULL, NULL, 2),
    ('Drums', 'Pearl', 'Masters', TRUE, '2024-05-01 00:00:00+00', '2024-11-30 23:59:59+00', 3),
    ('Violin', 'Stradivarius', 'Model 1710', FALSE, NULL, NULL, 4),
    ('Flute', 'Gemeinhardt', 'Model 3SHB', TRUE, '2024-06-01 00:00:00+00', '2024-12-31 23:59:59+00', 5);

-- Lesson Fees (with payment_date)
INSERT INTO lesson_fee (lesson_id, student_id, pricing_scheme_id, payment_date)
VALUES
    (1, 1, 1, '2024-11-15 10:00:00+00'),
    (2, 2, 1, '2024-11-15 10:00:00+00'),
    (3, 3, 1, '2024-11-15 10:00:00+00'),
    (4, 4, 1, '2024-11-15 10:00:00+00'),
    (5, 5, 1, '2024-11-15 10:00:00+00');

-- Rental Payments
INSERT INTO rental_payment (payment_date, instrument_id, student_id, rental_price_scheme_id)
VALUES
    ('2024-11-10 10:00:00+00', 1, 1, 1),
    ('2024-11-11 10:00:00+00', 2, 2, 1),
    ('2024-11-12 10:00:00+00', 3, 3, 1),
    ('2024-11-13 10:00:00+00', 4, 4, 1),
    ('2024-11-14 10:00:00+00', 5, 5, 1);

-- Instructor Instruments
INSERT INTO instructor_instrument (instructor_id, instrument_id, teaching_level)
VALUES
    (1,1,2),
    (2,1,1),
    (2,2,3),
    (2,4,2),
    (3,1,3);