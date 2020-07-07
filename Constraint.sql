select * from tblPerson
Select * from tblGender

Alter Table tblPerson
Drop Constraint DF_tblPerson_GenderId

Alter Table tblPerson
Add Constraint DF_tblPerson_GenderId
Default 3 for GenderId

Alter Table tblPerson
Add Constraint CK_tblPerson_Age Check(Age > 0 And Age < 150 )

Alter Table tblPerson
Add Constraint UK_tblPerson_Email Unique(Email)

Insert into tblPerson( Name, Email, GenderID,Age)
Select  'Rajni', 'rajni@gmail.com',2, 35

Delete from tblPerson
/* 

Add And Alter table 
ALTER TABLE ParameterMaster
ALTER COLUMN IsDeleted Bit

ALTER TABLE ParameterMaster
ADD IsSystemParameter Bit;
*/


Set IDENTITY_INSERT tblPerson On
Set IDENTITY_INSERT tblPerson Off

DBCC CheckIdent('tblPerson',Reseed,0)

Select SCOPE_IDENTITY()

Select IDENT_CURRENT('Test')

Create table Test 
(
	ID int primary key,
	Name varchar(50)
)

Insert into Test(ID, Name)
Select 2,'A'

Use Sample

select * from tblPerson where Age in(40, 60, 35)
Select * from tblPerson where Age Between 35 And 60
Select * from tblPerson Where Name like '%y%'
Select * from tblPerson Where Email Not like '%ji%'
Select * from tblPerson Where Name Like '[AR]%' order by Name desc
Select * from tblPerson Where Name Like '[^AR]%' order by Name desc

