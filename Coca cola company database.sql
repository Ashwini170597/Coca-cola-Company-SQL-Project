--Creating a Database
Create Database CocaCola

--Deleting a Database
Drop database CocaCola

--Activating the Database
Use CocaCola

--Create Table
Create Table Customer_details(id int,name varchar(10),mobile_number varchar(10))

--Seeing the Table
    
select * from Customer_details

--Inserting values in the table

insert into Customer_details values (1,'Ram','8951567425')
insert into Customer_details values (2,'Sita','8951567426')
insert into Customer_details values (3,'Shyam','8951567427')
insert into Customer_details Values (4,'Sivom','8951567421')
insert into Customer_details Values (5,'Shaurya','8951567423')
insert into Customer_details Values (106,'Shaumya rajnikanth','8951561233')
  

                   

Create Table Customer_info(id int,product varchar(10))
                  
insert into Customer_info Values (1,'Diet Coke')
insert into Customer_info Values (2,'Coke')
insert into Customer_info Values (3,'Pepsi')
insert into Customer_info Values (7,'7up')
insert into Customer_info Values (8,'Sprite')

Select * from Customer_info

--Select * from Parent table inner join Child Table on Parent table.key=child table .key

Select * from Customer_details inner join Customer_info on Customer_details.id=Customer_info.id
Select * from Customer_details left join Customer_info on Customer_details.id=Customer_info.id
Select * from Customer_details right join Customer_info on Customer_details.id=Customer_info.id
Select * from Customer_details full outer join Customer_info on Customer_details.id=Customer_info.id


-- Truncating the Table 
Truncate table Customer_details

--Dropping the Table 
Drop Table Customer_details

--Fetching Certain Column
Select mobile_number from Customer_details

--Giving Condition to the Table to fetch the required data
Select * from Customer_details where id =2

--Deleting the Data 
Delete from Customer_details where id = 6 or id =5
Select * from Customer_details

--Giving multiple Condition to the table
Select * from Customer_details where id>2 and name ='Sivom'

Select * from Customer_details where id>2 or name = 'Ram'

Select * from Customer_details where not name ='Ram'

--Updating the data in the table 
 Update Customer_details set id = 103 Where name ='Sivom'
 Update Customer_details set id = 101 Where name ='Ram'
 Update Customer_details set id = 102 Where name ='Sita'
  Update Customer_details set id = 104 Where name ='Shyam'

--Altering the table
Alter Table Customer_details alter Column name varchar(30)
EXEC sp_rename 'Customer_details.name','Candidate_name','COLUMN'
EXEC sp_rename 'Customer_details.Candidate_name','name','COLUMN'

--Aggregate Function and Alias

Create Table Customer_deta(id int,Sales float)
Select * from Customer_deta
insert into Customer_deta values (1,23.29)
insert into Customer_deta values (2,22.19)
insert into Customer_deta values (3,24.79)
insert into Customer_deta values (4,25.89)
insert into Customer_deta values (5,22.69)
insert into Customer_deta Values (7,Null)

Select Sum(Sales) as 'Sum of Sales' from Customer_deta
Select Min(Sales) as 'Min of Sales' from Customer_deta
Select Max(Sales) as 'Max of Sales' from Customer_deta
Select AVG(Sales) as 'Average of Sales' from Customer_deta
Select Count(id) as 'Count of Id' from Customer_deta

--Like Operator 
Select * from Customer_details where name like '%m'
Select * from Customer_details where name like 'R%'
Select * from Customer_details where name like 'S%a'
Select * from Customer_details where name like 'S__a'

--In Operator 
Select * from Customer_details where name in ('Ram','Sivom')
Select * from Customer_details where id in (102,103)

--Between Operator 
Select * from Customer_deta where Sales between 23 and 25

--Union
Select * from Customer_deta

Create Table Customer_data(id int,Sales float)
Select * from Customer_data
insert into Customer_data values (8,27.28)
insert into Customer_data values (9,29.13)             
insert into Customer_data values (6,26.71)

Create Table Customer_data_1 (id int, Sales float)
select * from Customer_data_1
insert into Customer_data_1 values (11, 34.50)
insert into Customer_data_1 values (12, 35.50)
insert into Customer_data_1 values (13, 36.50)


Select * from Customer_deta
Union
Select * from Customer_data
Union
Select * from Customer_data_1

--Sorting 

Select * from Customer_details order by name asc

Select * from Customer_details order by name desc

--Importing excel data
select * from [dbo].[Orders$]
select * from [dbo].[Region_Cost$]
select * from [dbo].[Returns$]
select * from [dbo].[Users$]
select * from [dbo].['Orders Weekly$']

/*join table orders, region_cost, users, returns*/
/*Do union between oders and orders weekly*/
/*jAMES WAS ASKED BY HIS MANAGER to get all the customer names in orders table starting with A and ends with E and sort the table using sales column*/


Select * from [dbo].[Orders$] inner join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region inner join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]= [dbo].[Returns$].[Order ID] inner join [dbo].[Users$] on [dbo].[Orders$].Region=[dbo].[Users$].Region where Cost=2000000 and Profit>0 and [Order Priority]='High' order by Sales Desc  
Select * from [dbo].[Orders$] left join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region left join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]= [dbo].[Returns$].[Order ID] left join [dbo].[Users$] on [dbo].[Orders$].Region=[dbo].[Users$].Region where Cost=2000000 and Profit>0 and [Order Priority]='High' order by Sales Desc  
Select * from [dbo].[Orders$] right join[dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region right join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]= [dbo].[Returns$].[Order ID] right join [dbo].[Users$] on [dbo].[Orders$].Region=[dbo].[Users$].Region where Cost=2000000 and Profit>0 and [Order Priority]='High' order by Sales Desc  
Select * from [dbo].[Orders$] full outer join [dbo].[Region_Cost$] on [dbo].[Orders$].Region=[dbo].[Region_Cost$].Region full outer join [dbo].[Returns$] on [dbo].[Orders$].[Order ID]= [dbo].[Returns$].[Order ID] full outer join [dbo].[Users$] on [dbo].[Orders$].Region=[dbo].[Users$].Region where Cost=2000000 and Profit>0 and [Order Priority]='High' order by Sales Desc  


select * from [dbo].[Orders$] 
union
select * from [dbo].['Orders Weekly$'] 



select * from [dbo].[Orders$] where [Customer Name] like 'A%e'
select * from [dbo].[Orders$] order by [Sales] Desc



--CTE(COMMON TABLE EXPRESSION) 
WITH Output_1 as (select * from [dbo].[Orders$] 
union
select * from [dbo].['Orders Weekly$'] ) select * from Output_1 where [Order Priority]='Medium' order by Sales Desc   
       

--Creating a view table(A view can not be altered)
Create view V1 as (select * from [dbo].[Orders$] 
union
select * from [dbo].['Orders Weekly$'] )

select * from V1 where [Order Priority]='Medium' order by Sales Desc



--Group by (Group by can not function without any aggregation function)
select region, sum (sales) as 'sum of sales'  from Orders$ group by Region order by Region Asc

--Having clause (Having caluse can not function without Group by or any aggregate function)
select region, sum (sales) as 'sum of sales'  from Orders$ group by Region  having region='South' order by Region Asc 



Create Table Customer__details(id int,name varchar(10),Age varchar(10) )
             
Select * from Customer__details

Insert into Customer__details values (1, 'Kajal', 23)
Insert into Customer__details values (2, 'Durga', 33)
Insert into Customer__details values (3, 'Payal', 53)
Insert into Customer__details values (4, 'Vimal', 93)
Insert into Customer__details values (5, 'Sejal', 33)

-- Inserting a column 
Alter Table Customer__details add salary Int 

--Updating the values in salary column
Update Customer__details set Salary=500000 where Name= 'Kajal'

--Dropping the column
Alter Table Customer__details drop column salary

--Rank 
Select * , RANK() OVER (Order by Age Desc ) As Rank From Customer__details 

--Dense rank
Select * , DENSE_RANK() Over (Order by Age Desc) As DENSE_RANK From Customer__details 

--Row number 
Select * , ROW_NUMBER() Over (Order by Age Desc) As ROW_NUMBER From Customer__details

--Finding out 2nd highest age person
With output as (
Select * , DENSE_RANK() Over (Order by Age Desc) As DENSE_RANK From Customer__details ) Select * from output where DENSE_RANK=2


--Finding the 10th row data
With output as (
Select * , ROW_NUMBER() Over (Order by Age Desc) As ROW_NUMBER From Customer__details) Select *From output where ROW_NUMBER=10


--Row number and partition output
Select * , ROW_NUMBER() Over (partition by name Order by Age Desc) As ROW_NUMBER From Customer__details

--Deleting duplicates 
With output as (
Select * , ROW_NUMBER() Over (partition by name Order by Age Desc) As ROW_NUMBER From Customer__details) delete from output where ROW_NUMBER>1


--Date time function
Select CURRENT_TIMESTAMP 
Select day ('2023-05-21')
Select GETDATE ()
Select GETUTCDATE()
Select ISDATE('2023-05-21')
Select MONTH('2023-05-21')
Select YEAR('2023-05-21')
Select SYSDATETIME()


--System secondary function
Select SESSION_USER
Select SYSTEM_USER
Select USER_NAME() 
Select Coalesce(null,'akshita',null,'ashwini','hema')
Select convert (int ,26.85)
select CONVERT(float, 26.85)

--numeric function
Select CEILING (26.85) 
Select CEILING (26.15)
Select FLOOR (26.85) 
Select FLOOR (26.15)
select ROUND (26.85,0)
select POWER(2,3) 
select SQRT(16)
SELECT SIN(45)
SELECT TAN(100)
SELECT COS(45)
SELECT ACOS(0.5)
SELECT ASIN(1)
SELECT ATAN(0.45)
SELECT ABS(-18)
SELECT ABS(17)
SELECT LOG (2)
SELECT LOG10(10)
SELECT RAND()
SELECT RAND(100)
SELECT SIGN(-9)
SELECT SIGN(9)

             
--string function
select DATALENGTH('ashwini')
select LEFT('ashwini',3)
select RIGHT('ashwini',4)
select UPPER('ashwini')
select LOWER('ASHWINI')
select REVERSE('ashwini')
select SUBSTRING('ashwini',4,3)
select LTRIM('  soham')
select RTRIM('soham  ')
select CONCAT('ashwini',':','kamble')


--constrain 
create table employee (id int primary key identity ,name varchar(10), gender_id int)
select * from employee
insert into employee values ('ram',1)
insert into employee values ('radha',2)
insert into employee values ('sita',2)
insert into employee values ('krishna',1)
insert into employee values ('leena',2)

--IIf statements
Select name ,gender_id,IIF(gender_id=1,'male','female') as gender from employee

--Case statements
Select name,gender_id,case when gender_id=2 then 'female' else 'male' end as gender from employee


--Version 
Select @@VERSION

--SPID
SELECT @@SPID

--Language name
Select @@LANGID
select @@LANGUAGE

--Max connection
select @@CONNECTIONS
select @@MAX_CONNECTIONS

--Max precision
select @@MAX_PRECISION

--Trasactional data
Declare @mark int = 50
if @mark>=50
begin 
print 'congratulation';
print 'You have pass the examination';
end 
else 
begin
print'You failed';
print'Better luck next time';
end

--else if statments
Declare @total_mark int =990
if @total_mark>=900
begin
print 'congratulation, you are eligible for full scholarship'
end
else if @total_mark>=800
begin
print'congratulation you are eligible for 50% scholarship'
end
else if @total_mark>=750
begin
print'Congratulations you are eligible for 10% scholarship'
end
else
begin
print'Sorry, you are not eligible for scholarship'
end



--Go to statement
Declare @marks int 
set @marks = 39
if @marks>=50
Goto Pass
if @marks<50
goto Fail
Pass:
Print 'Congratulations you are pass'
Return
Fail:
Print 'Sorry better luck next time'
Return
Go


--Creating calculated fields and advanced constrain
Create table employee_11(Customer_ID int not null primary key identity ,Customer_1name varchar(20) not null, 
Customer_2name varchar(20) not null, Age int)

Select * from employee_11 

Insert into employee_11 values ('Arun','Kumar',46)
Insert into employee_11 values (Null,'Kumar',46)
Insert into employee_11 values ('Arun',Null,46)
Insert into employee_11 values ('Ashwini','Kamble',Null)
Insert into employee_11 values ('shankar','Jadhav',36)
Insert into employee_11 values ('Akshita','Parab',26)
Insert into employee_11 values ('Prerana','Mali',16)
Insert into employee_11 values ('Akansha','Tiwari',66)
Insert into employee_11 values ('Arpita','Kanal',46)

Update employee_11 set Age=46 where Customer_ID=4
Update employee_11 set Customer_ID=2 where Customer_1name='Ashwini'

Select * , CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11
With output as (
Select * , CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11) 
Select Customer_ID,[Full Name],Age from output

--Store procedure
Create procedure P1 as With output as (
Select * , CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11) 
Select Customer_ID,[Full Name],Age from output

EXEC P1

Select *,(Age*1000) as 'Salary',CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11

With table_1 as ( Select *,(Age*1000) as 'Salary',CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11)
Select Customer_ID,[Full Name],Age,Salary from table_1

Create procedure  P2 as with table_1 as (
Select *,(Age*1000) as 'Salary',CONCAT([Customer_1name],' ',[Customer_2name]) as 'Full Name' from employee_11)
Select Customer_ID,[Full Name],Age,Salary from table_1 
EXEC P2

Drop P2

--Trigger
Create table mployee_12(Employee_ID int Identity, Employee_new VARCHAR(30), Employee_salary Decimal(10,2))

Insert into mployee_12 values('Dharma',12345.12)
Insert into mployee_12 values('Kajal',12235.32)
Insert into mployee_12 values('Danish',12445.22)
Insert into mployee_12 values('Deva',12125.92)
Insert into mployee_12 values('Dhaval',12445.82)
Insert into mployee_12 values('Ashwini',19945.62)
Insert into mployee_12 values('Desy',12545.82)

Select * from mployee_12

Create table Employee_test_audit(Employee_ID int, Employee_new varchar(30), Employee_salary decimal(10,2),audit_action varchar(30),audit_timestamp datetime)
select *from Employee_test_audit
Create trigger Targetafterinsersion on mployee_12
for insert as 
declare @empid int; 
declare @empname varchar(30);
declare @empsal decimal(10,2);
declare @audit_action varchar(30);
select @empid= i.Employee_ID from inserted i;
select @empname= i.Employee_new from inserted i;
select @empsal= i.Employee_salary from inserted i;
set @audit_action= 'Action has been perform and the record has been inserted';
Insert into Employee_test_audit(Employee_ID, Employee_new, Employee_salary, audit_action, audit_timestamp)
values (@empid,@empname,@empsal,@audit_action, GETDATE());
print 'The triggre has been fired and the records are update in the second table'


go

--Lead and lag

create table Employee@12(Name varchar(30), Salary int)

insert into Employee@12 values ('leela',3000300)
insert into Employee@12 values ('Ram',3099900)
insert into Employee@12 values ('Jaya',3004440)

select * from Employee@12
select *, LAG(Salary) over (Order by salary) as 'previous_lag' from Employee@12

select *, LEAD(salary) over (order by salary) as 'Previous lead' from Employee@12


--Create a Database
Create database Airline
select * from [dbo].[Airline1$]
select * from [dbo].[Airline2$]

--Creating calculated field
Select *, ('Airline1') as Airline_name from [dbo].[Airline1$] 
union
Select *, ('Airline2') as Airline_name from [dbo].[Airline2$]

--Creat view of the table
Create view V2 as (
Select *, ('Airline1') as Airline_name from [dbo].[Airline1$] 
union
Select *, ('Airline2') as Airline_name from [dbo].[Airline2$])
select * from V2
