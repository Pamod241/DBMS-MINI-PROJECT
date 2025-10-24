-- SEMESTER GPA DETAILS WHOLE BATCH 


DROP PROCEDURE IF EXISTS sem_gpa_details;
DELIMITER //
CREATE PROCEDURE sem_gpa_details ()
BEGIN
 SELECT student_id,SGPA
 FROM SGPA_check;
END //
DELIMITER ;


CALL sem_gpa_details();


-- SEMESTER GPA DETAILS FOR GIVEN STUDENT ID


DROP PROCEDURE IF EXISTS sem_gpa_details;
DELIMITER //
CREATE PROCEDURE sem_gpa_details (IN stu_num VARCHAR(10))
BEGIN
 SELECT student_id,SGPA
 FROM SGPA_check
 WHERE student_id=stu_num;
END //
DELIMITER ;


CALL sem_gpa_details('TG0004');
