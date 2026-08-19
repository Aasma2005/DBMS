
CREATE DATABASE aikonix_task1;
USE aikonix_task1;
SHOW DATABASES;
USE aikonix_task1;
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT,
    course VARCHAR(50),
    city VARCHAR(50),
    marks DECIMAL(5,2)
);
DESCRIBE students;
INSERT INTO students (name, email, age, course, city, marks)
VALUES
('Aisha Khan', 'aisha@gmail.com', 22, 'Computer Science', 'Pune', 85.50),
('Rahul Sharma', 'rahul@gmail.com', 23, 'Information Technology', 'Mumbai', 78.00),
('Sneha Patil', 'sneha@gmail.com', 21, 'Electronics', 'Pune', 91.00),
('Arjun Mehta', 'arjun@gmail.com', 24, 'Computer Science', 'Nashik', 69.50),
('Priya Shah', 'priya@gmail.com', 22, 'Information Technology', 'Pune', 88.00);
SELECT * FROM students;

SELECT student_id, name, marks
FROM students
WHERE name = 'Rahul Sharma';

SELECT * FROM students
WHERE student_id = 2;

SELECT student_id, name
FROM students;

DELETE FROM students
WHERE student_id = 4;

SELECT * FROM students;

SELECT *
FROM students
WHERE city = 'Pune';

SELECT *
FROM students
ORDER BY marks DESC;

SELECT *
FROM students
ORDER BY marks DESC
LIMIT 2;

SELECT student_id, name, course, city, marks
FROM students
WHERE marks >= 80
ORDER BY marks DESC
LIMIT 3;


/*COUNT*/
SELECT COUNT(*) AS total_students
FROM students;

/*SUM*/
SELECT SUM(marks) AS total_marks
FROM students;

/*AVG*/
SELECT AVG(marks) AS average_marks
FROM students;

SELECT
    COUNT(*) AS total_students,
    SUM(marks) AS total_marks,
    AVG(marks) AS average_marks
FROM students;

/*GROUP BY*/
SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city;

SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course;

SELECT course, AVG(marks) AS average_marks
FROM students
GROUP BY course;

/*HAVING*/
SELECT course, AVG(marks) AS average_marks
FROM students
GROUP BY course
HAVING AVG(marks) > 80;

/*JOIN*/
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    duration_years INT NOT NULL
);
INSERT INTO courses (course_name, duration_years)
VALUES
('Computer Science', 4),
('Information Technology', 4),
('Electronics', 4);
SELECT * FROM courses;



CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO enrollments (student_id, course_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(5, 2);
SELECT * FROM courses;
SELECT * FROM enrollments;

/*INNER JOIN*/
SELECT
    s.student_id,
    s.name,
    c.course_name
FROM students s
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN courses c
    ON e.course_id = c.course_id;
    
/*LEFT JOIN*/
SELECT
    s.student_id,
    s.name,
    c.course_name
FROM students s
LEFT JOIN enrollments e
    ON s.student_id = e.student_id
LEFT JOIN courses c
    ON e.course_id = c.course_id; 

/*Right join*/
SELECT 
    s.name, c.course_name
FROM
    students s
        RIGHT JOIN
    enrollments e ON s.student_id = e.student_id
        RIGHT JOIN
    courses c ON e.course_id = c.course_id;

/*VIEW*/
CREATE VIEW student_course_view AS
SELECT
    s.student_id,
    s.name,
    s.city,
    s.marks,
    c.course_name
FROM students s
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN courses c
    ON e.course_id = c.course_id;
    
SELECT * FROM student_course_view;

SELECT *
FROM student_course_view
WHERE marks >= 80;

SHOW CREATE TABLE enrollments;
SHOW TABLES;