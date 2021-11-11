CREATE DATABASE IF NOT EXISTS exam1;

USE exam1;

-- CREATE TABLE IF NOT EXISTS Products(
--   productID INT(11) PRIMARY KEY AUTOINCREMENT,
--   name VARCHAR(255) NOT NULL,
--   category VARCHAR(255) NOT NULL,
--   price DOUBLE NOT NULL
-- );


-- UPDATE Automobile SET 
--   Price = IF(Model < 2015, Price - (1 + (15 / 100)), Price - (1 + (5 / 100)));

-- SELECT CourseCode, 
--   min(grade) AS MinGrade,
--   max(grade) AS MaxGrade,
--   avg(grade) AS AvgGrade
--   FROM CourseGrades
--   GROUP BY CourseCode;

CREATE TABLE IF NOT EXISTS Employee(
  EmpID int(11) PRIMARY KEY AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  AssignedTask varchar(255),
  Salary double NOT NULL
);

INSERT INTO Employee(Name, AssignedTask,Salary)
  VALUES ('James Mealy', 'Fetch Coffee', 35000);
INSERT INTO Employee(Name, AssignedTask,Salary)
  VALUES ('Joe', 'Sweep', 25000);

INSERT INTO Employee(Name, AssignedTask,Salary)
  VALUES ('Jane', 'Make Copies', 45000);


Select Name, AssignedTask from Employee;

SELECT Name, AssignedTask, avg(Salary)
  from Employee
  group by Salary
  having Salary < avg(Salary);