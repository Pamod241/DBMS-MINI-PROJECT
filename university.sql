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
);


/*Course Table*/

CREATE TABLE Course (
    C_code VARCHAR(10) PRIMARY KEY,
    C_name VARCHAR(100) NOT NULL,
    Credit INT,
    Type ENUM('Theory', 'Practical'),
    Lec_id VARCHAR(10),
    FOREIGN KEY (Lec_id) REFERENCES Lecturer(Lec_id)
);


/*Lecturer Table*/

CREATE TABLE Lecturer (
    Lec_id VARCHAR(10) PRIMARY KEY,
    Fullname VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Gender ENUM('Male', 'Female', 'Other'),
    Dep_id VARCHAR(10),
    FOREIGN KEY (Dep_id) REFERENCES Department(Dep_id)
);


/*Student-Course Relationship*/

CREATE TABLE Stu_Course (
    C_code VARCHAR(10),
    Reg_no VARCHAR(15),
    PRIMARY KEY (C_code, Reg_no),
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no)
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
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no),
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
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
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
); 


/*Project Table*/

CREATE TABLE Project (
    Reg_no VARCHAR(15),
    C_code VARCHAR(10),
    Mark INT,
    PRIMARY KEY (Reg_no, C_code),
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no)
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
);


/*Assignment Table*/

CREATE TABLE Assignment (
    Reg_no VARCHAR(15),
    C_code VARCHAR(10),
    Mark INT,
    PRIMARY KEY (Reg_no, C_code),
    FOREIGN KEY (Reg_no) REFERENCES Student(Reg_no)
    FOREIGN KEY (C_code) REFERENCES Course(C_code)
);


/* Insert data to department table */

INSERT INTO Department (Dep_id, D_name) VALUES
('D01', 'Information and Communication Technology'),
('D02', 'Engineering Technology'),
('D03', 'Biosystems Technology');



/*  Insert data to lecture table */

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
