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



