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
