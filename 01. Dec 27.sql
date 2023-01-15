-- Create DataBase
create database SkillMine

use SkillMine


	--Create Person Student
	create table Student (
		sID int,
		sName varchar(50),
		sAddress varchar(30)
	)


	--Create Employee table
	create table Employee (
		eID int,
		eName varchar(50),
		eAddress varchar(30),
		eSalary numeric(8,2)
	)



	-- Uses of Alter

		-- 1. to modify datatype or its size
		alter table Employee alter column eName varchar(30)


		-- 2. rename the column in sql server
		sp_rename 'Employee.eAddress' , 'eAdd'


		-- 3. drop the column in the table
		alter table Employee drop column eAdd


		-- 4. add new column in the table
		alter table Employee add eAdd varchar(20)

		sp_help Employee
		drop table Employee

---------------------------------------------------------------------------


-- Dept table
		create table Dept(
		deptid int primary key,
		deptname varchar(10)
		)
		sp_help Dept


-- Emp table
		create table Emp(
		empid int primary key,
		empname varchar(20) not null,
		email varchar(40) unique,
		age int check (age>18),
		country varchar(20) default 'India',
		deptid int foreign key references Dept(deptid)
		)
		sp_help Emp

--------------------------------------------------------------------------


--person table
		create table Person(
		personid int,
		name varchar(20)
		)

		alter table person alter column personid int not null
		alter table person add constraint pk_person primary key (personid)

		alter table person drop constraint pk_person

--------------------------------------------------------------------------


create table Dept1(
deptid int primary key,
deptname varchar(10)
)
sp_help Dept1

create table Emp1(
empid int primary key,
empname varchar(20) not null,
email varchar(40) unique,
age int check (age>18),
country varchar(20) default 'India',
deptid int foreign key references Dept(deptid)
)
sp_help Emp1

			-- or

create table Emp2(
empid int primary key,
empname varchar(20) not null,
email varchar(40) unique,
age int check (age>18),
country varchar(20) default 'India',
deptid int,
constraint fk_empdept foreign key (deptid) references dept(deptid)
)
sp_help Emp2

--------------------------------------------------------------------------


-- apply FK constraint on emp table for deptid col

alter table emp add constraint fk_empdept foreign key (deptid) references dept(deptid)



-- remove FK constraint
alter table emp drop constraint fk_empdept

--------------------------------------------------------------------------




-- Homework:
-- Create Customer table with all constraints

create table Customer(
Cid int primary key,
Cname varchar(20) not null,
email varchar(40) unique,
phone int,
age int check (age>18),
country varchar(20) default 'India'
)
sp_help Customer



--------------------------------------------------------------------------