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