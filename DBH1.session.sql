-- @block
SHOW DATABASES;

-- @block delete the student table
DROP TABLE IF EXISTS student;
-- @block
CREATE TABLE Student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    height FLOAT, 
    averageGrade FLOAT
);

-- @block 
INSERT INTO Student (email, height, averageGrade)
VALUES (
    'Anders@edu.com',
    177.5,
    5.4
);

-- @block 
INSERT INTO Student (email, height, averageGrade)
VALUES ('Karsten@edu.com', 180.3, 9.6),
       ('Trine@edu.com', 167.5, 11),
       ('Signe@edu.com', 163, 3.4);


-- @block
SELECT * FROM student;

-- @block
SELECT email, id FROM student
LIMIT 2;

-- @block
SELECT email, id FROM student
ORDER BY id DESC
LIMIT 2;

-- @block
SELECT email, id FROM student

WHERE height > 170

ORDER BY id DESC
LIMIT 2;

-- @block
SELECT email, id FROM student

WHERE height > 170 and averageGrade > 7

ORDER BY id DESC
LIMIT 2;

-- @block
SELECT email, id FROM student

WHERE height > 170 or averageGrade > 7

ORDER BY id DESC
LIMIT 2;

-- @block Vi laver et index på vores email
CREATE INDEX email_index ON student(email)

