create database FacultyDB;


use FacultyDB;

/*Department Table*/

CREATE TABLE Department (
    Dep_id VARCHAR(10) PRIMARY KEY,
    D_name VARCHAR(100) NOT NULL
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

/*User table*/
CREATE TABLE User (
    User_id VARCHAR(10) PRIMARY KEY,
    Role ENUM('Admin', 'Dean', 'Lecturer', 'Technical_Officer', 'Student'),
    Password VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

/*marks table*/







/*Technical Officer Table*/

CREATE TABLE Technical_Officer (
    TO_id VARCHAR(10) PRIMARY KEY,
    Fullname VARCHAR(100),
    Email VARCHAR(100)
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
('ENG1222', 'English', 2, 'Theory', 'L001'),
('ICT1212', 'Database Management Systems', 3, 'Theory', 'L001'),
('ICT1222', 'Database Management Systems Practicum', 2, 'Practical', 'L003'),
('ICT1233', 'Server Side Web Development', 3, 'Practical', 'L002'),
('ICT1242', 'Computer Architecture', 2, 'Theory', 'L004'),
('ICT1253', 'Computer Networks', 3, 'Theory', 'L005'),
('TCS1212', 'Fundamentals of Management', 2, 'Theory', 'L004'),
('TMS1233', 'Discrete Mathematics', 3, 'Theory', 'L002');




/*  Insert data to student table */


INSERT INTO Student (Reg_no, Fullname, DOB, Age, Email, Type, Dep_id) VALUES
('TG0001', 'Kavindu Perera', '2002-01-12', 23, 'kavindu@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0002', 'Nimesha Fernando', '2003-03-18', 22, 'nimesha@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0003', 'Sithum Bandara', '2002-07-02', 23, 'sithum@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0004', 'Sanduni Gamage', '2003-01-28', 22, 'sanduni@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0005', 'Amasha Dilrukshi', '2002-11-10', 23, 'amasha@stu.ruh.ac.lk', 'Proper', 'D01'),
('TG0006', 'Isuru Ranasinghe', '2002-05-21', 23, 'isuru@stu.ruh.ac.lk', 'Repeat', 'D01'),
('TG0007', 'Hiruni Madushika', '2003-01-16', 22, 'hiruni@stu.ruh.ac.lk', 'Repeat', 'D01'),
('TG0008', 'Pasindu Lakshan', '2002-06-11', 23, 'pasindu@stu.ruh.ac.lk', 'Repeat', 'D01'),
('TG0009', 'Bimsara Jayasuriya', '2003-04-09', 22, 'bimsara@stu.ruh.ac.lk', 'Repeat', 'D01'),
('TG0010', 'Mihiri De Silva', '2002-09-13', 23, 'mihiri@stu.ruh.ac.lk', 'Repeat', 'D01'),
('TG0011', 'Sajith Abeywickrama', '2002-08-15', 23, 'sajith@stu.ruh.ac.lk', 'Proper', 'D02'),
('TG0012', 'Chathura Weerasinghe', '2003-01-10', 22, 'chathura@stu.ruh.ac.lk', 'Proper', 'D02'),
('TG0013', 'Naduni Samarasekara', '2003-06-02', 22, 'naduni@stu.ruh.ac.lk', 'Proper', 'D03'),
('TG0014', 'Dinuka Rajapaksha', '2003-07-18', 22, 'dinuka@stu.ruh.ac.lk', 'Proper', 'D03'),
('TG0015', 'Hashini Rathnayake', '2002-10-22', 23, 'hashini@stu.ruh.ac.lk', 'Suspended', 'D01');


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


/*enter data Quiz*/

INSERT INTO Quiz
VALUES
('TG0001', 'ICT1212', 10),
('TG0002', 'ICT1212', 8),
('TG0006', 'ICT1222', 9),
('TG0007', 'ICT1222', 10);


/*enter data Project*/

INSERT INTO Project 
VALUES
('TG0001', 'ICT1212', 15),
('TG0002', 'ICT1212', 12),
('TG0006', 'ICT1222', 14),
('TG0007', 'ICT1222', 13);


/*enter data Assigment*/

INSERT INTO Assignment 
VALUES
('TG0001', 'ICT1212', 20),
('TG0002', 'ICT1212', 18),
('TG0006', 'ICT1222', 19),
('TG0007', 'ICT1222', 17);


/*enter data Technical_officer*/

INSERT INTO Technical_Officer 
VALUES
('TO01', 'Kasun Wijesinghe', 'kasun.to@tech.ruh.ac.lk'),
('TO02', 'Nadeesha Fernando', 'nadeesha.to@tech.ruh.ac.lk'),
('TO03', 'Ruwan Jayalath', 'ruwan.to@tech.ruh.ac.lk'),
('TO04', 'Dilini Samarasekara', 'dilini.to@tech.ruh.ac.lk'),
('TO05', 'Tharaka Perera', 'tharaka.to@tech.ruh.ac.lk');


/*insert data for common marks table*/

INSERT INTO Common VALUES
('TG0001', 'ICT1212', 45, 50),
('TG0002', 'ICT1212', 40, 48),
('TG0006', 'ICT1222', 48, 47),
('TG0007', 'ICT1222', 42, 44);


/*insert data for marks table*/

INSERT INTO Mark VALUES
('ICT1212', 'Theory', 'TG0001', 'A'),
('ICT1212', 'Theory', 'TG0002', 'B'),
('ICT1222', 'Practical', 'TG0006', 'A'),
('ICT1222', 'Practical', 'TG0007', 'B');


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