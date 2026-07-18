SQL
-- ====================================================================
-- PROJECT: School Administration Database Setup
-- Objective: Build a relational schema for tracking students and teachers,
-- ensuring strict data integrity with appropriate constraints.
-- ====================================================================

-- 1. Table Creation Architecture

CREATE TABLE students(
student_id SERIAL PRIMARY KEY,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
homeroom_number INTEGER,
phone VARCHAR (20) UNIQUE NOT NULL,
email VARCHAR (115) UNIQUE,
grad_year INTEGER
);

CREATE TABLE teachers(
teacher_id SERIAL PRIMARY KEY,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
homeroom_number INTEGER,
department VARCHAR (50),
email VARCHAR (20) UNIQUE,
phone VARCHAR (20) UNIQUE
);

-- 2. Data Insertion & Constraint Testing

INSERT INTO students
(first_name, last_name, phone, grad_year, homeroom_number)
VALUES
('Mark','Watney','777-555-1234',2035,5);


INSERT INTO teachers
(first_name, last_name, homeroom_number, department, phone, email)
VALUES
('Jonas','Salk',5,'Biology', '777-555-4321', 'jsalk@school.org');





