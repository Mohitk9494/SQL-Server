Select * from tblEmployeeAndManager

Select ISNULL(null, 'No Manager') Manager
Select COALESCE(Null, 'No Magaer') Manager

Case With Expression Then '' Else '' End

Select E.Name as Employee, COALESCE(M.Name, 'No Manager') as Manager
From tblEmployeeAndManager E
Left Join tblEmployeeAndManager M
On E.ManagerID = M.ID

Select E.Name as Employee, 
Case When M.Name is Null Then 'No Manager' Else M.Name End as Manager
From tblEmployeeAndManager E
Left Join tblEmployeeAndManager M
On E.ManagerID = M.ID

 --COALESCE() Function - Returns the first Non null value

 Create Table tblEmpCoalesce
 (
	Id int primary key identity(1,1),
	FirstName varchar(100),
	MiddleName varchar(100),
	LastName varchar(100)
 )

 insert into tblEmpCoalesce values('Sam',null,null)
 insert into tblEmpCoalesce values(null,'Tom',null)
 insert into tblEmpCoalesce values(null,null,'Todd')
 insert into tblEmpCoalesce values('Sara','Parker',null)
 insert into tblEmpCoalesce values('Ben','Nick','Nancy')
 insert into tblEmpCoalesce values('James',null,null) 

 Select * from tblEmpCoalesce

 Select Coalesce(FirstName,MiddleName,LastName) as Name from tblEmpCoalesce