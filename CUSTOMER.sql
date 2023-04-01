CREATE DATABASE COST;
SHOW DATABASES;
use COST;

CREATE TABLE COSTUMER(
id integer primary key,
cname varchar(255),
addr varchar(255),
gender char(2),
city varchar(255),
pincode integer
);

insert into COSTUMER
values (100,'guru','nipani','M','hubli',591237),
	   (101,'mahek','hubli','F','hubli',580031),
       (102,'rochan','belgum','M','hubli',52003),
       (103,'yashraj','kolhapur','M','kolhapur',48002);
insert into COSTUMER
values (100,'guru','nipani','M','hubli',591237);    
insert into COSTUMER
values(104,'akash','shemnewadi','M','Nipani',NULL);

select *from COSTUMER;

select*from COSTUMER where pincode is NULL;

select *from COSTUMER where cname like '%a%';

-- sorting
select *from COSTUMER order by id;

-- DISTINCT
select distinct city from COSTUMER ;

-- group by
select city, count(city) from COSTUMER  group by city;

create table Order_details(
	order_id integer primary key,
    delivery_date date,
    cust_id int,
    foreign key(cust_id) references COSTUMER(id) ON DELETE CASCADE
);

-- Unique & constraint

create table Account(
	id int primary key,
    Oname varchar(255) UNIQUE,
    balance int,
    constraint acc_balance_chk CHECK (balance>1000)
);

insert into Account(id,Oname,balance) 
values(1,'A',1050),
	  (2,'B',1002),
      (3,'C',2003);

drop table Account;

create table Account(
	id int primary key,
    Oname varchar(255) UNIQUE,
    balance int not null default 0
);

insert into Account(id,Oname) 
values(1,'A'),
	  (2,'B'),
      (3,'C'),
      (4,'D');
select *from Account; 

-- ADD new col
alter table Account ADD interest float not NULL default 0;

-- Modify 
alter table Account MODIFY interest double not NULL default 0;

-- Describe table
DESC Account;

-- Rename col
alter table account CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 0;

-- Drop col
alter table account DROP COLUMN saving_interest;

-- Rename table
alter table account RENAME TO account_details;

select *from account_details;

-- DML
insert into COSTUMER values(128,'fardin','dollars colony','M','hubli',580031);
-- Update
UPDATE COSTUMER SET addr='Mumbai',gender='M' where id = 128;

-- Update multiple rows
SET SQL_SAFE_UPDATES = 1;
UPDATE COSTUMER SET pincode=110000;
UPDATE COSTUMER SET pincode = pincode+1;
select *from COSTUMER;

-- DELETE a row
DELETE from COSTUMER where id = 121;

-- Foreign key use

create table Order_details(
	order_id integer primary key,
    delivery_date date,
    cust_id int,
    foreign key(cust_id) references COSTUMER(id) ON DELETE SET NULL
);
insert into Order_details values(1,'2019-03-1',100);
insert into Order_details values(4,'2019-12-1',100);
select *from Order_details;

DELETE from COSTUMER WHERE id = 100;

-- Replace
REPLACE INTO COSTUMER(id,city)
values(101,'Dharwad');
-- Insert
REPLACE INTO COSTUMER(id,cname,city)
values(133,'Ruchith','Dharwad');
select *from COSTUMER;

REPLACE into COSTUMER(id,cname,city)
	SELECT id,cname,city
	from COSTUMER WHERE id = 104;
    


    
    