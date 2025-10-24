-- 1 result 
drop view  IF EXISTS  Result;

CREATE VIEW Result AS SELECT mark_id,Mark.student_id,course_code,
  (( (quiz_1 + quiz_2 + quiz_3) - LEAST(quiz_1, quiz_2, quiz_3)) * 0.10)  AS marks_of_best_two_quizes,
  (assesment *0.05) AS Assesment_marks,(mid *0.20) AS mid_new,
  
  ( (( (quiz_1 + quiz_2 + quiz_3) - LEAST(quiz_1, quiz_2, quiz_3)) * 0.10) +  (assesment *0.05) + (mid *0.20)) AS Final_CA,
CASE
 
  WHEN
  ( (( (quiz_1 + quiz_2 + quiz_3) - LEAST(quiz_1, quiz_2, quiz_3)) * 0.10) +  (assesment *0.05) + (mid *0.20)) >=16  THEN 'EL'
  
  ELSE  'Not Eligible'
  
  END  AS  CA_Eligibility,
  
  

  (end * 0.6) AS end_new,
  
   CASE 
  when 
     (end * 0.6) >= 21
  THEN 'ESA PASS'
  ELSE 
    'ESA FAIL'  END AS END_Eligibility
  
  FROM Mark 
  INNER JOIN Student ON Mark.student_id = Student.Reg_no 
ORDER BY  Student.Reg_no  ASC ;




-- 2 final marks ---

DROP VIEW IF EXISTS Final_Marks;

CREATE VIEW Final_Marks AS
SELECT 
    m.student_id AS student_id,
    m.course_code AS course_code,
    CASE
        WHEN c.CA_Eligibility = 'EL' THEN
            CASE
                WHEN c.END_Eligibility = 'ESA PASS' THEN 
                    c.end_new + c.Final_CA
                ELSE 'ESA Fail'
            END
        ELSE 'CA Fail'
    END AS Final_Marks
FROM 
    mark m
INNER JOIN 
    Result c 
    ON m.mark_id = c.mark_id 
    
ORDER BY 
    m.student_id ASC;

SELECT * FROM Final_Marks ;


-- find grade --


DROP VIEW IF EXISTS Student_grade;
CREATE VIEW Student_grade AS SELECT f. student_id,f.course_code,c.Credit,f.Final_Marks,

 CASE
        WHEN f.Final_Marks >= 85 AND f.Final_Marks <= 100 THEN 'A+'
        WHEN f.Final_Marks >= 75 AND f.Final_Marks < 85 THEN 'A'
        WHEN f.Final_Marks >= 70 AND f.Final_Marks < 75 THEN 'A-'
        WHEN f.Final_Marks >= 65 AND f.Final_Marks < 70 THEN 'B+'
        WHEN f.Final_Marks >= 60 AND f.Final_Marks < 65 THEN 'B'
        WHEN f.Final_Marks >= 55 AND f.Final_Marks < 60 THEN 'B-'
        WHEN f.Final_Marks >= 50 AND f.Final_Marks < 55 THEN 'C+'
        WHEN f.Final_Marks >= 45 AND f.Final_Marks < 50 THEN 'C'
        WHEN f.Final_Marks >= 40 AND f.Final_Marks < 45 THEN 'C-'
        WHEN f.Final_Marks >= 35 AND f.Final_Marks < 40 THEN 'D'
        WHEN f.Final_Marks >= 0 AND f.Final_Marks < 35 THEN 'E'
    END AS Grade,

    CASE
        WHEN f.Final_Marks >= 85 AND f.Final_Marks <= 100 THEN 4.0
        WHEN f.Final_Marks >= 75 AND f.Final_Marks < 85 THEN 4.0
        WHEN f.Final_Marks >= 70 AND f.Final_Marks < 75 THEN 3.7
        WHEN f.Final_Marks >= 65 AND f.Final_Marks < 70 THEN 3.3
        WHEN f.Final_Marks >= 60 AND f.Final_Marks < 65 THEN 3.0
        WHEN f.Final_Marks >= 55 AND f.Final_Marks < 60 THEN 2.7
        WHEN f.Final_Marks >= 50 AND f.Final_Marks < 55 THEN 2.3
        WHEN f.Final_Marks >= 45 AND f.Final_Marks < 50 THEN 2.0
        WHEN f.Final_Marks >= 40 AND f.Final_Marks < 45 THEN 1.7
        WHEN f.Final_Marks >= 35 AND f.Final_Marks < 40 THEN 1.3
        WHEN f.Final_Marks >= 0 AND f.Final_Marks < 35 THEN 0.0
    END AS Grade_Point
	
	from Final_Marks f 
	
	INNER JOIN Course c ON c.C_code = f.course_code ;


-- Grade Credit of students

drop view if exists Grade_Point_Credit;
CREATE VIEW Grade_Point_Credit  AS 

SELECT  student_id,Credit,Course_code,(Grade_Point * Credit) AS pointCreditvalue FROM 
Student_grade ;


-- Attendence Eligibility or NOT

drop view if exists Attendence_Eligibility_OR_NOT;
CREATE VIEW Attendence_Eligibility_OR_NOT AS
    SELECT
     student_id,
     course_code,
        ROUND(COUNT(CASE WHEN att_state = 'Present' OR medical_id IS NOT NULL THEN 1 END) * 100.0 / 15,2) AS Attendance_Percentage,
        IF(COUNT(CASE WHEN att_state = 'Present' OR medical_id IS NOT NULL THEN 1 END) * 100.0 / 15 >= 80, 'Eligible', 'Not Eligible') AS Eligibility
    FROM
        Attendence
    GROUP BY
        student_id, course_code
	 ORDER BY student_id ASC;




