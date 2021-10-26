CREATE DATABASE IF NOT EXISTS students;

USE students;

DROP TABLE IF EXISTS Student;

CREATE TABLE IF NOT EXISTS Student (
  StudentID int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Surname varchar(255) NOT NULL,
  Major varchar(255) NOT NULL,
  YearStarted YEAR NOT NULL
);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Jeff', 'Caldwell', 'Computer Science', 2019);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Lucy', 'Hernandez', 'Engineering', 2020);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Aleema', 'Parsa', 'Biology', 2018);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Moon', 'Cheong', 'Fine Art', 2019);

INSERT INTO Student (Name, Surname, Major, YearStarted)
VALUES ('Jordan', 'Wilkinson', 'Communications', 2021);

