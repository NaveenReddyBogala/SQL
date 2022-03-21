-- create emp table
create table emp(
  empno numeric,
  name varchar,
  salary numeric,
  designation varchar,
  deptid numeric,
  location varchar,
  constraint pk_emp primary key(empno)
);

-- create dept table
create table dept(
 deptid numeric,
 deptname varchar,
 constraint pk_dept primary key(deptid)
 foreign key(deptid) references emp(deptid)
);

insert into emp(empno,name,salary,designation,deptid,location)
values (1,'prasad',1000,'finance',401,'hyd');

insert into emp(empno,name,salary,designation,deptid,location)
values (2,'krishna',2000,'finance',402,'ban');

insert into emp(empno,name,salary,designation,deptid,location)
values (3,'rakesh',3000,'finance',403,'che');
 
insert into emp(empno,name,salary,designation,deptid,location)
values (4,'suresh',4000,'reports',403,'mum');

insert into emp(empno,name,salary,designation,deptid,location)
values (5,'ramesh',5000,'reports',402,'pune');


insert into dept(deptid,deptname)
values (401,'finance');

insert into dept(deptid,deptname)
values (402,'transactions');

insert into dept(deptid,deptname)
values (403,'managing');

select name,salary,designation,location,deptname
from emp,dept where emp.deptid=dept.deptid;

select name,salary,location,deptname from emp,dept 
where salary >3000 and emp.deptid=dept.deptid;;

select name,deptname
from emp,dept
where emp.deptid=dept.deptid;

select name,salary,designation
from emp
where salary > (select avg(salary) from emp)
order by salary desc;
