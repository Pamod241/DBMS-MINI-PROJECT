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