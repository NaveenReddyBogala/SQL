-- create emp table
create table emp(
  empno numeric,
  name varchar,
  salary numeric,
  designation varchar,
  deptid numeric,
  location varchar,
  constraint pk_emp primary key(empno,deptid)
);

-- create dept table
create table dept(
 deptno numeric,
 deptname varchar
 -- foreign key(deptid) references emp(deptid)
);

insert into emp(empno,name,salary,designation,deptid,location)
values (1,'prasad',1000,'finance',401,'hyd');

insert into emp(empno,name,salary,designation,deptid,location)
values (2,'krishna',2000,'finance',402,'ban');

insert into emp(empno,name,salary,designation,deptid,location)
values (3,'rakesh',3000,'finance',403,'che');
 
insert into emp(empno,name,salary,designation,deptid,location)
values (4,'suresh',4000,'reports',404,'mum');

insert into emp(empno,name,salary,designation,deptid,location)
values (5,'ramesh',5000,'reports',405,'pune');

insert into emp(empno,name,salary,designation,deptid,location)
values (6,'harshitha',6000,'reports',406,'del');

insert into emp(empno,name,salary,designation,deptid,location)
values (7,'darshan',7000,'facilities',407,'hyd');

insert into emp(empno,name,salary,designation,deptid,location)
values (8,'rajath',8000,'facilities',408,'ban');

insert into emp(empno,name,salary,designation,deptid,location)
values (9,'divya',9000,'hr',409,'che');

insert into emp(empno,name,salary,designation,deptid,location)
values (10,'chetan',10000,'hr',410,'mum');

insert into dept(deptno,deptname)
values (1,'finance');

insert into dept(deptno,deptname)
values (2,'transactions');

insert into dept(deptno,deptname)
values (3,'managing');

select * from emp
where salary > 1000;

select * from emp
where designation ='hr';

select * from emp
where designation='finance';

select name from emp
where name like '%d';

select * from emp
where salary >2000 
and salary <5000;

update dept
 set deptname='hr'
 where deptname='finance';
 
 select * from dept;
 
delete from emp
 where salary <5000;
  
  select * from emp;
 
select count(name)
from emp;

select sum(salary)
from emp;