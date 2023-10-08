CREATE TABLE Building ( 
  `Id` INT PRIMARY KEY,
  `Name` VARCHAR(45));

CREATE TABLE Department (
  `Id` INT PRIMARY KEY,
  `Name` VARCHAR(45),
  `Email` VARCHAR(45),
  `Phone_Number` CHAR(13),
  `Building_Id` INT,
  FOREIGN KEY (`Building_Id`) REFERENCES Building(`Id`) ON DELETE NO ACTION);
  
CREATE TABLE Student (
  `Id` INT PRIMARY KEY,
  `Name` VARCHAR(45),
  `Email` VARCHAR(45),
  `Phone_Number` CHAR(13),
  `Major` VARCHAR(45),
  `Department_Id` INT,
  FOREIGN KEY (`Department_Id`) REFERENCES Department(`Id`) ON DELETE CASCADE); -- 1:N 관계, 식별

CREATE TABLE Room ( 
  `Id` INT PRIMARY KEY,
  `Name` VARCHAR(45),
  `Capacity` INT,
  `Building_Id` INT,
  FOREIGN KEY(`Building_Id`) REFERENCES Building(`Id`) ON DELETE CASCADE); -- 1:N 관계, 식별
  
-- 새로 추가된 엔티티: 수업, 동아리, 구성원
CREATE TABLE Class (
  `Id` VARCHAR(45) PRIMARY KEY,
  `Name` VARCHAR(45),
  `Professor` VARCHAR(45),
  `Number_of_participants` INT);

CREATE TABLE Club (
  `Id` INT PRIMARY KEY,
  `Name` VARCHAR(45));

CREATE TABLE Employee (
  `Id` INT PRIMARY KEY,
  `Name` VARCHAR(45),
  `Position` VARCHAR(45));

-- CREATE TABLE Building_has_Room ( -- 1대N
--   Building_Id INT,
--   Room_Id INT,
--   PRIMARY KEY (Building_Id, Room_Id), -- 식별 관계이기 때문에 primary key로 묶어줌
--   FOREIGN KEY (Building_Id) REFERENCES Building(Id) ON DELETE CASCADE, -- 식별 관계여서 CASCADE 
--   FOREIGN KEY (Room_Id) REFERENCES Room(Id) ON DELETE CASCADE);

-- CREATE TABLE Student_has_Department ( -- N대1
--   Student_Id INT,
--   Department_Id INT,
--   PRIMARY KEY (Student_Id, Department_Id),
--   FOREIGN KEY (Department_Id) REFERENCES Department(Id) ON DELETE CASCADE,
--   FOREIGN KEY (Student_Id) REFERENCES Student(Id) ON DELETE CASCADE);

-- CREATE TABLE Building_has_Department ( -- 비식별 관계이기 때문에 PRIMARY KEY로 묶지 않음., 1대N 
--   Building_Id INT,
--   Department_Id INT,
--   FOREIGN KEY (Building_Id) REFERENCES Building(Id) ON DELETE NO ACTION, -- 비식별 관계여서 삭제되어도 특별한 행동없음
--   FOREIGN KEY (Department_Id) REFERENCES Department(Id) ON DELETE NO ACTION);

CREATE TABLE Student_has_Class ( -- 비식별관계: 학생은 수업 없을 수도 있음. N:M
  Student_Id INT,
  Class_Id VARCHAR(45),
  FOREIGN KEY (Student_Id) REFERENCES Student(`Id`) ON DELETE NO ACTION,
  FOREIGN KEY (Class_Id) REFERENCES Class(`Id`) ON DELETE NO ACTION);

CREATE TABLE Student_has_Club ( -- 비식별관계: 동아리 없는 학생도 있음. N:M
  Student_Id INT,
  Club_Id INT,
  FOREIGN KEY (Student_Id) REFERENCES Student(`Id`) ON DELETE NO ACTION,
  FOREIGN KEY (Club_Id) REFERENCES Club(`Id`) ON DELETE NO ACTION);

CREATE TABLE Employee_has_Class ( -- 비식별관계: 직원 중에 교수가 아닌 사람도 있으므로 수업이 없는 직원도 있음. N:M
  Employee_Id INT,
  Class_Id VARCHAR(45),
  FOREIGN KEY (Employee_Id) REFERENCES Employee(`Id`) ON DELETE NO ACTION,
  FOREIGN KEY (Class_Id) REFERENCES Class(`Id`) ON DELETE NO ACTION);

-- 건물
INSERT INTO Building VALUES(100, "Hightech");
INSERT INTO Building VALUES(200, "60-years");
INSERT INTO Building VALUES(300, "Number.2");
INSERT INTO Building VALUES(400, "Number.4");
INSERT INTO Building VALUES(500, "Number.5");

-- 학과 
INSERT INTO Department VALUES(1,"information and communication engineering", "ICE@inha.edu", "032-0001-0001", 100);
INSERT INTO Department VALUES(2, "electronics engineering", "ELEC@inha.edu", "032-0002-0002", 300);
INSERT INTO Department VALUES(3, "artificial intelligence engineering", "AI@inha.edu", "032-0003-0003", 200);
INSERT INTO Department VALUES(4, "computer engineering", "COM@inha.edu", "032-0004-0004", 100);
INSERT INTO Department VALUES(5, "mechanicial engineering", "MEC@inha.edu", "032-0005-0005", 500);

-- 학생
INSERT INTO Student VALUES(12181816, 'Jaeyoung', '12181816@inha.edu', '010-2022-6965', 'information and communication engineering',1);
INSERT INTO Student VALUES(12180000, 'John', '12180000@inha.edu', '010-0001-0001', 'computer engineering', 4);
INSERT INTO Student VALUES(12180001, 'James', '12180001@inha.edu', '010-0002-0002', 'electronics engineering', 2);
INSERT INTO Student VALUES(12180002, 'Collin', '12180002@inha.edu', '010-0003-0003', 'mechanical engineering', 5);
INSERT INTO Student VALUES(12180003, 'Maria', '12180003@inha.edu', '010-0004-0004', 'artificial intelligence engineering', 3);

-- 강의실
INSERT INTO Room VALUES(101, "H232", 40, 100);
INSERT INTO Room VALUES(102, "H230", 35, 100);
INSERT INTO Room VALUES(201, "6Y001", 100, 200);
INSERT INTO Room VALUES(301, "N2424", 30, 300);
INSERT INTO Room VALUES(401, "N4323", 35, 400);
INSERT INTO Room VALUES(501, "N5001", 50, 500);

-- 수업
INSERT INTO Class VALUES("ICE4016", "Database design", "Wonik Choi", 100);
INSERT INTO Class VALUES("ICE4017", "Internet Protocol", "Sangjo Yoo", 50);
INSERT INTO Class VALUES("ACE2102", "Enginerring Mathematics 2", "Richard", 60);
INSERT INTO Class VALUES ("ACE1002", "Principles of Physics", "George", 50);
INSERT INTO Class VALUES ("ICE1014", "Python Programming", "Sangjo Yoo", 65);

-- 동아리
INSERT INTO Club VALUES (10001, "InhaSoccer");
INSERT INTO Club VALUES (10002, "InhaBasketball");
INSERT INTO Club VALUES (10003, "InhaComputerClub");
INSERT INTO Club VALUES (10004, "InhaMobility");
INSERT INTO Club VALUES (10005, "Inhabook");

-- 구성원
INSERT INTO Employee VALUES(151117, "Wonik Choi", "Professor");
INSERT INTO Employee VALUES(121422, "Sangjo Yoo", "Professor");
INSERT INTO Employee VALUES(102234, "Richard", "Professor");
INSERT INTO Employee VALUES(103323, "George", "Professor");
INSERT INTO Employee VALUES(152234, "Jisoo Lee", "Researcher");

-- 건물과 학과 관계
-- INSERT INTO Building_has_Department VALUES(100, 1);
-- INSERT INTO Building_has_Department VALUES(100, 3);
-- INSERT INTO Building_has_Department VALUES(200, 4);
-- INSERT INTO Building_has_Department VALUES(300, 2);
-- INSERT INTO Building_has_Department VALUES(400, 5);

-- 학생과 전공 관계
-- INSERT INTO Student_has_Department VALUES(12181816, 1);
-- INSERT INTO Student_has_Department VALUES(12180000, 4);
-- INSERT INTO Student_has_Department VALUES(12180001, 2);
-- INSERT INTO Student_has_Department VALUES(12180002, 5);
-- INSERT INTO Student_has_Department VALUES(12180003, 3);

-- 건물과 강의실 관계
-- INSERT INTO Building_has_Room VALUES(100, 101);
-- INSERT INTO Building_has_Room VALUES(100, 102);
-- INSERT INTO Building_has_Room VALUES(200, 201);
-- INSERT INTO Building_has_Room VALUES(300, 301);
-- INSERT INTO Building_has_Room VALUES(400, 401);
-- INSERT INTO Building_has_Room VALUES(500, 501);

INSERT INTO Student_has_Class VALUES(12181816, "ICE4016");
INSERT INTO Student_has_Class VALUES(12181816, "ICE4017");
INSERT INTO Student_has_Class VALUES(12180000, "ICE4016");
INSERT INTO Student_has_Class VALUES(12180000, "ICE1014");
INSERT INTO Student_has_Class VALUES(12180001, "ACE2102");
INSERT INTO Student_has_Class VALUES(12180002, "ACE1002");

INSERT INTO Student_has_Club VALUES (12180003, 10004);
INSERT INTO Student_has_Club VALUES (12180003, 10001);
INSERT INTO Student_has_Club VALUES (12180002, 10005);
INSERT INTO Student_has_Club VALUES (12180001, 10002);
INSERT INTO Student_has_Club VALUES (12181816, 10002);

INSERT INTO Employee_has_Class VALUES (151117, "ICE4016");
INSERT INTO Employee_has_Class VALUES (121422, "ICE4017");
INSERT INTO Employee_has_Class VALUES (102234, "ACE2102");
INSERT INTO Employee_has_Class VALUES (103323, "ACE1002");
INSERT INTO Employee_has_Class VALUES (121422, "ICE1014");