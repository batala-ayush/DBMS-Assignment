-- -------------------------------------------STARTTT---------------------------------------------------------------
/* Q.1) Create a university database that consists of tables such as the schema diagram above
-- (SQL data definition and tuples of some tables as shown above) */

-- creating the university database
CREATE DATABASE  db_university;

-- using the university database
USE db_university;

-- SQL data definition for part of the university database:


CREATE TABLE tb_department(
	dept_name VARCHAR(20),
	building VARCHAR(15),
	budget NUMERIC(12,2),
	PRIMARY KEY(dept_name)
);
-- drop table tb_department;
CREATE TABLE tb_course(
    course_id VARCHAR(7),
    title VARCHAR(50),
    dept_name VARCHAR(20),
    credits NUMERIC(2,0),
    PRIMARY KEY(course_id),
    FOREIGN KEY (dept_name) REFERENCES tb_department(dept_name)
);
-- drop table tb_course;
CREATE TABLE tb_instructor(
    instructor_id VARCHAR(5),
    instructor_name VARCHAR(20) NOT NULL,
    dept_name VARCHAR(20),
    salary NUMERIC (8,2),
    PRIMARY KEY(instructor_id),
    FOREIGN KEY (dept_name) REFERENCES tb_department(dept_name)
);
-- drop table tb_instructor;
CREATE TABLE tb_section(
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    years NUMERIC(4,0),
    building VARCHAR(15),
    room_number VARCHAR(7),
    time_slot_id VARCHAR(4),
    PRIMARY KEY(course_id,sec_id,semester,years),
    FOREIGN KEY (course_id) REFERENCES tb_course(course_id)
);
-- drop table tb_section;
CREATE TABLE tb_teaches(
    instructor_id VARCHAR(5),
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    years NUMERIC(4,0),
    PRIMARY KEY(course_id,sec_id,semester,years),
    FOREIGN KEY (course_id,sec_id,semester,years) REFERENCES tb_section(course_id,sec_id,semester,years),
    FOREIGN KEY (instructor_id) REFERENCES tb_instructor(instructor_id)
);

-- drop table tb_teaches;

-- ----------------------------------------------------------------------------------------------------------------------

-- Q.2) Please complete SQL data definition and tuples of some tables others


CREATE TABLE tb_student(
    student_id INT,
    student_name VARCHAR(20),
    dept_name VARCHAR(20),
    tot_cred INT,
    PRIMARY KEY (student_id),
    FOREIGN KEY (dept_name) REFERENCES tb_department(dept_name)
);
-- DROP TABLE tb_student;

CREATE TABLE tb_advisor(
	student_id INT,
    instructor_id VARCHAR(5),
    PRIMARY KEY(student_id),
    FOREIGN KEY (student_id) REFERENCES tb_student(student_id),
    FOREIGN KEY (instructor_id) REFERENCES tb_instructor(instructor_id)
);
-- drop table tb_advisor;

CREATE TABLE tb_prereq(
	course_id VARCHAR(8),
    prereq_id VARCHAR(8),
    PRIMARY KEY(course_id,prereq_id),
    FOREIGN KEY (course_id) REFERENCES tb_course(course_id)
);

-- drop table tb_prereq;
CREATE TABLE tb_takes(
	student_id INT,
	course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    years NUMERIC(4,0),
    grade VARCHAR(4),
    PRIMARY KEY(student_id,course_id,sec_id,semester,years),
    FOREIGN KEY (course_id,sec_id,semester,years) REFERENCES tb_section(course_id,sec_id,semester,years),
    FOREIGN KEY (student_id) REFERENCES tb_student(student_id)
);
-- drop table tb_takes;
CREATE TABLE tb_classroom(
	building VARCHAR(15),
    room_number VARCHAR(7),
    capacity INT,
    PRIMARY KEY (building,room_number)
);
-- drop table tb_classroom;

CREATE TABLE tb_time_slot(
	time_slot_id VARCHAR(4),
    dayy VARCHAR(15),
    start_time VARCHAR(15),
    end_time VARCHAR(15),
    PRIMARY KEY(time_slot_id,dayy,start_time)
);

-- drop table tb_time_slot;

-- Adding the addition foreign keys
ALTER TABLE tb_section
ADD FOREIGN KEY(building,room_number) REFERENCES tb_classroom(building,room_number),
ADD FOREIGN KEY(time_slot_id) REFERENCES tb_time_slot(time_slot_id);


-- --------------------------------------------------------------------------------------------------------------

-- Q.3) Fillthe tuple of each table at least 10 tuples

-- inserting value in table tb_department
INSERT INTO tb_department(dept_name, building, budget)
VALUES ('Biology','Watson',90000),
	('Computer Science','Taylor',10000),
	('Elec. Eng.','Taylor',85000),
	('Finance','Painter',120000),
	('History','Painter',50000),
	('Music','Packard',80000),
	('Physics','Watson',70000);
 
--  truncate table tb_department;
-- viewing the tb_department
-- SELECT * FROM tb_department;

-- inserting data in tb_course
INSERT INTO tb_course(course_id, title, dept_name, credits)
VALUES ('BIO-101','Intro to Biology','Biology',4),
	('BIO-399','Computation Biology','Biology',3),
	('CS-101','Intro to Computer Science','Computer Science',4),
	('CS-190','Game Design','Computer Science',4),
	('CS-315','Robotics','Computer Science',3),
	('CS-319','Image Processing','Computer Science',3),
	('CS-347','Database system concepts','Computer Science',3),
	('EE-181','Intro to Digital Systems','Elec. Eng.',3),
	('FIN-201','Investment Banking','Finance',3),
	('HIS-351','World History','History',3),
    ('MU-199','Music Video Production','Music',3),
    ('BIO-301','Genetics','Biology',4),
    ('PHY-101','Physical Principles','Physics',4);


-- inserting in table tb_instructor

INSERT INTO tb_instructor(instructor_id, instructor_name, dept_name, salary)
VALUES ('10101','Srinivasan','Computer Science',65000),
	('12121','Wu','Finance',90000),
	('15151','Mozart','Music',40000),
	('22222','Einstein','Physics',95000),
	('32343','El Said','History',60000),
	('33456','Gold','Physics',87000),
	('45565','Katz','Computer Science',75000),
	('58583','Califeri','History',62000),
	('76543','Singh', 'Finance',80000),
	('76766','Crick','Biology',72000);


-- inserting in tb_student
INSERT INTO tb_student(student_id, student_name, dept_name, tot_cred)
VALUES (00128,'Zhang','Computer Science',102),
	(12345,'Shanker','Computer Science',32),
	(19991,'Brandt','History',80),
	(23121,'Chavez','Finance',110),
	(44553,'Peltier','Physics',56),
	(45678,'Levy','Physics',46),
	(54321,'Williams','Computer Science',54),
	(55739,'Sanchez','Music',38),
	(70557,'Snow','Physics',0),
	(76543,'Brown','Computer Science',58);	



-- inserting in tb_classroom
INSERT INTO tb_classroom(building, room_number, capacity)
VALUES ('Watson','514',250),
    ('Taylor','101',300),
    ('Taylor','3128',175),
    ('Taylor','120',100),
    ('Taylor','100',100),
    ('Painter','101',225),
    ('Painter','514',225),
    ('Watson','100',250);
    

-- inserting in tb_time_slot

INSERT INTO tb_time_slot(time_slot_id,dayy,start_time,end_time )
VALUES ('B','Monday','1:00','3:00'),
	('A','Sunday','2:00','4:00'),
    ('H','Tuesday','1:00','3:00'),
    ('E','Wednesday','2:00','4:00'),
    ('D','Thursday','1:00','3:00'),
    ('F','Sunday','10:00','12:00'),
    ('C','Monday','10:00','12:00');
    
    
-- inserting in tb_section

INSERT INTO tb_section(course_id, sec_id, semester, years, building, room_number, time_slot_id) 
VALUES ('BIO-101','1','Summer',2009,'Watson','514','B'),
	('BIO-301','1','Summer',2010,'Watson','514','A'),
	('CS-101','1','Fall',2009,'Taylor','101','H'),
	('CS-101','1','Spring',2010,'Taylor','101','F'),
	('CS-190','1','Spring',2009,'Taylor','3128','E'),
	('CS-190','2','Spring',2010,'Taylor','3128','A'),
	('CS-315','1','Spring',2010,'Taylor','120','D'),
	('CS-319','1','Spring',2010,'Taylor','100','B'),
	('CS-319','2','Spring',2010,'Taylor','3128','B'),
	('FIN-201','1','Spring',2010,'Painter','101','B'),
	('HIS-351','1','Spring',2010,'Painter','514','C'),
	('PHY-101','1','Fall',2009,'Watson','100','A');
        

-- inserting in tb_teaches

INSERT INTO tb_teaches(instructor_id, course_id, sec_id, semester, years)
VALUES  ('76766','BIO-101','1','Summer',2009),
	('76766','BIO-301','1','Summer',2010),
	('10101','CS-101','1','Fall',2009),
	('10101','CS-101','1','Spring',2010),
	('10101','CS-315','1','Spring',2010),
	('45565','CS-319','1','Spring',2010),
	('32343','HIS-351','1','Spring',2010),
	('12121','FIN-201','1','Spring', 2010),
	('22222','PHY-101','1','Fall',2009),
    ('10101','CS-190','1','Spring',2009);

-- inserting in tb_takes
  
INSERT INTO tb_takes(student_id, course_id, sec_id, semester, years, grade)
VALUES  (00128,'CS-101','1','Fall',2009,'13'),
	(12345,'CS-315','1','Spring',2010,'14'),
	(19991,'HIS-351','1','Spring',2010,'15'),
	(23121,'FIN-201','1','Spring',2010,'16'),
	(44553,'PHY-101','1','Fall',2009,'14'),
    ('12345','CS-190','1','Spring',2009,'15');
	
select * from tb_instructor;

-- inserting into tb_advisor

INSERT INTO tb_advisor(student_id,instructor_id)
VALUES (00128,'10101'),
	(12345,'10101'),
	(19991,'32343'),
	(23121,'12121'),
	(44553,'22222');
        
-- inserting in tb_prereq

INSERT INTO tb_prereq(course_id,prereq_id)
VALUES ('CS-101','6754'),
	('CS-315','1125'),
	('HIS-351','2365'),
	('FIN-201','5368'),
	('CS-347','6445'),
	('CS-190','5674');



-- -----------------------------------------------------------------------------------------------

-- Q.4) Write the following queries in Relational Algebra and SQL :

-- Q.4.1) Findsthe names of all instructors in the History department

-- using SQl:
SELECT instructor_name
FROM tb_instructor 
WHERE dept_name='History';

/* -- using relational algebra:
π instructor_name (σ Dept_Name = 'History' (tb_instructor)) */

-- ------------------------------------------------------------
/* Q.4.2) Findsthe instructor ID and department name of all instructors associated with a
department with budget of greater than $95,000 */
-- using SQL 
SELECT tb_instructor.instructor_id, tb_instructor.dept_Name 
FROM tb_instructor 
INNER JOIN 
tb_department ON tb_instructor.dept_name=tb_department.dept_name 
WHERE budget>95000;

/* -- using relation algebra
π instructor_id, dept_name (tb_instructor) × σ budget > 95000 (tb_department) */

-- ------------------------------------------------------------------

/* Q.4.3)Finds the names of all instructors in the Comp. Sci. department together with the
course titles of all the courses that the instructors teach */

-- using SQL
SELECT tb_instructor.instructor_name,tb_course.title
FROM tb_instructor
INNER JOIN tb_teaches ON tb_instructor.instructor_id = tb_teaches.instructor_id
INNER JOIN tb_course ON tb_teaches.course_id = tb_course.course_id
WHERE tb_instructor.dept_name = 'Computer Science';

-- using realtional algebra

-- ----------------------------------------------------------------------
-- Q.4.4) Find the names of all students who have taken the course title of “Game Design”.

-- using SQL
SELECT tb_student.student_name
FROM tb_student
INNER JOIN tb_takes ON tb_student.student_id = tb_takes.student_id
INNER JOIN tb_course ON tb_takes.course_id = tb_course.course_id
WHERE tb_course.title = 'Game Design';



-- using relational algebra


-- ---------------------------------------------------------
-- Q.4.5) For each department, find the maximum salary of instructors in that department. You
-- may assume that every department has at least one instructor.

-- using SQL

SELECT tb_instructor.dept_name, tb_instructor.instructor_name, MAX(salary)
FROM tb_instructor
GROUP BY dept_Name;
/*
-- using relational algebra
σ dept_name,instructor_name,MAX(salary) (tb_instructor) GROUPBY dept_name
*/
-- ------------------------------------------------------------------

/* Q.4.6) Find the lowest, across all departments, of the per-department maximum salary
computed by the preceding query. */

-- using SQL

WITH per_department_max_salary AS (
SELECT tb_instructor.dept_name as department_name, MAX(salary) as maximum_per_dept_salary
FROM tb_instructor
GROUP BY dept_name
)
SELECT department_name, MIN(maximum_per_dept_salary) as minimum_amoung_department
FROM per_department_max_salary;

/*
-- using relational algebra
MIN (σ MAX(salary) (tb_instructor) GROUPBY dept_name) */


-- ---------------------------------------------------------------------
-- Q.4.7) Find the ID and names of all students who do not have an advisor.

-- using SQL
SELECT tb_student.student_id, tb_student.student_name
FROM tb_student 
WHERE student_id NOT IN(
SELECT tb_advisor.student_id 
FROM tb_advisor);

/*
-- using relation algebra
π student_id, student_name (tb_student) × instructor_id IS NULL  (tb_advisor)
*/
 -- ----------------------------------- ENDDD ------------------------------------------

