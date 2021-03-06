CREATE DATABASE IF NOT EXISTS `lab05`;

USE `lab05`;

-- Create Student table
CREATE TABLE IF NOT EXISTS `Student`(
  StID int(11) PRIMARY KEY AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Department varchar(255) NOT NULL
);

-- Create Course Table
CREATE TABLE IF NOT EXISTS `Course`(
  CID int(11) PRIMARY KEY AUTO_INCREMENT,
  CName varchar(255) NOT NULL,
  Credit int(11) NOT NULL
);

-- Create Grading table
CREATE TABLE IF NOT EXISTS `Grading`(
  StID int(11) NOT NULL,
  CID int(11) NOT NULL,
  Year YEAR NOT NULL,
  Grade float,
  FOREIGN KEY (StID) REFERENCES Student(StID),
  FOREIGN KEY (CID) REFERENCES Course(CID)
);

-- insert students
INSERT INTO 
  `Student` (Name, Department)
VALUES
  ('Yuki Shimizo', 'Fine Art'),
  ('James Mealey', 'Mathematics'),
  ('Lauren Figenbaum', 'Biology'),
  ('Rami Malek', 'Computer Science'),
  ('Ada Lovelace', 'Computer Science'),
  ('John', 'Engineering');

-- insert courses
INSERT INTO
  `Course` (CName, Credit)
VALUES
  ('CENG356', 3),
  ('COSC223', 3),
  ('BIOL323', 4),
  ('MATH258', 3);

-- insert grade information
INSERT INTO
  `Grading` (StID, CID, Year, Grade)
VALUES
  (1, 1, 2000, 94.5),
  (2, 1, 2010, 89.2),
  (3, 1, 2020, 90.3),
  (1, 2, 2000, 88.7),
  (4, 2, 2020, 98.9),
  (5, 1, 2010, 97.2),
  (4, 1, 2020, 91.2),
  (6, 2, 2018, 89.4),
  (6, 4, 2018, 94.2),
  (6, 1, 2018, 91.5),
  (1, 3, 2018, 89.4),
  (2, 3, 2018, 92.5),
  (1, 2, 2018, 75.7);

-- will return 3 given the above records
SELECT COUNT(*) FROM `Grading` WHERE CID = '1' AND Year = '2020';

-- will return 91 given the records above
SELECT AVG(Grade) FROM `Grading` WHERE CID = '1' AND Year = '2020';

-- Student with Name='John' took 3
SELECT Grading.CID, Grading.Year, Student.name
  FROM `Grading`
  INNER JOIN `Student` ON Grading.StID=Student.StID
  AND Student.Name='John' AND Grading.Year='2018';

-- Will return each course, grouped by Course.CName
-- along with the average grade for that course
SELECT Course.CName, Avg(Grading.Grade)
  FROM `Course`
    INNER JOIN Grading
      ON Grading.CID=Course.CID
  GROUP BY Course.CName;