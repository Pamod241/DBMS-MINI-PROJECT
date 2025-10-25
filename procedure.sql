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

-- 2 MARKS DETAILS FOR EACH STUDENT (GIVEN STUDENT ID)


DROP PROCEDURE IF EXISTS marks_details_by_student_id;
DELIMITER //

CREATE PROCEDURE marks_details_by_student_id( IN stu_num VARCHAR(10))
BEGIN

SELECT mark_id,student_id,course_code, CA_Eligibility,END_Eligibility 

FROM RESULT
WHERE student_id=stu_num;
END //

DELIMITER ;


CALL marks_details_by_student_id('TG0001');



--  STUDENT GRADE FOR WHOLE BATCH


DROP PROCEDURE IF EXISTS marks_grade_details;
DELIMITER //

CREATE PROCEDURE marks_grade_details_()
BEGIN

SELECT student_id,course_code, Final_Marks,Grade,Grade_Point

FROM Student_grade;

END //

DELIMITER ;


CALL marks_grade_details();



--  STUDENT GRADE FOR GIVEN STUDENT ID


DROP PROCEDURE IF EXISTS marks_grade_details_by_student_id;
DELIMITER //


CREATE PROCEDURE marks_grade_details_by_student_id(IN stu_num VARCHAR(10))
BEGIN

SELECT student_id,course_code, Final_Marks,Grade,Grade_Point

FROM Student_grade
WHERE student_id=stu_num;

END //

DELIMITER ;


CALL  marks_grade_details_by_student_id ('TG0015');



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


DROP PROCEDURE IF EXISTS sem_gpa_details_details_by_student_id;
DELIMITER //
CREATE PROCEDURE sem_gpa_details_details_by_student_id (IN stu_num VARCHAR(10))
BEGIN
 SELECT student_id,SGPA
 FROM SGPA_check
 WHERE student_id=stu_num;
END //
DELIMITER ;


CALL sem_gpa_details_details_by_student_id('TG0004');



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


DROP PROCEDURE IF EXISTS cur_gpa_details_by_student_id;

DELIMITER //


CREATE PROCEDURE cur_gpa_details_by_student_id (IN stu_num VARCHAR(10))

BEGIN
 SELECT student_id,CGPA
 FROM CGPA_check
 WHERE student_id=stu_num;
 
 
END //

DELIMITER ;


CALL cur_gpa_details_by_student_id('TG0004');


-- attendence  DETAILS WHOLE BATCH
DROP PROCEDURE IF EXISTS attendence_details;
DELIMITER //
CREATE PROCEDURE attendence_details ()
BEGIN
 SELECT student_id,course_code,Attendance_Percentage,Eligibility
 FROM Attendence_Eligibility_OR_NOT;
END //
DELIMITER ;


CALL attendence_details();



-- attendence  DETAILS FOR GIVEN STUDENT ID
DROP PROCEDURE IF EXISTS attendence_details__by_student_id;
DELIMITER //
CREATE PROCEDURE attendence_details_by_student_id (IN stu_num VARCHAR(10))
BEGIN
 SELECT student_id,course_code,Attendance_Percentage,Eligibility
 FROM Attendence_Eligibility_OR_NOT
 WHERE student_id=stu_num;
END //
DELIMITER ;


CALL attendence_details_by_student_id('TG0004');


--  Eligibility_with_attendence_and_CA for WHOLE BATCH

DROP PROCEDURE IF EXISTS Eligibility_with_attendence_and_CA_details;
DELIMITER //
CREATE PROCEDURE Eligibility_with_attendence_and_CA_details ()
BEGIN
 SELECT student_id,course_code,Both_Attendence_and_CA_Eligibility
 FROM Eligibility_with_attendence_and_CA;
END //
DELIMITER ;


CALL Eligibility_with_attendence_and_CA_details();



--  Eligibility_with_attendence_and_CA for GIVEN STUDENT ID

DROP PROCEDURE IF EXISTS Eligibility_with_attendence_and_CA_details_by_student_id;
DELIMITER //
CREATE PROCEDURE Eligibility_with_attendence_and_CA_details (IN stu_num VARCHAR(10))
BEGIN
 SELECT student_id,course_code,Both_Attendence_and_CA_Eligibility
 FROM Eligibility_with_attendence_and_CA
 WHERE student_id=stu_num;
END //
DELIMITER ;


CALL Eligibility_with_attendence_and_CA_details_by_student_id('TG0004');
