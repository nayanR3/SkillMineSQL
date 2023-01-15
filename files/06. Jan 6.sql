CREATE DATABASE January6

create TABLE CUSTOMER
(
    CustomerID int IDENTITY(01,1) ,
    CustomerName varchar(30) not null,
    city varchar(30),
    PostalCode int,
    country varchar(30) DEFAULT 'India'
);


alter table CUSTOMER add constraint pk_ primary key (CustomerID)




INSERT INTO CUSTOMER
VALUES
    ( 'Holmes', 'London', 001110, 'UK');
INSERT INTO CUSTOMER
VALUES
    ( 'Micheal', 'New York', 100201, 'USA');
INSERT INTO CUSTOMER
VALUES
    ( 'Albert', 'New York', 100201, 'USA');
INSERT INTO CUSTOMER
VALUES
    ( 'Ravindran', 'Bangalore', 010200, 'India');
INSERT INTO CUSTOMER
VALUES
    ( 'Stuart', 'London', 001110, 'UK');
INSERT INTO CUSTOMER
VALUES
    ( 'Bolt', 'New York', 100201, 'USA');
INSERT INTO CUSTOMER
VALUES
    ( 'Fleming', 'Brisban', 800100, 'Australia');
INSERT INTO CUSTOMER
VALUES
    ( 'Jacks', 'Brisban', 800100, 'Australia');
INSERT INTO CUSTOMER
VALUES
    ( 'Yearannaidu', 'Chennai', 909808, 'India');
INSERT INTO CUSTOMER
VALUES
    ( 'Sasikant', 'Mumbai', 150191, 'India');
INSERT INTO CUSTOMER
VALUES
    ( 'Ramanathan', 'Chennai', 909808, 'India');
INSERT INTO CUSTOMER
VALUES
    ( 'Avinash', 'Mumbai', 150191, 'India'    );
INSERT INTO CUSTOMER
VALUES
    ( 'Winston', 'Brisban', 800100, 'Australia');
INSERT INTO CUSTOMER
VALUES
    ( 'Karl', 'London', 001110, 'UK');
INSERT INTO CUSTOMER
VALUES
    ( 'Shilton', 'Torento', 505050, 'Canada');
INSERT INTO CUSTOMER
VALUES
    ( 'Charles', 'Hampshair', 909009, 'UK');
INSERT INTO CUSTOMER
VALUES
    ( 'Srinivas', 'Bangalore', 010200, 'India');
INSERT INTO CUSTOMER
VALUES
    ( 'Steven', 'SanJose', 100100, 'USA');
INSERT INTO CUSTOMER
VALUES
    ( 'Karolina', 'Torento', 505050, 'Canada');
INSERT INTO CUSTOMER
VALUES
    ( 'Martin', 'Torento', 505050, 'Canada');
INSERT INTO CUSTOMER
VALUES
    ( 'Ramesh', 'Mumbai', 150191, 'India');
INSERT INTO CUSTOMER
VALUES
    ( 'Rangarappa', 'Bangalore', 010200, 'India');
INSERT INTO CUSTOMER
VALUES
    ( 'Venkatpati', 'Bangalore', 010200, 'India');
INSERT INTO CUSTOMER
VALUES
    ( 'Sundariya', 'Chennai', 909808, 'India');


SELECT *
from CUSTOMER

-----------------------------------------------------------------


--GROUP by 
SELECT country, count(CUSTOMERId) as 'count of employee'
from customer
group by country
SELECT city, count(CUSTOMERId) as 'count of city'
from customer
group by city


SELECT country , count(CUSTOMERId) as 'count of customers'
from customer
WHERE country in('India' ,'USA')
group by country
ORDER by 
count(CUSTOMERId)

-----------------------------------------------------------------

CREATE TABLE product
(
    id int IDENTITY(1,1) primary key,
    name varchar(255) NOT NULL,
    price float NOT NULL,
)

alter table product add constraint fk_ foreign key (id) references Customer(CustomerID)

INSERT into product
VALUES('Tv', 60000);
INSERT into product
VALUES('Laptop', 75000);

SELECT *
FROM product

-----------------------------------------------------------------------------------------------------------------


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
    DEPTCODE INT
);

ALTER TABLE EMPLOYEE
ADD PRIMARY KEY (EmpId);


INSERT INTO DEPARTMENT
VALUES
    ('FINANCE', 'EDINBURGH'),
    ('SOFTWARE', 'PADDINGTON'),
    ('SALES', 'MAIDSTONE'),
    ('MARKETING', 'DARLINGTON'),
    ('ADMIN', 'BIRMINGHAM');

INSERT INTO EMPLOYEE
VALUES
    ('TIM', 'ADOLF', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
    ('KIM', 'JARVIS', 'MANAGER', 7839, '1981-04-02', 3570, 0, 20),
    ('TONY', 'STARK', 'SOFTWARE ENGINEER', 7902, '1980-12-17', 2800, 0, 20),
    ('SAM', 'MILES', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
    ('KEVIN', 'HILL', 'MANAGER', 7839, '1981-06-09', 2940, 0, 10),
    ('CONNIE', 'SMITH', 'ANALYST', 7566, '1982-12-09', 3000, 0, 20),
    ('ALFRED', 'KINSLEY', 'PRESIDENT', 7566, '1981-11-17', 5000, 0, 10),
    ('PAUL', 'TIMOTHY', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
    ('JOHN', 'ASGHAR', 'SOFTWARE ENGINEER', 7788, '1983-01-12', 3100, 0, 20),
    ('ROSE', 'SUMMERS', 'TECHNICAL LEAD', 7698, '1981-12-03', 2950, 0, 20),
    ('ANDREW', 'FAULKNER', 'ANAYLYST', 7566, '1981-12-03', 3000, 0, 10),
    ('KAREN', 'MATTHEWS', 'SOFTWARE ENGINEER', 7782, '1982-01-23', 3300, 0, 20),
    ('WENDY', 'SHAWN', 'SALESMAN', 7698, '1981-02-22', 500, 0, 30),
    ('BELLA', 'SWAN', 'MANAGER', 7839, '1981-05-01', 3420, 0, 30),
    ('MADII', 'HIMBURY', 'ANALYST', 7839, '1981-05-01', 2000, 200, NULL),
    ('ATHENA', 'WILSON', 'ANALYST', 7839, '1992-06-21', 7000, 100, 50),
    ('JENNIFER', 'HUETTE', 'ANALYST', 7839, '1996-07-01', 5000, 100, 50);


select *from EMPLOYEE
select *from DEPARTMENT


SELECT job, count(EmpId) as 'count of employee'
from EMPLOYEE
group by job


SELECT e.Job , COUNT(E.empId)
FROM EMPLOYEE E
WHERE e.Job = 'MANAGER'
GROUP BY e.Job


SELECT job, COUNT(empid) as 'count of employee' from employee
WHERE Salary
in
(5000,3000,3300)
GROUP by job

-----------------------------------------------------------------


                --views in SQL


--Create a view
create view deptwise_empcount as    
select d.DeptName , count(e.empid) as 'emp count'
    from Employee e inner join DEPARTMENT d 
    on d.deptid=e.deptid
    group by d.deptname



--modify the existing view
alter view deptwise_empcount
as
    select d.deptname , count(e.empid) as 'emp count'
    from Employee e
        inner join dept d on d.deptid=e.deptid
    group by d.deptname



--call the view
select *
from deptwise_empcount



-- delete the view
drop view deptwise_empcount


create view salary_greaterthan30k
as
    select *
    from Employee
    where salary > 30000

select *
from salary_greaterthan30k
