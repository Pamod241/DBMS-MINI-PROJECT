create database FacultyDB;


use FacultyDB;

/*Department Table*/

CREATE TABLE Department (
    Dep_id VARCHAR(10) PRIMARY KEY,
    D_name VARCHAR(100) NOT NULL
);

/*Lecturer Table*/

CREATE TABLE Lecturer (
    Lec_id VARCHAR(10) PRIMARY KEY,
    Fullname VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Gender ENUM('Male', 'Female', 'Other'),
    Dep_id VARCHAR(10),
    FOREIGN KEY (Dep_id) REFERENCES Department(Dep_id)
    ON DELETE SET NULL ON UPDATE CASCADE
);





/*Course Table*/

CREATE TABLE Course (
    C_code VARCHAR(10) PRIMARY KEY,
    C_name VARCHAR(100) NOT NULL,
    Credit INT,
    Type ENUM('Theory', 'Practical'),
    Lec_id VARCHAR(10),
    FOREIGN KEY (Lec_id) REFERENCES Lecturer(Lec_id)
    ON DELETE SET NULL ON UPDATE CASCADE
);

/*Student Table*/

CREATE TABLE Student (
    Reg_no VARCHAR(15) PRIMARY KEY,
    Fullname VARCHAR(100) NOT NULL,
    DOB DATE,
    Age INT,
    Email VARCHAR(100) UNIQUE,
    Type ENUM('Proper', 'Repeat', 'Suspended'),
    Dep_id VARCHAR(10),
    FOREIGN KEY (Dep_id) REFERENCES Department(Dep_id)
    ON DELETE SET NULL ON UPDATE CASCADE
);


/*Student-Course Relationship*/

CREATE TABLE Stu_Course (
    C_code VARCHAR(10),
    Reg_no VARCHAR(15),
    PRIMARY KEY (C_code, Reg_no),
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no)
    ON DELETE CASCADE ON UPDATE CASCADE
);


/*Admin Table*/

CREATE TABLE Admin (
    Admin_id VARCHAR(10) PRIMARY KEY,
    Fullname VARCHAR(100),
    Email VARCHAR(100)
);


/*Dean table*/
CREATE TABLE Dean (
    D_id VARCHAR(10) PRIMARY KEY,
    Fullname VARCHAR(100),
    Email VARCHAR(100)
);


/*Technical Officer Table*/

CREATE TABLE Technical_Officer (
    TO_id VARCHAR(10) PRIMARY KEY,
    Fullname VARCHAR(100),
    Email VARCHAR(100)
);

/*User table*/
CREATE TABLE User (
    User_id VARCHAR(10) PRIMARY KEY,
    Role ENUM('Admin', 'Dean', 'Lecturer', 'Technical_Officer', 'Student'),
    Password VARCHAR(100) NOT NULL,
    Email VARCHAR(100)
);

/*medical table*/

CREATE TABLE Medical(
    medical_id CHAR(10) PRIMARY KEY,
    description  VARCHAR(50),
    s_date DATE,
    e_date DATE,
    student_id VARCHAR(6),
	FOREIGN KEY (student_id) REFERENCES Student(Reg_no)
	        ON DELETE CASCADE ON UPDATE CASCADE
	
    );




/*Attendance Table*/

CREATE TABLE Attendance (
    Week INT,
    Type ENUM('Theory', 'Practical'),
    Status ENUM('Present', 'Absent', 'Medical'),
    C_code VARCHAR(10),
    Reg_no VARCHAR(15),
    PRIMARY KEY (Week, C_code, Reg_no),
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no)
     ON DELETE CASCADE ON UPDATE CASCADE
    );

/*Attendance Handle Table*/



CREATE TABLE Attendance_Handle (
    Week INT,
    C_code VARCHAR(10),
    TO_id VARCHAR(10),
    Date DATE,
    Type ENUM('Theory', 'Practical'),
    PRIMARY KEY (Week, C_code, TO_id),
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TO_id) REFERENCES Technical_Officer(TO_id)
ON DELETE CASCADE ON UPDATE CASCADE
);


/*marks table*/

CREATE TABLE Mark(
    mark_id CHAR(10) PRIMARY KEY,
    quiz_1 INT,
    quiz_2 INT,
    quiz_3 INT,
    assesment INT,
    mid INT,
    end INT,
    student_id VARCHAR(6),
    course_code char(8),
	CONSTRAINT chk_marks CHECK (
  quiz_1  BETWEEN 0 AND 100 AND
   quiz_2  BETWEEN 0 AND 100 AND
    quiz_3  BETWEEN 0 AND 100 AND
	assesment  BETWEEN 0 AND 100 AND
	 mid  BETWEEN 0 AND 100 AND
	 end  BETWEEN 0 AND 100 ),
	FOREIGN KEY (course_code) REFERENCES Course(C_code)
	        ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (student_id) REFERENCES Student(Reg_no)
	        ON DELETE CASCADE ON UPDATE CASCADE

);










/* Insert data to department table */

INSERT INTO Department (Dep_id, D_name) VALUES
('D01', 'Information and Communication Technology'),
('D02', 'Engineering Technology'),
('D03', 'Biosystems Technology');


/* Insert data to lecture table */

INSERT INTO Lecturer (Lec_id, Fullname, Email, Gender, Dep_id) VALUES
('L001', 'Dr. P.H.P. Nuwan Laksiri', 'nuwan@tech.ruh.ac.lk', 'Male', 'D01'),
('L002', 'Dr. S. Perera', 'sperera@tech.ruh.ac.lk', 'Male', 'D01'),
('L003', 'Ms. I. Fernando', 'ifernando@tech.ruh.ac.lk', 'Female', 'D01'),
('L004', 'Mr. K. Silva', 'ksilva@tech.ruh.ac.lk', 'Male', 'D02'),
('L005', 'Dr. M. Jayasinghe', 'mjayasinghe@tech.ruh.ac.lk', 'Female', 'D03');



/*  Insert data to cource table */

INSERT INTO Course (C_code, C_name, Credit, Type, Lec_id) VALUES
('ENG1222', 'English', 2, 'Theory', 'L007'),
('ICT1212', 'Database Management Systems', 2, 'Theory', 'L001'),
('ICT1222', 'Database Management Systems Practicum', 2, 'Practical', 'L001'),
('ICT1233', 'Server Side Web Development', 3, 'Theory', 'L002'),
('ICT1242', 'Computer Architecture', 2, 'Theory', 'L006'),
('ICT1253', 'Computer Networks', 3, 'Theory', 'L005'),
('TCS1212', 'Fundamentals of Management', 2, 'Theory', 'L004'),
('TMS1233','Discrete Mathematics', 3, 'Theory', 'L002');




/*  Insert data to student table */


INSERT INTO Student (Reg_no, Fullname, DOB, Age, Email, Type, Dep_id) VALUES
('TG0001', 'Kavindu Perera', '2002-01-12', 23, 'kavindu@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0002', 'Nimesha Fernando', '2003-03-18', 22, 'nimesha@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0003', 'Sithum Bandara', '2002-07-02', 23, 'sithum@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0004', 'Sanduni Gamage', '2003-01-28', 22, 'sanduni@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0005', 'Amasha Dilrukshi', '2002-11-10', 23, 'amasha@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0006', 'Isuru Ranasinghe', '2002-05-21', 23, 'isuru@stu.ruh.ac.lk', 'Repeat', 'D01'),
('TG0007', 'Hiruni Madushika', '2003-02-16', 22, 'hiruni@stu.ruh.ac.lk', 'Repeat', 'D01'),
('TG0008', 'Pasindu Lakshan', '2002-06-11', 23, 'pasindu@stu.ruh.ac.lk', 'Repeat', 'D01'),
('TG0009', 'Bimsara Jayasuriya', '2003-04-09', 22, 'bimsara@stu.ruh.ac.lk', 'Repeat', 'D01'),
('TG0010', 'Mihiri De Silva', '2002-09-13', 23, 'mihiri@stu.ruh.ac.lk', 'Repeat', 'D01'),
('TG0011', 'Sajith Abeywickrama', '2002-08-15', 23, 'sajith@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0012', 'Chathura Weerasinghe', '2003-01-10', 22, 'chathura@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0013', 'Naduni Samarasekara', '2003-06-02', 22, 'naduni@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0014', 'Dinuka Rajapaksha', '2003-07-18', 22, 'dinuka@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0015', 'Hashini Rathnayake', '2002-10-22', 23, 'hashini@stu.ruh.ac.lk', 'Proper', 'D01');


/* enter data stu_course */

INSERT INTO Stu_Course 
(C_code, Reg_no) 
VALUES
('ENG1222', 'TG0001'),
('ENG1222', 'TG0002'),
('ICT1212', 'TG0001'),
('ICT1212', 'TG0002'),
('ICT1212', 'TG0003'),
('ICT1222', 'TG0001'),
('ICT1222', 'TG0002'),
('ICT1222', 'TG0006'),
('ICT1233', 'TG0003'),
('ICT1233', 'TG0004'),
('ICT1242', 'TG0005'),
('ICT1253', 'TG0007'),
('TCS1212', 'TG0008'),
('TMS1233', 'TG0009'),
('TMS1233', 'TG0010');

/* enter data for madical*/

INSERT Medical VALUES
    ('MD001','sick','2025-08-06','2025-08-08','TG0004'),
    ('MD002','sick','2025-08-09','2025-08-15','TG0015'),
    ('MD003','sick','2025-08-27','2027-08-27','TG0015'),
    ('MD004','sick','2025-08-14','2025-08-16','TG0014'),
    ('MD005','sick','2025-08-15','2025-08-22','TG0013'),
    ('MD006','sick','2025-08-28','2025-08-30','TG0002'),
    ('MD007','sick','2025-09-16','2025-09-18','TG0004'),
    ('MD008','sick','2025-09-24','2025-09-24','TG0004'),
    ('MD009','sick','2025-11-15','2025-11-15','TG0008'),
    ('MD010','sick','2025-11-15','2025-11-15','TG0001');


/* enter data attendance */

INSERT INTO Attendance
 VALUES
(1, 'Theory', 'Present', 'ICT1212', 'TG0001'),
(1, 'Theory', 'Present', 'ICT1212', 'TG0002'),
(1, 'Theory', 'Absent',  'ICT1212', 'TG0003'),
(1, 'Practical', 'Present', 'ICT1222', 'TG0006'),
(1, 'Practical', 'Medical', 'ICT1222', 'TG0007'),
(2, 'Theory', 'Present', 'ICT1212', 'TG0001'),
(2, 'Theory', 'Present', 'ICT1212', 'TG0002');



/* enter data attendance _ handale*/

INSERT INTO Attendance_Handle
 VALUES
(1, 'ICT1212', 'TO01', '2025-01-15', 'Theory'),
(1, 'ICT1222', 'TO02', '2025-01-15', 'Practical');


/* enter data admin*/

INSERT INTO Admin 
VALUES 
('A001', 'System Administrator', 'admin@tech.ruh.ac.lk');











/*enter data Technical_officer*/

INSERT INTO Technical_Officer 
VALUES
('TO01', 'Kasun Wijesinghe', 'kasun.to@tech.ruh.ac.lk'),
('TO02', 'Nadeesha Fernando', 'nadeesha.to@tech.ruh.ac.lk'),
('TO03', 'Ruwan Jayalath', 'ruwan.to@tech.ruh.ac.lk'),
('TO04', 'Dilini Samarasekara', 'dilini.to@tech.ruh.ac.lk'),
('TO05', 'Tharaka Perera', 'tharaka.to@tech.ruh.ac.lk');




/*insert data for marks table*/


INSERT Mark
VALUES
('M01', 0, 62, 48, 79, 67, 44, 'TG0001', 'ICT1233'),
('M02', 61, 78, 40, 85, 74,39,  'TG0001', 'TMS1233'),
('M03', 71, 65, 49, 80, 66,84,  'TG0001', 'ICT1253'),
('M04', 0, 76, 38, 87, 64,45,  'TG0001', 'ICT1242'),
('M05', 69, 73, 43, 84, 70, 45,  'TG0001', 'ICT1212'),
('M06', 63, 72, 37,  81, 40, 90, 'TG0001', 'ICT1222'),
('M07', 64, 79, 35, 78, 73, 32, 'TG0001', 'TCS1212'),
('M08', 66, 77, 42, 83, 69, 41, 'TG0001', 'ENG1222'),

 ('M09', 72, 82, 91,  61,68,70 ,'TG0002', 'ICT1233'),
('M10', 74, 89, 34, 0, 93, 50, 'TG0002', 'TMS1233'),
('M11', 76, 0, 94,  45, 92, 60, 'TG0002', 'ICT1253'),
('M12', 73, 81, 93, 82, 31,  96, 'TG0002', 'ICT1242'),
('M13', 75, 83, 90, 86, 33, 91,  'TG0002', 'ICT1212'),
('M14', 77, 87, 95, 81, 43, 66, 'TG0002', 'ICT1222'),
('M15', 71, 84, 89, 80, 35, 90,  'TG0002', 'TCS1212'),
('M16', 0, 88, 97, 87, 38, 98,  'TG0002', 'ENG1222'),

 ('M17', 0, 75, 95, 68, 46, 90, 'TG0003', 'ICT1233'),
('M18', 40, 78, 97, 69, 49,  36,  'TG0003', 'TMS1233'),
('M19', 43, 76, 98, 71, 47,  94, 'TG0003', 'ICT1253'),
('M20', 41, 74, 96, 67,  60, 37,  'TG0003', 'ICT1242'),
('M21', 44, 80, 99, 72, 50, 39,  'TG0003', 'ICT1212'),
('M22', 45, 79, 95, 70, 40, 49,  'TG0003', 'ICT1222'),
('M23', 42, 76, 94, 69, 45, 35, 'TG0003', 'TCS1212'),
('M24', 39, 81, 97, 70, 0, 59, 'TG0003', 'ENG1222'),

('M25', 40, 88, 60, 45, 50, 68,  'TG0004', 'ICT1233'),
('M26', 36, 90, 59, 61, 30, 60, 'TG0004', 'TMS1233'),
('M27', 37, 87, 55, 48, 64, 70,  'TG0004', 'ICT1253'),
('M28', 39, 86, 0, 50, 63,  64,'TG0004', 'ICT1242'),
('M29', 41, 90, 58, 46, 65, 65, 'TG0004', 'ICT1212'),
('M30', 38, 85, 56, 47,  70, 66,  'TG0004', 'ICT1222'),
('M31', 36, 89, 57, 44, 62,  60, 'TG0004', 'TCS1212'),
('M32', 39, 88, 55, 45, 61, 62,  'TG0004', 'ENG1222'),
 
('M33', 60, 72, 42, 47, 91, 80, 'TG0005', 'ICT1233'),
('M34', 57, 71, 39, 44, 93, 79,  'TG0005', 'TMS1233'),
('M35', 59, 69, 41, 46,  77, 71, 'TG0005', 'ICT1253'),
('M36', 61, 73, 43, 48, 92, 78,  'TG0005', 'ICT1242'),
('M37', 58, 70, 40, 50, 89, 81, 'TG0005', 'ICT1212'),
('M38', 45, 79, 95,  49, 38, 95, 'TG0005', 'ICT1222'),
('M39', 62, 74, 45, 49,  76, 67, 'TG0005', 'TCS1212'),
('M40', 56, 68, 38, 43, 94,  75, 'TG0005', 'ENG1222'),

 ('M41', 30, 50, 10, 68,  0, 53, 'TG0006', 'ICT1233'),
('M42', 79, 30, 50, 0,  0,  52, 'TG0006', 'TMS1233'),
('M43', 25, 0, 53, 30,  40,  50, 'TG0006', 'ICT1253'),
('M44', 0, 82, 51,  88, 0, 54, 'TG0006', 'ICT1242'),
('M45', 25, 50, 55,  92, 39, 0, 'TG0006', 'ICT1212'),
('M46', 30, 28, 49,  0, 42, 48, 'TG0006', 'ICT1222'),
('M47', 20, 0, 52, 47, 38,  0, 'TG0006', 'TCS1212'),
('M48', 10, 30, 42,  80, 0, 68, 'TG0006', 'ENG1222'),


('M49', 55, 47, 38, 51, 33, 47, 'TG0007', 'ICT1233'),
('M50', 0, 44, 36, 0, 31, 0, 'TG0007', 'TMS1233'),
('M51', 54, 45, 51, 50, 32, 46, 'TG0007', 'ICT1253'),
('M52', 56, 48, 0, 50,  34, 0, 'TG0007', 'ICT1242'),
('M53', 55, 0, 10, 47,  32, 0, 'TG0007', 'ICT1212'),
('M54', 54, 46, 51, 48, 0, 46, 'TG0007', 'ICT1222'),
('M55', 54, 45, 51,  0, 32, 0, 'TG0007', 'TCS1212'),
('M56', 53,  48, 37, 0, 32, 0, 'TG0007', 'ENG1222'),



('M57', 45,  61, 42, 58, 55, 48, 'TG0008', 'ICT1233'),
('M58', 37, 36, 49, 0, 53, 0,   'TG0008', 'TMS1233'),
('M59', 40, 35, 46, 54,  51, 49, 'TG0008', 'ICT1253'),
('M60', 39, 34, 44,  0, 54, 0,  'TG0008', 'ICT1242'),
('M61', 36, 33,  40, 0, 54, 0,  'TG0008', 'ICT1212'),
('M62', 38, 30, 43,  62, 54, 52, 'TG0008', 'ICT1222'),
('M63', 42, 32, 50, 60, 56, 0, 'TG0008', 'TCS1212'),
('M64', 44, 31, 48, 0, 57, 0, 'TG0008', 'ENG1222'),


('M65', 61, 72, 80, 45, 69, 34, 'TG0009', 'ICT1233'),
('M66', 59,  70, 78, 43, 67, 32, 'TG0009', 'TMS1233'),
('M67', 60, 75, 79, 44, 68, 33, 'TG0009', 'ICT1253'),
('M68', 46, 73, 81, 46, 70, 35, 'TG0009', 'ICT1242'),
('M69', 58, 74,  77, 43, 67, 31, 'TG0009', 'ICT1212'),
('M70', 60, 75, 44, 44, 68, 33, 'TG0009', 'ICT1222'),
('M71', 54, 45, 51, 48,  32, 0,  'TG0009',  'TCS1212'),
('M72', 59, 76, 43, 70,  67, 32, 'TG0009', 'ENG1222'),


('M73', 47, 99, 98, 88, 66, 0,   'TG0010', 'ICT1233'),
 ('M74', 84, 30, 65, 49, 92, 55, 'TG0010', 'TMS1233'),
 ('M75', 81, 46, 41, 91, 70, 100,'TG0010', 'ICT1253'),
 ('M76', 80, 50,  46, 90, 73, 95, 'TG0010', 'ICT1242'),
 ('M77',49, 54, 91, 88, 65, 34,  'TG0010', 'ICT1212'),
 ('M78',86, 46, 81,  51, 95, 57,  'TG0010', 'ICT1222'),
 ('M79',49, 54, 91, 88, 65, 34,  'TG0010', 'TCS1212'),
 ('M80', 95, 80, 50, 97, 91, 30, 'TG0010', 'ENG1222'),
 

('M81', 85, 32, 70, 48, 93, 51, 'TG0011', 'ICT1233'),
('M82', 90, 45, 68, 53, 97, 56, 'TG0011', 'TMS1233'),
('M83', 84, 44, 78,49, 92, 55, 'TG0011', 'ICT1253'),
('M84', 87, 42, 75,  52, 94, 58, 'TG0011', 'ICT1242'),
 ('M85',82, 69, 50,  88, 67, 43,  'TG0011', 'ICT1212'),
 ('M86',85, 50, 68, 30,  95, 57,  'TG0011', 'ICT1222'),
('M87', 89, 47, 80,  50, 96, 53, 'TG0011', 'TCS1212'),
('M88', 86, 46, 81, 39,95, 57, 'TG0011', 'ENG1222'),



('M89', 90, 98, 99, 89, 80, 34, 'TG0012', 'ICT1233'),
('M90', 72, 65, 68, 60, 70, 33, 'TG0012', 'TMS1233'),
('M91', 50, 60,  70, 83, 60, 33, 'TG0012', 'ICT1253'),
('M92', 60, 85, 89, 0, 65, 33, 'TG0012', 'ICT1242'),
('M93',70, 75, 91, 80, 75, 42, 'TG0012', 'ICT1212'),
('M94', 75, 48, 88, 79,  82, 34, 'TG0012', 'ICT1222'),
('M95', 80, 78, 89, 90, 75, 33, 'TG0012', 'TCS1212'),
('M96', 58, 58, 78, 75, 79, 78, 'TG0012', 'ENG1222'),



('M97', 82, 50, 88, 58, 42, 93, 'TG0013', 'ICT1233'),
('M98', 85, 47, 91, 57, 45, 92, 'TG0013', 'TMS1233'),
('M99', 84, 49, 89, 55, 74, 98, 'TG0013', 'ICT1253'),
('M100', 81, 46, 87, 59,  70, 100, 'TG0013', 'ICT1242'),
('M101', 83, 48, 90, 56, 0, 97, 'TG0013', 'ICT1212'),
('M102', 80, 50, 86, 60,  73, 95, 'TG0013', 'ICT1222'),
('M103', 32, 33, 90,  0, 35, 0, 'TG0013', 'TCS1212'),
('M104', 55, 46, 52, 47, 33, 47, 'TG0013', 'ENG1222'),


('M105', 95, 80, 50, 70, 68,  30, 'TG0014', 'ICT1233'),
('M106', 96, 78, 48, 73, 65, 0, 'TG0014', 'TMS1233'),
('M107', 97, 75, 51,  95, 92, 34, 'TG0014', 'ICT1253'),
('M108', 94, 76, 52, 74,  89, 0, 'TG0014', 'ICT1242'),
('M109', 92, 79, 50, 75, 70, 88,  'TG0014', 'ICT1212'),
('M110', 93, 77, 49, 72, 80, 35, 'TG0014', 'ICT1222'),
('M111', 91, 74, 53, 70, 68,  87,  'TG0014', 'TCS1212'),
('M112', 99, 81, 47, 71, 65,  90, 'TG0014', 'ENG1222'),

('M113', 29, 35, 91, 37, 97, 51, 'TG0015', 'ICT1233'),
('M114', 32, 33, 90, 36, 99,  35,  'TG0015', 'TMS1233'),
('M115', 30, 36, 93, 35,  33, 49, 'TG0015', 'ICT1253'),
('M116', 33, 34, 92, 95, 82, 34, 'TG0015', 'ICT1242'),
('M117', 31, 34, 92, 36, 98, 68, 'TG0015', 'ICT1212'),
('M118', 30, 34, 92, 36, 0, 40, 'TG0015', 'ICT1222'),
('M119', 31, 36, 91, 36, 97,  34,  'TG0015', 'TCS1212'),
('M120', 30, 34, 92, 37, 98, 35,  'TG0015', 'ENG1222');


/*insert data for user table*/

INSERT INTO User VALUES
('U001', 'Admin', 'admin123', 'admin@tech.ruh.ac.lk'),
('U002', 'Dean', 'dean123', 'dean@tech.ruh.ac.lk'),
('U003', 'Lecturer', 'lect123', 'nuwan@tech.ruh.ac.lk'),
('U004', 'Lecturer', 'lect123', 'sperera@tech.ruh.ac.lk'),
('U005', 'Lecturer', 'lect123', 'ifernando@tech.ruh.ac.lk'),
('U006', 'Technical_Officer', 'to123', 'kasun.to@tech.ruh.ac.lk'),
('U007', 'Student', 'stu123', 'kavindu@stu.ruh.ac.lk'),
('U008', 'Student', 'stu123', 'nimesha@stu.ruh.ac.lk');


/*insert data for dean table*/

INSERT INTO Dean VALUES ('DE01', 'Prof. H. Senanayake', 'dean@tech.ruh.ac.lk');
