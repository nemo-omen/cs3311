CREATE DATABASE IF NOT EXISTS `lab05`;

USE `lab05`;

CREATE TABLE IF NOT EXISTS `Student`(
  StID int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Department varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Course`(
  CID int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  CName varchar(255) NOT NULL,
  Credit int(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Grading`(
  StID int(11) PRIMARY KEY NOT NULL,
  CID int(11) NOT NULL,
  Year YEAR NOT NULL,
  Grade float
);

-- add a comment to see if push works