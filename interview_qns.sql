create database interview;
use interview;

CREATE TABLE worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001,'GURU','KAMAT','100000','24-01-24 09.00.00','HR'),
(002,'MEHEK','JAIN','1000000','01-01-24 09.00.00','AI'),
(003,'ROCHAN','BACHARI','100000','24-01-24 09.00.00','HR'),
(004,'AKASH','KAMBLE','20000','19-01-24 09.00.00','WD'),
(005,'DIKSHIT','N','900900','24-10-24 09.00.00','AI'),
(006,'TEJAS','AVEN','23500','24-12-24 09.00.00','AI'),
(007,'RUCHITH','TIL','94380','20-10-24 09.00.00','NVIDIA'),
(008,'VINAY','JANEWAD','542100','16-10-24 09.00.00','NVIDIA');

select *from worker;

CREATE TABLE Bonus(
	WORKER_REF_ID INT ,
    BONUS_AMOUNT INT(15),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID ) REFERENCES worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus 
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001,'1000','24-01-24'),
(002,'2000','01-01-24'),
(003,'1000','24-01-24'),
(001,'4500','24-01-24'),
(002,'32000','01-01-24');

CREATE TABLE Title(
	WORKER_REF_ID INT ,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001,'MANAGER','24-01-24 09.00.00'),
(002,'EXECUTIVE','01-01-24 09.00.00'),
(008,'EXECUTIVE','24-01-24 09.00.00'),
(005,'MANAGER','24-01-24 09.00.00'),
(004,'AST.MANAGER','24-01-24 09.00.00'),
(007,'EXECUTIVE','24-01-24 09.00.00');

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME as worker_name from worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in lower case.
select lower(first_name) from worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from worker;
-- group by

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table
select substring(first_name,1,3) from worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘h’) in the first name column ‘Mehek’ from Worker table.
select INSTR(first_name,'H') from worker where first_name = 'MEHEK';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(first_name) from worker;		

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select LTRIM(first_name) from worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct department, LENGTH(department) from worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(first_name,'A','a') from worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
select concat(first_name, ' ', last_name) as complete_name from worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select *from worker order by first_name;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by first_name, department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker where first_name in ('GURU','MEHEK');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where first_name NOT IN ('GURU','MEHEK');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
select * from worker where department like 'AI%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where first_name like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker where first_name LIKE '_____n';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select *from worker where salary between 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select *from worker where YEAR(JOINING_DATE) = 2019 and MONTH(JOINING_DATE)=01;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘AI’.
select department,count(*) from worker where department = 'AI';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(first_name, ' ',last_name) from worker where salary between 50000 and 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department, count(worker_id) as no_of_worker from worker group by department
order by count(worker_id) desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select w.* from worker as w INNER JOIN title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'Manager'; 

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
select worker_title, count(*) as count from title group by worker_title having count>1;

-- Q-26. Write an SQL query to show only odd rows from a table.
-- select * from worker where MOD (WORKER_ID, 2) != 0; 
select * from worker where MOD(worker_id,2)!=0;

-- Q-27. Write an SQL query to show only even rows from a table. 
select * from worker where MOD (WORKER_ID, 2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
create table worker_clone like worker;
insert into worker_clone select * from worker;
select * from worker_clone;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select worker.* from worker inner join worker_clone using(worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
select * from worker left join worker_clone using(worker_id) where worker_clone.worker_id is null;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
select curdate();
select now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
select * from worker order by salary desc LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker order by salary desc LIMIT 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
select salary from worker w1
where 4 = (
select count(distinct (w2.salary))
from worker w2
where w2.salary >= w1.salary 
);
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select w1.*from worker w1, worker w2 where w1.salary = w2.salary and w1.worker_id!=w2.worker_id;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
select max(salary) from worker
where salary not in (select max(salary) from worker);

-- Q-37. Write an SQL query to show one row twice in results from a table.
select *from worker
UNION all
select * from worker order by worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
select * from worker where worker_id not in (select worker_ref_id from bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from worker where worker_id <=(select count(worker_id)/2 from worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
select department,count(department) as c from worker group by department having c<4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department,count(department) as c from worker group by department;

-- Q-42. Write an SQL query to show the last record from a table.
select * from worker where worker_id = (select max(worker_id) from worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
select * from worker where worker_id = (select min(worker_id) from worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.
(select * from worker order by worker_id desc limit 5) order by worker_id;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select w.department, w.first_name, w.salary from
 (select max(salary) as maxsal, department from worker group by department) temp
inner join worker w on temp.department = w.department and temp.maxsal = w.salary;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
select distinct salary from worker w1
where 3 >= (select count(distinct salary) from worker w2 where w1.salary <= w2.salary) order by w1.salary desc;
-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.
select distinct salary from worker order by salary desc limit 3;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
select distinct salary from worker w1
where 3 >= (select count(distinct salary) from worker w2 where w1.salary >= w2.salary) order by w1.salary desc;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
select distinct salary from worker w1
where n >= (select count(distinct salary) from worker w2 where w1.salary <= w2.salary) order by w1.salary desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department , sum(salary) as depSal from worker group by department order by depSal desc;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name,salary from worker where salary = (select max(salary) from worker);


-- remove reversed no.
create table pairs(
a int,
b int
);

insert into pairs values(1,2),(2,4),(2,1),(3,2),(4,2),(5,6),(6,5),(7,8);
select * from pairs;

-- Method 1:
select lt.* from pairs lt left join pairs rt on lt.a = rt.b and lt.b = rt.a
where rt.a is null or lt.a<rt.a;





