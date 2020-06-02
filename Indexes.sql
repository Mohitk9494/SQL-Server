/*
Why indexes?
Indexes are used by queries to find data from tables quickly. Indexes are created on tables and views. Index on a table or a view, is very 
similar to an index that we find in a book.

If you don't have an index in a book, and I ask you to locate a specific chapter in that book, you will have to look at every page starting 
from the first page of the book.

On, the other hand, if you have the index, you lookup the page number of the chapter in the index, and then directly go to that page number to 
locate the chapter.

Obviously, the book index is helping to drastically reduce the time it takes to find the chapter.

In a similar way, Table and View indexes, can help the query to find data quickly.

In fact, the existence of the right indexes, can drastically improve the performance of the query. If there is no index to help the query, 
then the query engine, checks every row in the table from the beginning to the end. This is called as Table Scan. Table scan is bad for 
performance.
*/

Create Index IX_tblEmployees_Salary
On tblEmployees (Salary asc)

Select * from tblEmployees
where Salary > 3000 and Salary < 6800

/*
To view the Indexes: In the object explorer, expand Indexes folder. Alternatively use sp_helptext system stored procedure. The following command query returns all the indexes on tblEmployee table.
*/

sp_helpIndex tblEmployees

drop Index tblEmployees.IX_tblEmployees_Salary

/*
The following are the different types of indexes in SQL Server
1. Clustered
2. Nonclustered
3. Unique
4. Filtered
5. XML
6. Full Text
7. Spatial
8. Columnstore
9. Index with included columns
10. Index on computed columns
*/

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