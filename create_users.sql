-- Create User Account --
 DROP USER  IF EXISTS 'Admin'@'localhost';
CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'adminpwd';


 DROP USER  IF EXISTS 'Dean'@'localhost';
CREATE USER 'Dean'@'localhost' IDENTIFIED BY 'deanpwdd';


 DROP USER  IF EXISTS 'Lecturer'@'localhost';
CREATE USER 'Lecturer'@'localhost' IDENTIFIED BY 'lecturepwd';


 DROP USER  IF EXISTS 'Technical_Officer'@'localhost';
CREATE USER 'Technical_Officer'@'localhost' IDENTIFIED BY 'techofficerpwd';


 DROP USER  IF EXISTS 'Student'@'localhost';
CREATE USER 'Student'@'localhost' IDENTIFIED BY 'studentpwd';
