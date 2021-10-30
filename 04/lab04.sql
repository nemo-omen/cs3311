-- Jeff Caldwell
-- CS 3311
-- Assignment 04

-- STUDENTS DATABASE --

-- To begin testing query statements, create the database
-- but only if it does not yet exist

CREATE DATABASE IF NOT EXISTS students;

USE students;

-- Drop Student table if it existed before starting so
-- we can work with a clean table
DROP TABLE IF EXISTS Student;

-- Now create the table (and check if it doesn't exist, just in case)
CREATE TABLE IF NOT EXISTS Student (
  StudentID int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Surname varchar(255) NOT NULL,
  Major varchar(255) NOT NULL,
  YearStarted YEAR NOT NULL
);

-- Start inserting all of the students
-- make sure at least one has a YearStarted
-- value that's less than 2010 & that
-- there are some Computer Engineering &
-- Engineering majors included
INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Marcus', 'Warlock', 'Computer Engineering', 2019);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Lucy', 'Hernandez', 'Engineering', 2020);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Aleema', 'Parsa', 'Computer Engineering', 2018);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Moon', 'Cheong', 'Fine Art', 2019);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Jordan', 'Wilkinson', 'Communications', 2017);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Mariam', 'Louis', 'Engineering', 2010);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Leonard', 'Gomez', 'Business', 2018);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Anette', 'Fukiyama', 'History', 2009);

-- select students who are majoring in Computer Engineering
-- and list them by Name and YearStarted 
SELECT Name, StudentID FROM Student WHERE Major = 'Computer Engineering';

-- update all students with a major LIKE Engineering and update
-- YearStarted to 2015
UPDATE Student SET YearStarted = 2015 WHERE Major LIKE '%Engineering';

-- List all students to verify
SELECT * FROM Student LIMIT 20;

-- Delete any student who has a YearStarted value < 2010
DELETE FROM Student WHERE YearStarted < 2010;

-- list all students again to verify results
SELECT * FROM Student LIMIT 20;

-- DROP the table (again, check IF EXISTS first)
DROP TABLE IF EXISTS Student;

-- Verify the table does not exist
SHOW TABLES;