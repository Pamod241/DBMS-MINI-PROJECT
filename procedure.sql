-- 1 marks details whole batch

DROP PROCEDURE IF EXISTS marks_details;
DELIMITER //

CREATE PROCEDURE marks_details()
BEGIN

SELECT mark_id,student_id,course_code, CA_Eligibility,END_Eligibility 

FROM RESULT;

END //

DELIMITER ;


CALL marks_details();









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



-- CURRENT GPA DETAILS WHOLE BATCH


DROP PROCEDURE IF EXISTS cur_gpa_details;
DELIMITER //
CREATE PROCEDURE cur_gpa_details ()
BEGIN
 SELECT student_id,CGPA
 FROM CGPA_check;
END //
DELIMITER ;


CALL cur_gpa_details();



-- CURRENT GPA DETAILS FOR GIVEN STUDENT ID


DROP PROCEDURE IF EXISTS cur_gpa_details;

DELIMITER //


CREATE PROCEDURE cur_gpa_details (IN stu_num VARCHAR(10))

BEGIN
 SELECT student_id,CGPA
 FROM CGPA_check
 WHERE student_id=stu_num;
 
 
END //

DELIMITER ;


CALL cur_gpa_details('TG0004');

