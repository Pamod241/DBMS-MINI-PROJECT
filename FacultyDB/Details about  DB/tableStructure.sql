-- desc tables

DESC admin ;              
DESC attendence ;
DESC course;
DESC dean;             
DESC department ;         
DESC lecturer ;           
DESC mark;                
DESC medical;             
DESC stu_course;          
DESC student;             
DESC technical_officer;   
DESC user ;



 -- main table
 
SELECT * FROM  admin ;              
SELECT * FROM  attendence ;
SELECT * FROM  course;
SELECT * FROM  dean;             
SELECT * FROM  department ;         
SELECT * FROM  lecturer ;           
SELECT * FROM  mark;                
SELECT * FROM  medical;             
SELECT * FROM  stu_course;          
SELECT * FROM  student;             
SELECT * FROM  technical_officer;   
SELECT * FROM  user ;
         
		 
 -- users		 
+---------+-------------------+----------------+-----------------------+
| User_id | Role              | Password       | Email                 |
+---------+-------------------+----------------+-----------------------+
| U001    | Admin             | adminpwd       | Admin@gmail.com       |
| U002    | Dean              | deanpwdd       | dean@gmail.com        |
| U003    | Lecturer          | lecturepwd     | lecturer@gmail.com    |
| U004    | Technical_Officer | techofficerpwd | techofficer@gmail.com |
| U005    | Student           | studentpwd     | student@gmail.com     |
+---------+-------------------+----------------+-----------------------+


-- view table

 SELECT * FROM  attendence_eligibility_or_not;
 SELECT * FROM  cgpa_check;
 SELECT * FROM  eligibility_with_attendence_and_ca;
 SELECT * FROM  final_marks;
 SELECT * FROM  grade_point_credit;
 SELECT * FROM  result;
 SELECT * FROM  sgpa_check;
 SELECT * FROM   student_grade;
 