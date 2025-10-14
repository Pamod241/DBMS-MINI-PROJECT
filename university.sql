create database university;


use university;

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

CREATE TABLE Mark (
    C_code VARCHAR(10),
    Type ENUM('Theory', 'Practical'),
    Reg_no VARCHAR(15),
    Grade VARCHAR(5),
    PRIMARY KEY (C_code, Type, Reg_no),
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no)
        ON DELETE CASCADE ON UPDATE CASCADE
);


/*create common table*/

CREATE TABLE Common (
    Reg_no VARCHAR(15),
    C_code VARCHAR(10),
    Mid INT,
    End INT,
    PRIMARY KEY (Reg_no, C_code),
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no)
    ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
    ON DELETE SET NULL ON UPDATE CASCADE
);


/*Technical Officer Table*/

CREATE TABLE Technical_Officer (
    TO_id VARCHAR(10) PRIMARY KEY,
    Fullname VARCHAR(100),
    Email VARCHAR(100)
);


/*Quiz Table*/

CREATE TABLE Quiz (
    Reg_no VARCHAR(15),
    C_code VARCHAR(10),
    Mark INT,
    PRIMARY KEY (Reg_no, C_code),
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no)
    ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
    ON DELETE SET NULL ON UPDATE CASCADE
); 


/*Project Table*/

CREATE TABLE Project (
    Reg_no VARCHAR(15),
    C_code VARCHAR(10),
    Mark INT,
    PRIMARY KEY (Reg_no, C_code),
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no)
     ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
     ON DELETE CASCADE ON UPDATE CASCADE
);


/*Assignment Table*/

CREATE TABLE Assignment (
    Reg_no VARCHAR(15),
    C_code VARCHAR(10),
    Mark INT,
    PRIMARY KEY (Reg_no, C_code),
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no)
     ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
 ON DELETE CASCADE ON UPDATE CASCADE
);


/* Insert data to department table */

INSERT INTO Department (Dep_id, D_name) VALUES
('D01', 'Information and Communication Technology'),
('D02', 'Engineering Technology'),
('D03', 'Biosystems Technology');




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
