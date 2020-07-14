Select * from tblEmployee
Select * from tblDepartment

-- Using View
/*
	Note: Views get saved in the database, and can be available to other queries and stored procedures. However, 
	if this view is only used at this one place, it can be easily eliminated using other options, like CTE, Derived 
	Tables, Temp Tables, Table Variable etc.
*/
Create View View_Employeecount
As
Select d.DepartmentName,d.ID, COUNT(*) As TotalEmployees
from tblEmployee e
Join tblDepartment d
on e.DepartmentId = d.ID
Group by d.DepartmentName, d.ID

Select DepartmentName, TotalEmployees from View_Employeecount 
where TotalEmployees > 3

-- Using Temp Table
/*
	Note: Temporary tables are stored in TempDB. Local temporary tables are visible only in the current session, and 
	can be shared between nested stored procedure calls. Global temporary tables are visible to other sessions and are 
	destroyed, when the last connection referencing the table is closed.
*/
Select d.DepartmentName, d.ID, COUNT(*) as TotalEmployee
into #TempEmployeeCount
from tblEmployee e
Join tblDepartment d
On e.DepartmentId = d.ID
Group by d.DepartmentName, d.ID

Select DepartmentName, TotalEmployee
from #TempEmployeeCount where TotalEmployee > 3

Select * from #TempEmployeeCount

Drop table #TempEmployeeCount

--Using Table Variable
/*
	Note: Just like TempTables, a table variable is also created in TempDB. The scope of a table variable is the batch, 
	stored procedure, or statement block in which it is declared. They can be passed as parameters between procedures.
*/

Declare @tblEmployeeCount Table(DepartmentName varchar(20), Id int, TotalEmployee int)

Insert into @tblEmployeeCount
Select  d.DepartmentName, d.ID, COUNT(*) as TotalEmployee
from tblEmployee e
Join tblDepartment d
On e.DepartmentId = d.ID
Group by d.DepartmentName, d.ID

Select DepartmentName, TotalEmployee from @tblEmployeeCount 
where TotalEmployee > 3

-- Using Derived Tables
/*
	Derived tables are available only in the context of the current query.
*/

Select DepartmentName,TotalEmployee from
(
	Select  d.DepartmentName, d.ID, COUNT(*) as TotalEmployee
	from tblEmployee e
	Join tblDepartment d
	On e.DepartmentId = d.ID
	Group by d.DepartmentName, d.ID
) 
EmployeeCount where TotalEmployee > 3

-- Using CTE
/*
	A CTE can be thought of as a temporary result set that is defined within the execution scope of a single SELECT, 
	INSERT, UPDATE, DELETE, or CREATE VIEW statement. A CTE is similar to a derived table in that it is not stored as 
	an object and lasts only for the duration of the query.
*/

With EmployeeCount(DepartmentName,Id, TotalEmployee)
As
(
	Select  d.DepartmentName, d.ID, COUNT(*) as TotalEmployee
	from tblEmployee e
	Join tblDepartment d
	On e.DepartmentId = d.ID
	Group by d.DepartmentName, d.ID
)
Select DepartmentName,TotalEmployee from EmployeeCount
where TotalEmployee > 3
