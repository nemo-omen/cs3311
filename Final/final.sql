CREATE DATABASE final_exam
    DEFAULT CHARACTER SET = 'utf8mb4';


USE final_exam;
CREATE TABLE IF NOT EXISTS `Singer`(
    SingerID int PRIMARY KEY AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    Age int,
    City varchar(255)
);

CREATE TABLE IF NOT EXISTS `Album`(
    AlbumID int PRIMARY KEY AUTO_INCREMENT,
    AlbumName varchar(255) NOT NULL,
    SingerID int,
    year YEAR,
    FOREIGN KEY (SingerID) REFERENCES Singer(SingerID)
);

CREATE TABLE IF NOT EXISTS `Song`(
    AlbumID int NOT NULL,
    SongName varchar(255) NOT NULL,
    Genre varchar(255),
    FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID)
);

INSERT INTO
    `Singer`(Name, Age, City)
VALUES
    ('Yoko Kanno', 58, 'Sendai, Japan'),
    ('Andrew', 23, 'Cleveland, Ohio');

INSERT INTO
    `Album`(AlbumName, SingerID, year)
VALUES
    ('The Blobman Cometh', 2, 2020),
    ('Yoko Kanno produce Cyber Bicci', 1, 2011)
    ('The Scythes Ride at Midnight(ish)', 2, 2021);

INSERT INTO
    `Song`(AlbumID, SongName, Genre)
VALUES
    (1, 'Prelude', 'Classical'),
    (1, 'Etude', 'Classical'),
    (2, 'Something', 'Whatever'),
    (2, 'Another Thing', 'Yepyep'),
    (1, 'Cool Rain Etc', 'Jazz'),
    (1, 'Slithery Things and Whatnot', 'Jazz')
    (3, 'How Many Mics are we Talking About Here?', 'Jazz'),
    (3, 'Do You Even Understand a Single Thing?', 'Jazz'),
    (3, 'BlipFlip', 'Jazz');

SELECT
  Song.SongName,
  Song.AlbumID,
  Song.SongName,
  Album.AlbumName,
  Album.year
FROM Song
INNER JOIN Album
ON Song.AlbumID = Album.AlbumID
INNER JOIN Singer
ON Singer.SingerID = Album.SingerID
WHERE Singer.Name = 'Andrew' 
AND Song.Genre = 'Jazz'
AND Album.year = 2020;

SELECT COUNT(*) AS NumSongs
FROM Song
INNER JOIN Album
ON Song.AlbumID = Album.AlbumID
INNER JOIN Singer
ON Singer.SingerID = Album.SingerID
WHERE Singer.Name = 'Andrew' 
AND Song.Genre = 'Jazz'
AND Album.year = 2020;

-- QUESTION 2

CREATE TABLE IF NOT EXISTS `Employee` (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  weekly_hour INT,
  salary INT,
  phone VARCHAR(255),
  email VARCHAR(255)
);

INSERT INTO `Employee` (name, surname, weekly_hour, salary, phone, email)
VALUES
  ('John', 'Flipschitz', 36, 2555, '222-222-2222', 'hey@hey.hey'),
  ('Joe', 'Whatever', 40, 2800, '222-222-2222', 'hey@hey.hey'),
  ('Shaun', 'Blue', 30, 2000, '222-222-2222', 'hey@hey.hey'),
  ('Mariah', 'Nome', 30, 2555, '222-222-2222', 'hey@hey.hey'),
  ('Stephanie', 'Hubert', 45, 3100, '222-222-2222', 'hey@hey.hey'),
  ('Noemi', 'Mateos', 36, 2480, '222-222-2222', 'hey@hey.hey'),
  ('Joe', 'Lazypants', 4, 200, '222-222-2222', 'hey@hey.hey'),
  ('Bailey', 'Someone', 3, 150, '222-222-2222', 'hey@hey.hey');

UPDATE `Employee` as emp
SET salary = salary + (salary * 0.1) + 150
WHERE 
    salary < 3000
AND
    weekly_hour > 35;

SELECT
    name,
    surname,
    weekly_hour as hours,
    phone,
    email
FROM Employee
WHERE weekly_hour > 30 AND salary < 3000;

SELECT
    name,
    surname,
    weekly_hour as hours,
    phone,
    email
FROM Employee
WHERE weekly_hour < 5;


SELECT
    name,
    surname,
    weekly_hour as hours,
    phone,
    email
FROM Employee
    

SELECT * FROM `Employee`;

CREATE TABLE IF NOT EXISTS `Customer`(
    CustomerId INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    City VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `Account`(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Balance DOUBLE NOT NULL,
    CustomerID INT NOT NULL REFERENCES Customer(CustomerID)
);

CREATE TABLE IF NOT EXISTS `Branch`(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Account_Branch`(
    AccountID INT NOT NULL,
    BranchID INT NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Account(ID),
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);