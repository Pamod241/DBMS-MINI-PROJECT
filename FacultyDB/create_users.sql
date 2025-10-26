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



-- PRIVILAGES AND GRANT OPTION --

GRANT ALL PRIVILEGES ON FacultyDB.* TO 'Admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON FacultyDB.* TO 'Dean'@'localhost';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON FacultyDB.* TO 'Lecturer'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT,INSERT,UPDATE ON FacultyDB.attendence TO 'Technical_Officer'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT,INSERT,UPDATE ON FacultyDB.medical TO 'Technical_Officer'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT ON FacultyDB.attendence TO 'Student'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT ON FacultyDB.mark TO 'Student'@'localhost';
FLUSH PRIVILEGES;



