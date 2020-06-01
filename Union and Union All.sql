Create table tblIndiaCustomers
(
 Id int primary key identity(1,1),
 Name varchar(100),
 Email varchar(100)
)

Create table tblUKCustomers
(
 Id int primary key identity(1,1),
 Name varchar(100),
 Email varchar(100)
)

Insert into tblIndiaCustomers values('Raj', 'raj@r.com')
Insert into tblIndiaCustomers values('Sam', 'sam@s.com')

Insert into tblukCustomers values('Sam', 'sam1@s.com')
Insert into tblukCustomers values('Tom', 'tom@r.com')

--Truncate table tblukCustomers

Select * from tblIndiaCustomers
Union All
Select * from tblukCustomers
Order by Name