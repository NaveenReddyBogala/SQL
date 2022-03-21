-- table1

CREATE TABLE Worker (
	WORKER_ID numeric,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

-- table2
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

-- table3
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
 -- select * from Worker;
 
 -- select * from Bonus;
 
 -- select * from Title;
 -- 1
 select FIRST_NAME as Worker_NAME from Worker;
 -- 2
 select upper(FIRST_NAME) from Worker;
 -- 3
 select distinct DEPARTMENT from Worker;
 -- 4
 -- select substring(FIRST_NAME,1,3) from Worker;
 -- 5
 -- select instr(FIRST_NAME,'a') from Worker where FIRST_NAME='Amitabh'; 
 -- 6
 -- select rtrim(FIRST_NAME) from worker;
 -- 7
 -- select ltrim(DEPARTMENT) from worker;
 -- 8
 -- select distinct length(DEPARTMENT) from worker; 
 -- 9
 select replace(FIRST_NAME,'a','A') from worker;
 -- 10
 -- select concat(FIRST_NAME,' ',LAST_NAME) as 'COMPLETE_NAME' from worker;
 -- 11
 select * from worker order by FIRST_NAME asc;
 -- 12
select * from worker order by FIRST_NAME asc,DEPARTMENT desc;
 -- 13
 select * from worker where FIRST_NAME in('Vipul','Satish');
 -- 14
 select * from worker where FIRST_NAME not in ('Vipul','Satish');
 -- 15
 select * from worker where DEPARTMENT like 'Admin';
 -- 16
 select * from worker where FIRST_NAME like '%a%';
 -- 17
 select * from worker where FIRST_NAME like '%a';
 -- 18
 select * from worker where FIRST_NAME like '_____h';
 -- 19
 select * from worker where SALARY between 100000 and 500000;
 -- 20
 -- select * from worker where year (JOINING_DATE)=2014 and month(JOINING_DATE)=2;
 -- 21
 select count (*) from worker where DEPARTMENT='Admin';
 -- 22
 /*select concat(FIRST_NAME,' ',LAST_NAME) as Worker_NAME,SALARY
 from worker where WORKER_ID in (select
 WORKER_ID from worker where SALARY between 50000 and 100000);*/
 -- 23
 select DEPARTMENT,count(WORKER_ID) as No_Of_Workers
 from worker group by DEPARTMENT
 order by No_Of_Workers desc;
 -- 24
 select distinct W.FIRST_NAME,T.WORKER_TITLE
 from worker W inner join Title T
 on W.WORKER_ID=T.WORKER_REF_ID
 and T.WORKER_TITLE in ('Manager');
 -- 25
 select WORKER_TITLE,AFFECTED_FROM,count(*) from Title
 group by WORKER_TITLE,AFFECTED_FROM having count(*) > 1;
 -- 26
 select * from worker where WORKER_ID%2 != 0;
 -- 27
  select * from worker where WORKER_ID%2 = 0;
 -- 28 
  CREATE TABLE workerClone (
	WORKER_ID numeric,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
 INSERT INTO workerClone select * from worker;
 select * from workerClone;
 -- 29
 /*select WORKER_ID,FIRST_NAME,BONUS_AMOUNT,BONUS_DATE
 from worker left join Bonus
 on worker.WORKER_ID=Bonus.WORKER_REF_ID
 intersect
 select WORKER_ID,FIRST_NAME,BONUS_AMOUNT,BONUS_DATE
 from worker left join Bonus
 on worker.WORKER_ID=Bonus.WORKER_REF_ID;*/
 -- 30
 select * from worker
 left join Title
 where worker.WORKER_ID=Title.WORKER_REF_ID;
 -- 31
 select current_date,current_time;
 -- 32
 select * from worker limit 4 ;
 -- 33
 select SALARY from worker order by SALARY desc limit 4,1;
 -- 34
 select SALARY
 from worker w1
 where 4 = (
 select count(distinct(w2.SALARY))
 from worker w2
 where w2.SALARY >= w1.SALARY);
 -- 35
 select distinct W.WORKER_ID,W.FIRST_NAME,W.SALARY
 from worker W,worker w1
 where W.SALARY=w1.SALARY
 and w.WORKER_ID != w1.WORKER_ID;
 -- 36
 select max(SALARY) from worker
 where SALARY not in (select max(SALARY) from worker);
 -- 37
 select FIRST_NAME,DEPARTMENT from worker W where W.DEPARTMENT='HR'
 union all
 select FIRST_NAME,DEPARTMENT from worker W1 where W1.DEPARTMENT='HR';
 -- 38
 /*select WORKER_ID,FIRST_NAME,BONUS_AMOUNT,BONUS_DATE
 from worker left join Bonus
 on worker.WORKER_ID=Bonus.WORKER_REF_ID
 intersect
 select WORKER_ID,FIRST_NAME,BONUS_AMOUNT,BONUS_DATE
 from worker left join Bonus
 on worker.WORKER_ID=Bonus.WORKER_REF_ID;*/
 -- 39
 select * from worker
where WORKER_ID <= (select count(WORKER_ID)/2 from worker); 
 -- 40
select DEPARTMENT,count(WORKER_ID) as 'Number of Workers' from worker 
group by DEPARTMENT having count(WORKER_ID) < 5;
 -- 41
select DEPARTMENT,count(DEPARTMENT) as 'Number of Workers' from worker 
group by DEPARTMENT; 
 -- 42
select * from worker where WORKER_ID = (select max(WORKER_ID) from worker); 
 -- 43
 select * from worker where WORKER_ID = (select min(WORKER_ID) from worker);
 -- 44
 select * from worker where WORKER_ID  <= 5
 union
 select * from (select * from worker W order by W.WORKER_ID desc) as W1 where W1.WORKER_ID <=5;
 -- 45
select t.DEPARTMENT,t.FIRST_NAME,t.SALARY from (select max(SALARY) as Totalsalary,DEPARTMENT 
from worker group by DEPARTMENT) as TempNew
inner join worker t on TempNew.DEPARTMENT = t.DEPARTMENT
and TempNew.Totalsalary=t.SALARY;
-- 46
select distinct SALARY from worker a where 3 >= (select count(distinct SALARY) 
from worker b where a.SALARY <= b.SALARY) order by a.SALARY desc;
-- 47
select distinct SALARY from worker a where 3 >= (select count(distinct SALARY) 
from worker b where a.SALARY >= b.SALARY) order by a.SALARY desc; 
-- 48
select distinct SALARY from worker a where 5 >= (select count(distinct SALARY) 
from worker b where a.SALARY <= b.SALARY) order by a.SALARY desc;
-- 49
select DEPARTMENT,sum(SALARY) from worker group by DEPARTMENT;
-- 50
select FIRST_NAME,SALARY from worker where SALARY = (select max(SALARY) from worker);











 
 