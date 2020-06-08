/* 
Unique index is used to enforce uniqueness of key values in the index.
Notes:- By default, Primary key constraint, creates a unique clustered index.

UNIQUENESS is a property of an Index, and both CLUSTERED and NON-CLUSTERED indexes can be UNIQUE.

Creating a UNIQUE NON CLUSTERED index on the FirstName and LastName columns.

Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)

*/

Select * from tblEmployees

Create Unique NonClustered Index UXI_tblEmployees_Name
on tblEmployees(Name)

Drop index tblEmployees.UXI_tblEmployees_Name

Alter table tblEmployees
Add Constraint UQ_tblEmployees_Name
Unique (Name)

Drop index tblEmployees.UQ_tblEmployees_Name

/*
	when should you be creating a Unique constraint over a unique index?

	To make our intentions clear, create a unique constraint, when data integrity is the objective. This makes the objective of the index 
	very clear. In either cases, data is validated in the same manner, and the query optimizer does not differentiate between a unique index 
	created by a unique constraint or manually created.

	1. By default, a PRIMARY KEY constraint, creates a unique clustered index, where as a UNIQUE constraint creates a unique nonclustered index. 
	These defaults can be changed if you wish to.

	2. A UNIQUE constraint or a UNIQUE index cannot be created on an existing table, if the table contains duplicate values in the key columns. 
	Obviously, to solve this,remove the key columns from the index definition or delete or update the duplicate values.

	3. By default, duplicate values are not allowed on key columns, when you have a unique index or constraint. For, example, if I try to insert 10
	rows, out of which 5 rows contain duplicates, then all the 10 rows are rejected. However, if I want only the 5 duplicate rows to be rejected and accept the non-duplicate 5 rows, then I can use IGNORE_DUP_KEY option. An example of using IGNORE_DUP_KEY option is shown below.
	
	CREATE UNIQUE INDEX IX_tblEmployee_City
	ON tblEmployee(City)
	WITH IGNORE_DUP_KEY
*/