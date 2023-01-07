-- CREATING A EMPLOYEE DATABASE FOR THE QUESTION

CREATE DATABASE db_employee;
USE db_employee;


-- Q1. SQL schema definition for the employee database.
-- creating the required tables

-- creating the employee table
CREATE TABLE tb_employee(
employee_name VARCHAR(255) PRIMARY KEy,
street VARCHAR(255),
city VARCHAR(255)
);
-- drop table tb_employee;

-- creating the works table
CREATE TABLE tb_works(
employee_name VARCHAR(255) PRIMARY KEY,
company_name VARCHAR(255),
salary FLOAT
);
 -- drop table tb_works;

-- creating the company table
CREATE TABLE tb_company(
company_name VARCHAR(255) PRIMARY KEY,
city VARCHAR(255)
);
-- drop table tb_company;

-- creating the manages table
CREATE TABLE tb_manages(
employee_name VARCHAR(255) PRIMARY KEY,
manager_name VARCHAR(255)
);
-- drop table tb_manages;


-- Inserting data in the tables

-- in employee table
INSERT INTO tb_employee(employee_name,street,city)
VALUES
("Ayush Batala","Suncity","Kadhaghari"),
("Mishan Thapa","Budhhanagar","New Baneshwor"),
("Prabin Bohora","Suncity","Kadhaghari"),
("Prinsa Joshi","Suryabinayak","Bhaktapur"),
("Pratima Dawadi"," Raniban","Machapokhari"),
("Nishant Uprety","Shantinagar","New Baneshwor"),
("Ankit Bk","Budhhanagar","New Baneshwor"),
("Rashmi Khadka","Babarmall ","Maithighar"),
("Pratigya Poudel","Budhhanagar","New Baneshwor"),
("Suntosh Pandey","Jadibuti","Koteshwor"),
("Gaurab Thapa","Tikapur","Kailali"),
("Deepak Puri","Tikapur","Kailali"),
("Shiwani Shah","Thapagaun","New Baneshwor"),
("Rashmi Nath","Putalisadk","Dillibazar"),
("Ramesh Jaisi","Jadibuti","Boudhha"),
("Saroj Shakya","Budhhanagar","New Baneshwor"),
("Shikhar Bhattrai","Budhhanagar","New Baneshwor"),
("Bishika Subedi","Suryabinayak","Bhaktapur"),
("Binod Sapkota","Tikapur","Kailali"),
("Dinesh Baniya Kshatri","Putalisadk","Dillibazar"),
("Praches Acharya","Budhhanagar","New Baneshwor"),
("Umesh Kanta Ghimere","Suryabinayak","Bhaktapur"),
("Anil Pudasaini","Thapagaun","New Baneshwor"),
("Kiran Chandra Dhakal","Shantinagar","New Baneshwor");

 -- truncate table tb_employee;

-- checking data entry
SELECT * FROM tb_employee;

-- in works table
INSERT INTO tb_works(employee_name,company_name,salary)
VALUES
("Ayush Batala","First Bank Corporation",50000),
("Mishan Thapa","First Bank Corporation",80000),
("Prabin Bohora","Google",90000),
("Prinsa Joshi","BTS",90000),
("Pratima Dawadi","Facebook",40000),
("Nishant Uprety","First Bank Corporation",9000),
("Ankit Bk","First Bank Corporation",40000),
("Rashmi Khadka","Facebook",30000),
("Pratigya Poudel","Small Bank Corporation",15000),
("Suntosh Pandey","First Bank Corporation",80000),
("Gaurab Thapa","Tesla",45000),
("Deepak Puri","Small Bank Corporation",5000),
("Shiwani Shah","Small Bank Corporation",12000),
("Rashmi Nath","Viber",35000),
("Ramesh Jaisi","Youtube",60000),
("Saroj Shakya","First Bank Corporation",25000),
("Shikhar Bhattrai","Google",35000),
("Bishika Subedi","BTS",80000),
("Binod Sapkota","Facebook",15000),
("Dinesh Baniya Kshatri","First Bank corporation",55000),
("Praches Acharya","Tesla",40000),
("Umesh Kanta Ghimere","Small Bank corporation",35000),
("Anil Pudasaini","Small Bank Corporation",30000),
("Kiran Chandra Dhakal","Youtube",25000);

-- truncate table tb_works; used to change data
-- checking the data entry
SELECT * FROM tb_works;

-- in company table
INSERT INTO tb_company(company_name,city)
VALUES
("First Bank Corporation","New Baneshwor"),
("Google","Bhaktapur"),
("BTS","Korea"),
("Facebook","Maithighar"),
("Small Bank Corporation","New Baneshwor"),
("Tesla","Koteshwor"),
("Viber","Dhangadi"),
("Youtube","Kadhaghari");
-- checking the data entry
SELECT * FROM tb_company;

-- in manages table
INSERT INTO tb_manages(employee_name,manager_name)
VALUES
("Ayush Batala","Saroj Shakya"),
("Mishan Thapa","Saroj Shakya"),
("Prabin Bohora","Shikhar Bhattrai"),
("Prinsa Joshi","Bishika Subedi"),
("Pratima Dawadi","Binod Sapkota"),
("Nishant Uprety","Saroj Shakya"),
("Ankit Bk","Saroj Shakya"),
("Rashmi Khadka","Binod Sapkota"),
("Pratigya Poudel","Binod Sapkota"),
("Suntosh Pandey","Dinesh Baniya Kshatri"),
("Gaurab Thapa","Praches Acharya"),
("Deepak Puri","Umesh Kanta Ghimere"),
("Shiwani Shah","Anil Pudasaini"),
("Rashmi Nath","Bishika Subedi"),
("Ramesh Jaisi","Kiran Chandra Dhakal");
-- checking the data entry
SELECT * FROM tb_manages;



-- Q2.EXPRESSION IN SQL
-- 2.a) name of all employees who work for first bank corporation
SELECT employee_name FROM tb_works
WHERE tb_works.company_name = "First Bank Corporation";

-- 2.b) name and cities of employee who work for first bank corporation
-- Using join method
SELECT tb_employee.employee_name, tb_employee.city
FROM tb_employee 
INNER JOIN tb_works ON tb_employee.employee_name = tb_works.employee_name
WHERE tb_works.company_name = "First Bank Corporation";

-- Using Subquery method
SELECT tb_employee.employee_name, tb_employee.city
FROM tb_employee
WHERE tb_employee.employee_name IN (
SELECT tb_works.employee_name
FROM tb_works
WHERE tb_works.company_name = "First Bank Corporation");

-- 2.c) name, street and cities of all the employee who work for first bank corporation and earn more than 10000
-- Using join method
SELECT tb_employee.employee_name, tb_employee.street, tb_employee.city
FROM tb_employee 
INNER JOIN tb_works ON tb_employee.employee_name = tb_works.employee_name
WHERE tb_works.company_name = "First Bank Corporation" AND tb_works.salary > 10000;

-- Using Subquery method
SELECT tb_employee.employee_name, tb_employee.street, tb_employee.city
FROM tb_employee
WHERE tb_employee.employee_name IN (
SELECT tb_works.employee_name
FROM tb_works
WHERE tb_works.company_name = "First Bank Corporation" AND tb_works.salary > 10000);

-- 2.d)employee who lives in the same cities as thier companies they work for.
-- Using join method
SELECT tb_employee.employee_name, tb_employee.street, tb_employee.city
FROM tb_employee
INNER JOIN tb_works ON tb_employee.employee_name = tb_works.employee_name
INNER JOIN tb_company ON tb_works.company_name = tb_company.company_name
WHERE tb_employee.city = tb_company.city;

-- Using Subquery method
SELECT tb_employee.employee_name, tb_employee.street, tb_employee.city
FROM tb_employee
WHERE tb_employee.employee_name IN (
SELECT tb_works.employee_name
FROM tb_works
WHERE tb_works.company_name IN (
SELECT tb_company.company_name
FROM tb_company
WHERE tb_company.city = tb_employee.city));

-- 2.e) employee who lives in same cities and on the same street as thier manager do.
-- some manager can also be employee so adding manager into employee table

-- using join

SELECT tb_manages.employee_name,tb_manages.manager_name
FROM tb_manages
INNER JOIN tb_employee AS emp ON tb_manages.employee_name = emp.employee_name
INNER JOIN tb_employee AS manag ON tb_manages.manager_name = manag.employee_name
WHERE emp.city = manag.city AND emp.street = manag.street;

-- here we created an two instances of alias for tb_employee table

-- using sub query
SELECT tb_manages.employee_name,tb_manages.manager_name 
FROM tb_manages
WHERE(
SELECT tb_employee.city
FROM tb_employee
WHERE tb_employee.employee_name = tb_manages.manager_name) = (
SELECT tb_employee.city
FROM tb_employee
WHERE tb_employee.employee_name = tb_manages.employee_name) AND (
SELECT tb_employee.street
FROM tb_employee
WHERE tb_employee.employee_name = tb_manages.manager_name) = (
SELECT tb_employee.street
FROM tb_employee
WHERE tb_employee.employee_name = tb_manages.employee_name); 





-- 2.f) employee who dont work for first bank corporation
SELECT employee_name FROM tb_works
WHERE tb_works.company_name != "First Bank Corporation";


-- 2.g) employee who can earn more than each employee of small bank corporation
-- Using join method

-- finding the minimum salary of small bank corporation
SELECT min(tb_works.salary) AS min
FROM tb_works
WHERE tb_works.company_name = "Small Bank Corporation"
GROUP BY tb_works.company_name;
-- smallest salary of SBC = 5000
-- now, 2.g solving
SELECT tb_works.employee_name, tb_works.salary,tb_works.company_name
FROM tb_works
WHERE tb_works.salary > (
SELECT min(tb_works.salary) AS min
FROM tb_works
WHERE tb_works.company_name = "Small Bank Corporation"
GROUP BY tb_works.company_name) AND tb_works.company_name !="Small Bank Corporation";

-- inserting the employee whos salary is less than 5000
INSERT INTO tb_employee(employee_name,street,city)
VALUES
("Manish ghimere","Suncity","Kadhaghari");

INSERT INTO tb_works(employee_name,company_name,salary)
VALUES
("Manish ghimere","First Bank Corporation",3000);

-- now again applying 2.g
SELECT tb_works.employee_name, tb_works.salary,tb_works.company_name
FROM tb_works
WHERE tb_works.salary > (
SELECT min(tb_works.salary) AS min
FROM tb_works
WHERE tb_works.company_name = "Small Bank Corporation"
GROUP BY tb_works.company_name) AND tb_works.company_name !="Small Bank Corporation";
-- it doesnt shows manish since his salary is less than 5000



-- 2.h) company located in every city in which small bank corporation is located
SELECT tb_company.company_name
FROM tb_company
WHERE tb_company.city IN (
SELECT tb_company.city
FROM tb_company
WHERE tb_company.company_name = "Small Bank Corporation");

-- 2.i)all the employee who can earn more than avg salary of their company
/*SELECT tb_works.company_name,avg(tb_works.salary) AS avgl
FROM tb_works
GROUP BY tb_works.company_name;*/

SELECT tb_works.employee_name, tb_works.company_name, tb_works.salary,avg_salary_of_company
FROM tb_works
INNER JOIN
(SELECT tb_works.company_name,avg(tb_works.salary) AS avg_salary_of_company
FROM tb_works
GROUP BY tb_works.company_name) AS grouped_table
ON tb_works.company_name =grouped_table.company_name
WHERE tb_works.salary > grouped_table.avg_salary_of_company;


-- 2.j) Company that have most employee
SELECT tb_works.company_name,count_table.no_of_employee
FROM tb_works
INNER JOIN
(SELECT tb_works.company_name,count(tb_works.employee_name) AS no_of_employee
FROM tb_works
GROUP BY company_name) AS count_table 
ON tb_works.company_name = count_table.company_name
ORDER BY no_of_employee DESC
LIMIT 1;



-- 2.k) Company that has smallest payroll
-- method 1
SELECT table_payroll.company_name,table_payroll.payroll
FROM
(SELECT tb_works.company_name, SUM(tb_works.salary) AS payroll
FROM tb_works
GROUP BY tb_works.company_name) AS table_payroll
ORDER BY payroll ASC
LIMIT 1;

-- method 2
SELECT tb_works.company_name,table_payroll.payroll
FROM tb_works
INNER JOIN
(SELECT tb_works.company_name,SUM(tb_works.salary) AS payroll
FROM tb_works
GROUP BY company_name) AS table_payroll
ON tb_works.company_name = table_payroll.company_name
ORDER BY table_payroll.payroll ASC
LIMIT 1;



-- 2.l) companies whose employee can earn higher salary on avg than the avg salary at FBC

/* testing the avg values
SELECT *,avg(tb_works.salary) AS avgs
FROM tb_works
GROUP BY tb_works.company_name;
 */
 SELECT average.company_name,average.avg_salary
 FROM
 (SELECT tb_works.company_name, AVG(tb_works.salary) AS avg_salary
 FROM tb_works
 GROUP BY tb_works.company_name) AS average
 WHERE average.avg_salary > (
 SELECT avg_of_FBO
 FROM (SELECT tb_works.company_name,AVG(tb_works.salary) AS avg_of_FBO
 FROM tb_works
 GROUP BY tb_works.company_name) As table_fbo
 WHERE table_fbo.company_name = "First Bank Corporation");
 
 
 
-- Q.3 Consider the relational database of Figure 5
-- Adding a foreign key in works and manages table

ALTER TABLE tb_works
ADD FOREIGN KEY (employee_name) REFERENCES tb_employee (employee_name);

ALTER TABLE tb_works
ADD FOREIGN KEY (company_name) REFERENCES tb_company (company_name);

SELECT * FROM tb_works;

ALTER TABLE tb_manages
ADD FOREIGN KEY (employee_name) REFERENCES tb_employee (employee_name);

-- 3.a) Modify the database so that Jones now lives in Newtown.
-- first adding jones in database
INSERT INTO tb_employee(employee_name,street,city)
VALUES
("jones","Suncity","Kadhaghari");

INSERT INTO tb_works(employee_name,company_name,salary)
VALUES
("jones","First Bank Corporation",50000);

SELECT * FROM tb_works;

INSERT INTO tb_manages(employee_name,manager_name)
VALUES
("jones","Saroj Shakya");

-- now modifying database so that jhon lives in Newton;
UPDATE tb_employee
SET city = "Newton"
WHERE employee_name = "jones";

-- checking the updated employee table
SELECT * FROM tb_employee;


-- 3.b)  Give all employees of First Bank Corporation a 10 percent raise.
UPDATE tb_works 
SET salary = salary * 1.1
WHERE company_name = "First Bank Corporation";

-- checking the updated work table 
SELECT * FROM tb_works;


-- 3.c) Give all managers of First Bank Corporation a 10 percent raise

-- using join
UPDATE tb_works
INNER JOIN tb_manages ON tb_manages.manager_name = tb_works.employee_name 
SET salary = salary * 1.1
WHERE tb_works.company_name = "First Bank Corporation";

-- checking the updated tables
SELECT * FROM tb_works;

-- using subquery
UPDATE tb_works 
SET salary = salary * 1.1
WHERE employee_name IN (
SELECT tb_manages.manager_name
FROM tb_manages) AND company_name = 'First Bank Corporation';

-- checking the updated table
SELECT * FROM tb_works;


-- 3.d) Give all managers of First Bank Corporation a 10 percent raise unless the salary becomes greater than $100,000; in such cases, give only a 3 percent raise.
-- using join method
UPDATE tb_works
INNER JOIN tb_manages ON tb_manages.manager_name = tb_works.employee_name 
SET salary = IF(salary < 100000 ,salary * 1.1, salary * 1.03)
WHERE tb_works.company_name = "First Bank Corporation";

-- checking the updated table
SELECT * FROM tb_works;

-- we can also see the specific maneger by following method
SELECT *
FROM tb_works
WHERE company_name = "First Bank Corporation" AND employee_name IN (
SELECT tb_manages.manager_name
FROM tb_manages);


-- 3.e)Delete all tuples in the works relation for employees of Small Bank Corporation.
-- setting the foreign key check to 0
SET foreign_key_checks = 0;
-- deleting the tuples
DELETE tb_works, tb_employee, tb_manages 
FROM tb_works
JOIN tb_employee ON tb_employee.employee_name = tb_works.employee_name
JOIN tb_manages ON tb_works.employee_name = tb_manages.employee_name 
WHERE tb_works.company_name = "Small Bank Corporation";

-- setting foreign key check to 1
SET foreign_key_checks = 1;
-- check if the tuples are deleted
SELECT * 
FROM tb_employee
JOIN tb_works ON tb_employee.employee_name = tb_works.employee_name
JOIN tb_manages ON tb_works.employee_name = tb_manages.employee_name;
