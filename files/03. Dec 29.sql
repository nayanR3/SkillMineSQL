select * from department

-- in operator is used to select the multiple match values
select * from department where deptno in(10,20)

-- not in --> records those are not matched
select * from department where deptno not in(10,20)


select * from employee
select * from employee where sal in(1600,1250,2850)
select * from employee where empno not in (7499,7782)

--------------------------------------------------------------------------


--Like clause & Not like clause

-- like used to match the string with specific pattern

select * from Employee where ename like 'a%' 
-- name start with 'a' & contains any no of chars

select * from Employee where ename like '%s' 
-- name end with 's'

select * from Employee where ename like '%s%' 
-- name may contains a anywhere in the string

select * from Employee where ename like '%[asr]'  
-- name contains any no of chars & ends with a|s|r

select * from Employee where ename like '[asr]%'	
-- name start with a|s|r

select * from Employee where ename like '[a-d]%' 
-- name starts with 'a' to 'd'

select * from Employee where ename like '%[a-d]' 
--name end with 'a' to 'd'

select * from Employee where ename like 'w___' 
--exact 4 length name start with w

select * from Employee where ename like '____h'	
--exact 5 length name end with h

select * from Employee where ename like '___e_' 
--exact 5 length name, 4th char is 'e'

--------------------------------------------------------------------------


-- not like
select * from Employee where ename not like 'a%'
select * from Employee where ename not like '[asr]%'

--------------------------------------------------------------------------