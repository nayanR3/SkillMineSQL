--Day 2 

use SkillMine

	create table department (
	  deptno     int,   
	  dname      varchar(14),   
	  loc        varchar(13),   
	  constraint pk_dept primary key (deptno)   
	)

		insert into department (DEPTNO, DNAME, LOC) values(10, 'ACCOUNTING', 'NEW YORK')
		insert into department values(20, 'RESEARCH', 'DALLAS')
		insert into department values(30, 'SALES', 'CHICAGO')
		insert into department values(40, 'OPERATIONS', 'BOSTON')

		select * from department

--------------------------------------------------------------------------

-- table rename
	sp_rename 'employee1', 'employee' 
--------------------------------------------------------------------------


	create table employee1 (empno int, ename varchar(10), job varchar(9), sal int, deptno int,
	  constraint pk_emp primary key (empno),   
	  constraint fk_deptno foreign key (deptno) references department (deptno)   
	)

		insert into employee1 values(7839, 'KING', 'PRESIDENT', 5000 ,10)
		insert into employee1 values(7698, 'BLAKE', 'MANAGER',2850, 30)
		insert into employee1 values(7782, 'CLARK', 'MANAGER', 2450, 10)
		insert into employee1 values(7566, 'JONES', 'MANAGER',2975, 20)
		insert into employee1 values(7788, 'SCOTT', 'ANALYST',3000, 20  )
		insert into employee1 values(7902, 'FORD', 'ANALYST',3000, 20 )
		insert into employee1 values(7369, 'SMITH', 'CLERK', 800, 20)
		insert into employee1 values(7499, 'ALLEN', 'SALESMAN', 1600, 30)
		insert into employee1 values(7521, 'WARD', 'SALESMAN', 1250, 30)
		insert into employee1 values(7654, 'MARTIN', 'SALESMAN', 1250, 30)
		insert into employee1 values(7844, 'TURNER', 'SALESMAN',1500, 30)
		insert into employee1 values(7876, 'ADAMS', 'CLERK', 1100, 20)

		insert into employee values(1, 'ADAMS', 'CLERK', 1100, 20)


		select * from employee
--------------------------------------------------------------------------

--update salary of empno=7369
update Employee set sal=20000 where empno=7369
--------------------------------------------------------------------------

--delete row 
delete Employee where empno=1;
--------------------------------------------------------------------------


------------DQL 

--Select
select * from Employee
select * from Employee where sal>=3000
select empno, ename from Employee where sal>=3000
select deptno, empno, ename, job, sal from Employee where sal>=5000