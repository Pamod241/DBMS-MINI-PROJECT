-- 1 marks details whole batch

CALL marks_details();


-- 2 MARKS DETAILS FOR EACH STUDENT (GIVEN STUDENT ID)

CALL marks_details_by_student_id('TG0001');


--  STUDENT GRADE FOR WHOLE BATCH

CALL marks_grade_details();

--  STUDENT GRADE FOR GIVEN STUDENT ID

CALL  marks_grade_details_by_student_id ('TG0015');


-- SEMESTER GPA DETAILS WHOLE BATCH 

CALL sem_gpa_details();

-- SEMESTER GPA DETAILS FOR GIVEN STUDENT ID

CALL sem_gpa_details_details_by_student_id('TG0004');


-- CURRENT GPA DETAILS WHOLE BATCH

CALL cur_gpa_details();

-- CURRENT GPA DETAILS FOR GIVEN STUDENT ID

CALL cur_gpa_details_by_student_id('TG0004');


-- attendence  DETAILS WHOLE BATCH

CALL attendence_details();

-- attendence  DETAILS FOR GIVEN STUDENT ID

CALL attendence_details_by_student_id('TG0004');

--  Eligibility_with_attendence_and_CA for WHOLE BATCH

CALL Eligibility_with_attendence_and_CA_details();


--  Eligibility_with_attendence_and_CA for GIVEN STUDENT ID

CALL Eligibility_with_attendence_and_CA_details_by_student_id('TG0004');