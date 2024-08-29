-- Student Database MAnagement System
CREATE DATABASE student_database
;
use student_database;
CREATE TABLE student_table (
    Student_id SERIAL PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    Email_id TEXT,
    Phone_no TEXT,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))
);


INSERT INTO student_table (Stu_name, Department, Email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
('Emma Sanchez', 'Business Administration', 'esanchez@example.com', '987-654-3210', '123 Oak St, Anytown USA', '1994-09-15', 'Female', 'Marketing', 3, 'B'),
('Jacob Hernandez', 'Civil Engineering', 'jhernandez@example.com', '555-123-4567', '456 Elm Ave, Anytown USA', '1997-03-22', 'Male', 'Structural Engineering', 4, 'A'),
('Ava Diaz', 'Psychology', 'adiaz@example.com', '111-222-3333', '789 Pine Rd, Anytown USA', '1995-06-08', 'Female', 'Clinical Psychology', 4, 'A'),
('William Morales', 'Computer Science', 'wmorales@example.com', '888-999-0000', '321 Maple St, Anytown USA', '1992-11-30', 'Male', 'Software Engineering', 3, 'A'),
('Olivia Sanchez', 'Nursing', 'osanchez@example.com', '222-333-4444', '159 Cedar Ln, Anytown USA', '1996-04-18', 'Female', 'Pediatric Nursing', 5, 'A'),
('David Ramirez', 'Electrical Engineering', 'dramirez@example.com', '444-555-6666', '753 Birch Ave, Anytown USA', '1998-01-05', 'Male', 'Power Systems', 4, 'B'),
('Sophia Vargas', 'Biology', 'svargas@example.com', '777-888-9999', '951 Oak Rd, Anytown USA', '1994-07-27', 'Female', 'Microbiology', 2, 'A'),
('Ethan Gomez', 'Mechanical Engineering', 'egomez@example.com', '333-444-5555', '852 Walnut St, Anytown USA', '1993-02-12', 'Male', 'Robotics', 3, 'B'),
('Isabella Reyes', 'Business Administration', 'ireyes@example.com', '666-777-8888', '159 Pine Ln, Anytown USA', '1995-10-03', 'Female', 'Finance', 2, 'B'),
('Jacob Castillo', 'Computer Science', 'jcastillo@example.com', '999-000-1111', '369 Elm Ave, Anytown USA', '1997-05-14', 'Male', 'Cybersecurity', 4, 'A');


SELECT * FROM student_table ORDER BY Grade DESC;
SELECT * FROM student_table WHERE Gender = 'Male';
SELECT * FROM student_table WHERE GPA < 5.0;
UPDATE student_table
SET Email_id = 'newemail@example.com', Grade = 'A'
WHERE Student_id = 1; 

SELECT Stu_name, TIMESTAMPDIFF(YEAR, Date_of_birth, CURDATE()) AS Age
FROM student_table
WHERE Grade = 'B'
LIMIT 0, 1000;

SELECT Department, Gender, AVG(GPA) AS Average_GPA
FROM student_table
GROUP BY Department, Gender;

ALTER TABLE student_table RENAME TO student_info;

SELECT Stu_name FROM student_info
ORDER BY GPA DESC
LIMIT 1;



