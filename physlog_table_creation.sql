CREATE TABLE address (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    street VARCHAR(500) NOT NULL,
    zip VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

ALTER TABLE address ADD CONSTRAINT PK_address PRIMARY KEY (id);


CREATE TABLE instructor (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    ssn VARCHAR(12) NOT NULL,
    name VARCHAR(500) NOT NULL,
    mail VARCHAR(320),
    gender VARCHAR(100) NOT NULL,
    can_teach_ensembles BOOLEAN DEFAULT FALSE NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instructor_address (
    instructor_id INT NOT NULL,
    address_id INT NOT NULL
);

ALTER TABLE instructor_address ADD CONSTRAINT PK_instructor_address PRIMARY KEY (instructor_id,address_id);
ALTER TABLE instructor_address ADD CONSTRAINT FK_instructor_address_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;
ALTER TABLE instructor_address ADD CONSTRAINT FK_instructor_address_1 FOREIGN KEY (address_id) REFERENCES address (id) ON DELETE CASCADE;


CREATE TABLE instructor_availability (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE NOT NULL,
    instructor_id INT NOT NULL
);

ALTER TABLE instructor_availability ADD CONSTRAINT PK_instructor_availability PRIMARY KEY (id);
ALTER TABLE instructor_availability ADD CONSTRAINT FK_instructor_availability_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;


CREATE TABLE lesson (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    instrument_type VARCHAR(25),
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE NOT NULL,
    locale VARCHAR(50),
    min_num_of_students INT NOT NULL,
    max_num_of_students INT NOT NULL,
    lvl INT NOT NULL,
    instructor_id INT
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE SET NULL; --we dont want to lose the lesson record just because the teacher got deleted

CREATE TABLE ensemble (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE NOT NULL,
    genre VARCHAR(50),
    locale VARCHAR(50),
    min_num_of_students INT NOT NULL,
    max_num_of_students INT NOT NULL,
    lvl INT NOT NULL,
    instructor_id INT
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE SET NULL; --we dont want to lose the lesson record just because the teacher got deleted


CREATE TABLE pricing_scheme (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    lesson_type VARCHAR(50) NOT NULL,
    lesson_level INT NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    sibling_discount NUMERIC(10,2),--defines how big the student discount is for this pricing scheme. can be null. 
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE
);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (id);


CREATE TABLE rental_price_scheme (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    monthly_cost NUMERIC(10,2) NOT NULL,
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE
);

ALTER TABLE rental_price_scheme ADD CONSTRAINT PK_rental_price_scheme PRIMARY KEY (id);


CREATE TABLE student (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    ssn VARCHAR(12) NOT NULL,
    name VARCHAR(500) NOT NULL,
    mail VARCHAR(320),
    gender VARCHAR(100) NOT NULL,
    enrollment_date TIMESTAMP WITH TIME ZONE NOT NULL,
    phone_number VARCHAR(20)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);

CREATE TABLE contact_person (
    student_id INT NOT NULL,
    name VARCHAR(500) NOT NULL,
    mail VARCHAR(320),
    phone_number VARCHAR(20)
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (student_id);
ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;

CREATE TABLE student_address (
    student_id INT NOT NULL,
    address_id INT NOT NULL
);

ALTER TABLE student_address ADD CONSTRAINT PK_student_address PRIMARY KEY (student_id,address_id);
ALTER TABLE student_address ADD CONSTRAINT FK_student_address_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;
ALTER TABLE student_address ADD CONSTRAINT FK_student_address_1 FOREIGN KEY (address_id) REFERENCES address (id) ON DELETE CASCADE;


CREATE TABLE student_lesson (
    lesson_id INT NOT NULL,
    student_id INT NOT NULL
);

ALTER TABLE student_lesson ADD CONSTRAINT PK_student_lesson PRIMARY KEY (lesson_id,student_id);
ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id) ON DELETE CASCADE;
ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;

CREATE TABLE student_ensemble (
    ensemble_id INT NOT NULL,
    student_id INT NOT NULL
);

ALTER TABLE student_ensemble ADD CONSTRAINT PK_student_ensemble PRIMARY KEY (ensemble_id,student_id);
ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_0 FOREIGN KEY (ensemble_id) REFERENCES ensemble (id) ON DELETE CASCADE;
ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_1 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;


CREATE TABLE student_siblings (
    student_id_1 INT NOT NULL,
    student_id_2 INT NOT NULL
);

ALTER TABLE student_siblings ADD CONSTRAINT PK_student_siblings PRIMARY KEY (student_id_1,student_id_2);
ALTER TABLE student_siblings ADD CONSTRAINT FK_student_siblings_0 FOREIGN KEY (student_id_1) REFERENCES student (id) ON DELETE CASCADE;
ALTER TABLE student_siblings ADD CONSTRAINT FK_student_siblings_1 FOREIGN KEY (student_id_2) REFERENCES student (id) ON DELETE CASCADE;


CREATE TABLE instrument (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    type VARCHAR(25) NOT NULL,
    brand VARCHAR(25),
    name VARCHAR(50) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);
ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE SET NULL;-- instrument should not be deleted just because current renter got deleted


CREATE TABLE lesson_fee (
    lesson_id INT NOT NULL,
    student_id INT NOT NULL,
    pricing_scheme_id INT NOT NULL,
    payment_date TIMESTAMP WITH TIME ZONE -- can be null. if null -> we havent paid yet. otherwise, payment has been made.
);

ALTER TABLE lesson_fee ADD CONSTRAINT PK_lesson_fee PRIMARY KEY (lesson_id,student_id,pricing_scheme_id);
ALTER TABLE lesson_fee ADD CONSTRAINT FK_lesson_fee_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id) ON DELETE SET NULL;--not sure with these.. setting null makes the financial record useless, but
ALTER TABLE lesson_fee ADD CONSTRAINT FK_lesson_fee_1 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE SET NULL;--no action wouldnt be helpful either, and cascade deleting will make us lose 
ALTER TABLE lesson_fee ADD CONSTRAINT FK_lesson_fee_2 FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_scheme (id) ON DELETE SET NULL;--potentially vital billing records.

CREATE TABLE ensemble_fee (
    ensemble_id INT NOT NULL,
    student_id INT NOT NULL,
    pricing_scheme_id INT NOT NULL,
    payment_date TIMESTAMP WITH TIME ZONE -- can be null. if null -> we havent paid yet. otherwise, payment has been made.
);

ALTER TABLE ensemble_fee ADD CONSTRAINT PK_ensemble_fee PRIMARY KEY (ensemble_id,student_id,pricing_scheme_id);
ALTER TABLE ensemble_fee ADD CONSTRAINT FK_ensemble_fee_0 FOREIGN KEY (ensemble_id) REFERENCES ensemble (id) ON DELETE SET NULL;--not sure with these.. setting null makes the financial record useless, but
ALTER TABLE ensemble_fee ADD CONSTRAINT FK_ensemble_fee_1 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE SET NULL;--no action wouldnt be helpful either, and cascade deleting will make us lose 
ALTER TABLE ensemble_fee ADD CONSTRAINT FK_ensemble_fee_2 FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_scheme (id) ON DELETE SET NULL;--potentially vital billing records.

CREATE TABLE student_instrument_rental(
    id INT GENERATED ALWAYS AS IDENTITY,
    student_id INT NOT NULL,
    instrument_id, INT NOT NULL,
    rental_price_scheme_id INT NOT NULL,
    rental_start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    rental_end_time TIMESTAMP WITH TIME ZONE
)

ALTER TABLE student_instrument_rental ADD CONSTRAINT PK_student_instrument_rental PRIMARY KEY (id);
ALTER TABLE student_instrument_rental ADD CONSTRAINT FK_student_instrument_rental_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE SET NULL;--not sure with these.. setting null makes the financial record useless, but
ALTER TABLE student_instrument_rental ADD CONSTRAINT FK_student_instrument_rental_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id) ON DELETE SET NULL;--no action wouldnt be helpful either, and cascade deleting will make us lose 
ALTER TABLE student_instrument_rental ADD CONSTRAINT FK_student_instrument_rental_2 FOREIGN KEY (rental_price_scheme_id) REFERENCES rental_price_scheme (id) ON DELETE SET NULL;--potentially vital billing records.



CREATE TABLE rental_payment (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    student_instrument_rental_id INT NOT NULL,
    payment_date TIMESTAMP WITH TIME ZONE-- can be null. if null -> we havent paid yet. otherwise, payment has been made.
);

ALTER TABLE rental_payment ADD CONSTRAINT PK_rental_payment PRIMARY KEY (id);
ALTER TABLE rental_payment ADD CONSTRAINT FK_rental_payment_0 FOREIGN KEY (student_instrument_rental_id) REFERENCES student_instrument_rental (id) ON DELETE SET NULL;


CREATE TABLE instructor_instrument (
    instructor_id INT NOT NULL,
    instrument_id INT NOT NULL,
    teaching_level INT NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instructor_id,instrument_id);
ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;
ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id) ON DELETE CASCADE;
