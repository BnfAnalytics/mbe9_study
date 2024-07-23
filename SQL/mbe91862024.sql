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

/* Joins: To combine 2 or more tables
1. Inner Join
2. Outer/full Join
3. Left Join
4. Right Join
*/ 
# inner join
select emp.empid, firstname,age,jobtitle, salary 
from emp # Table-1
inner join empsalary # Table-2
on emp.empid=empsalary.empid
where age>30;

select *
from emp 
left join empsalary 
on emp.empid=empsalary.empid;


select *
from emp 
cross join empsalary ;
# on emp.empid=empsalary.empid;

Insert into empsalary values
(1023, 'Salesman', 45500);
Insert into empsalary values
(1001, 'Salesman', 45000);


# Union and union all
select empid,firstname,age from emp
union
select empid,jobtitle,salary from empsalary;

# Case statement(Pivot in SQL)
select* from emp;
select Firstname, Lastname,Age,
CASE 
  When age>30 THEN 'Expert'
  when age between 27 and 30 then 'Experienced'
  else 'Fresher'
  end
from emp;

/*  18/6/2024-Monday 
    Having Clause
    Update/delete data
    Partition by
    String Functions-TRIM,replace, upper,lower
    Stored Procedures
    Subqueries
*/
# Having Clause
# Aggregated functions-Sum,Avg,Max,Min, var,st.d ,count
select jobtitle,AVG(salary) as AvgSalary
from emp
join empsalary
on emp.empid=empsalary.empid
where jobtitle="salesman"
group by jobtitle
having AvgSalary>20000
order by AvgSalary;

select orderdetails.OrderID, AVG(Quantity) as AvgQuantity
from orderdetails
join orders
on orderdetails.OrderId=orders.OrderId
group by orderID;

select EmployeeID, count(orders.OrderID) as countOrderID
from orderdetails
join orders
on orderdetails.OrderId=orders.OrderId
group by EmployeeID;

# Update/delete data
select* from emp;
update emp 
set empid=1012
where firstname="Holly" AND Lastname="Flax";

update emp 
set age=31,Gender="Female"
where firstname="Holly" AND Lastname="Flax";

delete from emp
where empid=1005;
select* from emp;

# Partition by
select Firstname, Lastname,gender,salary,
 count(gender) over(partition by gender)
from emp
join empsalary
on emp.empid=empsalary.empid;

select avg(salary) over(partition by jobtitle) as avgsalary,jobtitle,salary
from emp
join empsalary
on emp.empid=empsalary.empid;

# String Functions-TRIM,replace, upper,lower

create table emperror
(empid varchar(50),
 Firstname varchar(50),
 lastname varchar(50)
 );
 
 insert into emperror values
 ('1001','Jimbo','Halbert'),
 ('   1002','Pamela','Harison'),
 ('1003    ','TOby','Albert-Fired');
 
 select*from emperror;
select empid,TRIM(empid)
from emperror;

select empid,LTRIM(empid)
from emperror;

select empid,RTRIM(empid)
from emperror;

select lastname,replace(lastname,'-Fired',''),replace(lastname,'-Fired','')
from emperror;

# Stored Procedures
# Subqueries


