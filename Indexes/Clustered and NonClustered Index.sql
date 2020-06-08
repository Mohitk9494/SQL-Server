/*
Clustered Index:
A clustered index determines the physical order of data in a table. For this reason, a table can have only one clustered index. 

 Primary key, constraint create clustered indexes automatically if no clustered index already exists on the table and a nonclustered index is 
 not specified when you create the PRIMARY KEY constraint. 

 A clustered index is analogous to a telephone directory, where the data is arranged by the last name. We just learnt that, a table can have 
 only one clustered index. However, the index can contain multiple columns (a composite index), like the way a telephone directory is organized 
 by last name and first name.

 We can create a clustered index on 2 columns it's called composite clustered Index.
*/

/*
	Now, execute the following CREATE INDEX query, to create a composite clustered Index on the Gender and Salary columns.

	Create Clustered Index IX_tblEmployee_Gender_Salary
	ON tblEmployees(Gender DESC, Salary ASC)
*/


Create Clustered Index IX_tblEmployee_Gender_Salary
ON tblEmployees(Gender DESC, Salary ASC)

Select * from tblEmployees

SET IDENTITY_INSERT tblEmployees ON
Insert into tblEmployees(Name, Gender,Salary,City,Email) values('Test','male',1800,'Delhi', 'test@gamil.com')
SET IDENTITY_INSERT tblEmployees OFF

/*
Non Clustered Index:
A nonclustered index is analogous to an index in a textbook. The data is stored in one place, the index in another place. The index will 
have pointers to the storage location of the data. 

Since, the nonclustered index is stored separately from the actual data, a table can have more than one non clustered index, just like how a 
book can have an index by Chapters at the beginning and another index by common terms at the end.

In the index itself, the data is stored in an ascending or descending order of the index key, which doesn't in any way influence the storage 
of data in the table. 
*/

Create NonClustered Index IX_tblEmployee_Name
On tblEmployees(Name)


/*
Difference between Clustered and NonClustered Index:
1. Only one clustered index per table, where as you can have more than one non clustered index
2. Clustered index is faster than a non clustered index, because, the non-clustered index has to refer back to the table, if the selected 
column is not present in the index.
3. Clustered index determines the storage order of rows in the table, and hence doesn't require additional disk space, but where as a 
Non Clustered index is stored seperately from the table, additional storage space is required.
*/