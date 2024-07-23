use mbe9;
select * from categories; # To extract Full Table
select* from customers;
select Customerid,city,country from customers;
select customerid,customername,city from customers;

select* 
from customers
where country='Germany' and city='Berlin';

select* 
from employees 
where lastname='King';

# Create Table
create table emp 
(empid int,Firstname varchar(50),Lastname varchar(50),Age int,Gender varchar(50)
);
select * from emp;

Insert Into emp values
(1001,'Jim','Halpert',30,'Male'),
(1002,'Pam','Sharma',30 ,'Female'),
(1003,'Dwight','Schrute',29,'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male');

select* from emp;
create table empsalary
(empid int,
jobtitle varchar(50),
salary int);

Insert into empsalary values
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);

select * from empsalary;

Insert into emp values
(1011,'Ryan','Howard',26, 'Male'),
(NULL, 'Holly','Flax',NULL,NULL),
(1013,'Darryl','Philbin',Null,'Male');

select*from emp;

/*  Joins
    Union
    Case statement
    Having Clause
    Update/delete data
    Partition by
    String Functions-TRIM,replace, upper,lower
    Stored Procedures
    Subqueries
*/










