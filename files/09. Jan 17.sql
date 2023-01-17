create database January16

create table employee
(
    empId int identity(1,1),
    ename varchar(10),
    job varchar(9),
    sal int,
    deptno int
)

insert into employee
values
    ('KING', 'PRESIDENT', 5000 , 10),
    ('BLAKE', 'MANAGER', 2850, 30),
    ('CLARK', 'MANAGER', 2450, 10),
    ('JONES', 'MANAGER', 2975, 20),
    ('SCOTT', 'ANALYST', 3000, 20  ),
    ('FORD', 'ANALYST', 3000, 20 ),
    ('SMITH', 'CLERK', 800, 20),
    ('ALLEN', 'SALESMAN', 1600, 30),
    ('WARD', 'SALESMAN', 1250, 30),
    ('MARTIN', 'SALESMAN', 1250, 30),
    ('TURNER', 'SALESMAN', 1500, 30),
    ('ADAMS', 'CLERK', 1100, 20)



SELECT * from employee


-- TRIGGER

create table EmpLog
(
    logid int primary key identity(1,1),
    description varchar(500)
)


		--Insert Trigger
create trigger employee_insert 
on Employee 
for insert
as begin
    declare @eid int
    select @eid=empid from inserted

    insert into EmpLog
    values('New record with id '+cast(@eid as varchar(10))+' added at '+cast(getdate() as varchar(30)))
end
--
insert into employee values('ADAM','Developer', 3000, 5)
select * from employee
select * from EmpLog

----------------------------------------------------------------------------

		-- Delete trigger

create trigger employee_delete
on Employee 
for delete
as begin
    declare @eid int
    select @eid=empid from deleted

    insert into EmpLog values('Existing record with id '+cast(@eid as varchar(10))
+' removed  at '+cast(getdate() as varchar(30)))

end
--

delete from Employee where empid=21

select * from employee
select * from EmpLog

----------------------------------------------------------------------------


		--Update trigger
	create trigger [dbo].[tr_employee_update]
	on [dbo].[Employee] 
	after update
	as begin
	declare @id int
	declare @oldname varchar(20),@newname varchar(20)
	declare @oldjob varchar(20), @newjob varchar(20)
	declare @oldsalary decimal,@newsalary decimal
	declare @auditstr varchar(1000)

	select * into #TempTable from inserted
	while(Exists(select empid from #TempTable))
		begin
		set @auditstr=''
		select Top 1 @id=empid,@newname=ename,@newjob=job,@newsalary=sal
		from #TempTable

		select @oldname=ename,@oldjob=job,@oldsalary=sal from deleted
	
		where empid=@id
			set @auditstr='emp with id '+ cast(@id as varchar(5))+' change'
		
			if(@oldname<>@newname)
			set @auditstr=@auditstr+' old name '+@oldname +' new name '+@newname
		
			if(@oldjob<>@newjob)
			set @auditstr=@auditstr+' old job '+@oldjob +'new job '+@newjob
		
			if(@oldsalary<>@newsalary)
			set @auditstr=@auditstr+' old salary '+cast(@oldsalary as varchar(50)) +' new salary '+cast(@newsalary as varchar(50))+''
	
					insert into EmpLog values(@auditstr)
					delete from #TempTable where empid=@id
		end
	end

	update Employee set sal= sal*1.20 where empid in (1,2)


	select * from Employee
	select * from emplog

----------------------------------------------------------------------------


			--Update trigger
	create trigger employee_update
	on Employee 
	after update
	as begin
		declare @id int
		declare @oldname varchar(20),@newname varchar(20)
		declare @oldjob varchar(20), @newjob varchar(20)
		declare @oldsalary decimal,@newsalary decimal
		declare @auditstr varchar(1000)

			select * into #TempTable from inserted
			while(Exists(select empid from #TempTable))
			begin
				set @auditstr=''
				select Top 1 @id=empid,@newname=ename,@newjob=job,@newsalary=sal
				from #TempTable

				select @oldname=ename,@oldjob=job,@oldsalary=sal from deleted
	
				where empid=@id
					set @auditstr='emp with id '+ cast(@id as varchar(5))+' change'
		
					if(@oldname<>@newname)
					set @auditstr=@auditstr+' old name '+@oldname +' new name '+@newname
		
					if(@oldjob<>@newjob)
					set @auditstr=@auditstr+' old job '+@oldjob +'new job '+@newjob
		
					if(@oldsalary<>@newsalary)
					set @auditstr=@auditstr+' old salary '+cast(@oldsalary as varchar(50)) +' new salary '+cast(@newsalary as varchar(50))+''
	
							insert into EmpLog values(@auditstr)
							delete from #TempTable where empid=@id
			end
	end

	update Employee set sal= sal*1.5 where empid in (5)


	select * from Employee
	select * from emplog