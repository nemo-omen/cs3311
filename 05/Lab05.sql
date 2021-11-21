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
  (6, 2, 2020, 89.4),
  (6, 4, 2020, 94.2),
  (6, 1, 2020, 91.5),
  (1, 3, 2018, 89.4),
  (2, 3, 2018, 92.5),
  (1, 2, 2018, 75.7),
  (2, 2, 2018, 98.7);

-- will return 3 given the above records
SELECT COUNT(*) FROM `Grading` WHERE CID = '1' AND Year = '2020';

-- will return 91 given the records above
SELECT AVG(Grade) FROM `Grading` WHERE CID = '1' AND Year = '2020';

-- will return 91.87999877929687
SELECT AVG(Grade) FROM `Grading` WHERE CID = '1' AND Year = '2020' OR Year = '2010';

-- will return 3
SELECT COUNT(*) FROM `Grading` WHERE StID = '6';

-- will return 89.07499885559082
SELECT AVG(Grade) FROM Grading WHERE Year = '2018';