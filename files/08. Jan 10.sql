CREATE DATABASE January10
use January10

CREATE TABLE DEPARTMENT
(
    DeptId int IDENTITY(1,1),
    DeptName VARCHAR(255),
    Address VARCHAR(255)
);

ALTER TABLE DEPARTMENT
ADD PRIMARY KEY (DeptId);
--------------------------------------------------------------------------


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
--------------------------------------------------------------------------

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
    ('MADII', 'HIMBURY', 'ANALYST', 7839, '1981-05-01', 2000, 200, 1),
    ('ATHENA', 'WILSON', 'ANALYST', 7839, '1992-06-21', 7000, 100, 1),
    ('JENNIFER', 'HUETTE', 'ANALYST', 7839, '1996-07-01', 5000, 100, 1);

ALTER TABLE employee ADD DeptId int

select *
from EMPLOYEE
select *
from DEPARTMENT
--------------------------------------------------------------------------



----------------------Built-in functions------------

--1 substring
select SUBSTRING(EmpFName,2,5) as Name
from Employee


--2 concat
SELECT CONCAT(empFName, '  ', empLname) as 'Full Name'
from Employee


--3. len
select len(EmpFName) as emplength
from employee


-- 4. upper, lower
select UPPER(empfname) as empFname, lower(EmpLName)as empLname
from Employee


--5. TRIM -> remove white space from L & R side , 
-- LTRIM->remove white space from Left side, 
-- RTRIM ->remove white space from Right side
select TRIM(empfname)
from Employee


--6. Reverse
select REVERSE(empfname) as tempname
from Employee


-- 7 round
select round(salary,2)
from Employee



-- time date
select CURRENT_TIMESTAMP
select cast(CURRENT_TIMESTAMP as date) as 'todays date'
select cast(CURRENT_TIMESTAMP as time) as 'current time'
select cast(GETDATE() as date) as 'todays date'
select cast(GETDATE() as time) as 'current time'

select cast(salary as varchar(20)) as 'str salary'
from Employee
-- .ToString()


-- isnull --> if any null value found then replace with new word or value
select empfname, EmpLName, Salary
from Employee

select empfname, EmpLName, ISNULL(job,'Not assigned') as 'job'
from Employee

--product price  qty  total (not work)
-- select isnull(price,1000), ISNULL(qty,'NA'), price *(isnull(qty,1))

--------------------------------------------------------------------------

SELECT *
FROM employee



---------- function --------------

--1

create function Addition(@a int,@b int)
returns int as 
begin
    declare @sum int
    set @sum=@a+@b
    return @sum
end

select dbo.Addition(77,123) as 'Sum' 


--------------------------------------------------------------------------

--2 

create function GetEmpNameById(@id int)
returns varchar(20)
as begin
    return (select empfname
    from Employee
    where empid=@id)
end

select dbo.GetEmpNameById(12) as 'empfname'


--------------------------------------------------------------------------

--3

create function GetEmpDetails(@id int)
returns table
as 
return (select *
from Employee
where empid=@id)


select *from dbo.GetEmpDetails(5)


--------------------------------------------------------------------------


-- Create user defined
-- function to calculate salary hike by 15 % & display emp salary & new salary
-- (scalar function)
-- Display empname, salary as old salary & salary as new salary from emp table

create function GetSalaryHike(@salary int)
returns int
as begin
    DECLARE @SalaryHike int
    set @SalaryHike = @salary+(@salary*0.15)
    return @SalaryHike
end

select empfname, emplname, salary as 'old salary',
dbo.GetSalaryHike(salary) as 'new salary 15% hike' from EMPLOYEE


--------------------------------------------------------------------------


create function GetSalaryHike1(@salary int)
returns int
as begin
    DECLARE @SalaryHike int
    set @SalaryHike = @salary*1.15
    return @SalaryHike
end

select empfname, emplname, salary as 'old salary',
dbo.GetSalaryHike1(salary) as 'new salary 15% hike' from EMPLOYEE


--------------------------------------------------------------------------