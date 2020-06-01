Create table tblEmployees
(
	Id int identity(1,1) primary key,
	Name varchar(200),
	Gender varchar(20),
	Salary int,
	City varchar(200)
)

Insert into tblEmployees values('Raj','male',4800,'Delhi')
Insert into tblEmployees values('Kiran','female',2800,'Mumbai')
Insert into tblEmployees values('Rajdeep','male',3500,'Kolkata')
Insert into tblEmployees values('Hema','female',2800,'Delhi')
Insert into tblEmployees values('Leela','female',2500,'Mumbai')
Insert into tblEmployees values('Kunal','male',1800,'Delhi')
Insert into tblEmployees values('Jiya','female',1500,'Kolkata')
Insert into tblEmployees values('Mukesh','male',5800,'Mumbai')
Insert into tblEmployees values('Mohit','male',2800,'Delhi')
Insert into tblEmployees values('Pinki','female',2800,'Kolkata')


Select City, Gender, sum(Salary) as TotalSalary, count(Id) as [Total Employees] 
from tblEmployees
Where Gender = 'male'
Group by City, Gender
Order by City

Select City, Gender, sum(Salary) as TotalSalary, count(Id) as [Total Employees] 
from tblEmployees
Group by City, Gender
-- having Gender = 'male'
having sum(Salary) > 5500
Order by City

Select * from tblEmployees where Salary > 2000