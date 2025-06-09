/* 
JOINS IN SQL :
 Joins is used to combine rows from two or more tables,based on a related column between them
 */
 
 USE temp;
 
 CREATE TABLE student(
 id INT PRIMARY KEY,
 name VARCHAR(50)
 );
 
INSERT INTO student VALUES(101,'Adam');
INSERT INTO student VALUES(102,'Bob');
INSERT INTO student VALUES(103,'Casey');
SELECT * FROM student;
 
 CREATE TABLE course(
 course_id INT,
 course VARCHAR(50)
 );

INSERT INTO course VALUES(102,'English');
INSERT INTO course VALUES(105,'Math');
INSERT INTO course VALUES(103,'Science');
INSERT INTO course VALUES(107,'Computer Science');

SELECT *  FROM course;

 #TYPES OF JOIN :
  #1. INNER JOIN (returns record matching values in both tables)
SELECT * FROM student INNER JOIN  course on student.id=course.course_id;

  #2. LEFT JOIN (returns all records from the left table and the match records from the right table)
SELECT * FROM student LEFT JOIN  course on student.id=course.course_id;

  #3. RIGHT JOIN (returns all the records from the right table and the match records from the left table)
SELECT * FROM student AS a RIGHT JOIN  course AS B on student.id=course.course_id;  

  #4. FULL JOIN (returns all the records when there is a match in either left or right table)
  #In SQL their is no FULL JOIN command so we use an indirect way to peform FULL JOIN with the help of UNION
SELECT * FROM student
LEFT JOIN  course on student.id=course.course_id
UNION
SELECT * FROM student 
RIGHT JOIN  course on student.id=course.course_id;

#5. SELF JOIN (It is a regular join but the table is joined with itself)
CREATE TABLE employee(
id INT NOT NULL,
name VARCHAR(50),
manager_id int
);

INSERT INTO employee VALUES(101,'adam',103);
INSERT INTO employee VALUES(102,'bob',104);
INSERT INTO employee VALUES(103,'casey',101);
INSERT INTO employee VALUES(104,'donaid',103);

SELECT * FROM employee as A JOIN employee as B on A.id=B.manager_id;

/* UNION : 
It is used to combine the result set of two or more SELECT statements
Excludes duplicates
*/

SELECT * FROM employee UNION SELECT * FROM employee;

/*
UNION ALL :
Includes duplicates
*/

SELECT * FROM employee UNION ALL SELECT * FROM employee;
