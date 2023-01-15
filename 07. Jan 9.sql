use Jan9
create database Jan9

CREATE TABLE DEPARTMENT
(
    DeptId int IDENTITY(1,1),
    DeptName VARCHAR(255),
    Address VARCHAR(255)
);

ALTER TABLE DEPARTMENT
ADD PRIMARY KEY (DeptId);

CREATE TABLE EMPLOYEE
(
    EmpId int IDENTITY (1,1),
    EmpFName VARCHAR(15),
    EmpLName VARCHAR(15),
    Job VARCHAR(45),
    Manager CHAR(4),
    HireDate DATE,
    Salary int ,
    Commission INT,
    DeptId INT
);

ALTER TABLE EMPLOYEE
ADD PRIMARY KEY (EmpId);


INSERT INTO DEPARTMENT
VALUES
    ('FINANCE', 'EDINBURGH'),
    ('SOFTWARE', 'PADDINGTON'),
    ('SALES', 'MAIDSTONE'),
    ('MARKETING', 'DARLINGTON'),
    ('ADMIN', 'BIRMINGHAM'),
    ('Manager', 'BIRMINGHAM');

INSERT INTO EMPLOYEE
VALUES
    ('TIM', 'ADOLF', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 3),
    ('KIM', 'JARVIS', 'MANAGER', 7839, '1981-04-02', 3570, 0, 5),
    ('TONY', 'STARK', 'SOFTWARE ENGINEER', 7902, '1980-12-17', 2800, 0, 2),
    ('SAM', 'MILES', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 3),
    ('KEVIN', 'HILL', 'MANAGER', 7839, '1981-06-09', 2940, 0, 5),
    ('CONNIE', 'SMITH', 'ANALYST', 7566, '1982-12-09', 3000, 0, 1),
    ('ALFRED', 'KINSLEY', 'PRESIDENT', 7566, '1981-11-17', 5000, 0, 10),
    ('PAUL', 'TIMOTHY', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 3),
    ('JOHN', 'ASGHAR', 'SOFTWARE ENGINEER', 7788, '1983-01-12', 3100, 0, 2),
    ('ROSE', 'SUMMERS', 'TECHNICAL LEAD', 7698, '1981-12-03', 2950, 0, 20),
    ('ANDREW', 'FAULKNER', 'ANAYLYST', 7566, '1981-12-03', 3000, 0, 10),
    ('KAREN', 'MATTHEWS', 'SOFTWARE ENGINEER', 7782, '1982-01-23', 3300, 0, 2),
    ('WENDY', 'SHAWN', 'SALESMAN', 7698, '1981-02-22', 500, 0, 3),
    ('BELLA', 'SWAN', 'MANAGER', 7839, '1981-05-01', 3420, 0, 5),
    ('MADII', 'HIMBURY', 'ANALYST', 7839, '1981-05-01', 2000, 200,1),
    ('ATHENA', 'WILSON', 'ANALYST', 7839, '1992-06-21', 7000, 100,1),
    ('JENNIFER', 'HUETTE', 'ANALYST', 7839, '1996-07-01', 5000, 100,1);

ALTER TABLE employee ADD DeptId int

select *
from EMPLOYEE
select *
from DEPARTMENT



--1
SELECT *from employee
WHERE Salary <
(
    select AVG(Salary)from employee
    where EmpId =  
    (select DeptId from DEPARTMENT
        where deptName ='sales'
    )
)


--2
select *
from employee
where job = 
(
    select job
from employee
where EmpId=3
)


--3
select *
from employee
where Salary > 
(
    select Salary
from employee
where EmpId=12
)

select empid, salary
from employee
ORDER by Salary desc



--4
SELECT job, AVG(salary) as "Average salary"
from employee
GROUP by job



CREATE TABLE Product (id int, name varchar(50), price int)
CREATE TABLE Orders (id int, product varchar(50), sellPrice int)
INSERT into product VALUES
    (1, 'Laptop',75000),
    (2,'TV',60000),
    (3,'Tablet',60000),
    (4, 'Mobile',35000)

INSERT into Orders 
select id, name, price from Product
WHERE id IN
(
    select id from Product
    WHERE price>50000
)

select * from product
select * from Orders