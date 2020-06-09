Create Table tblProduct
(
 ProductId int primary key,
 Name nvarchar(20),
 UnitPrice int
)

Insert into tblProduct Values(1, 'Books', 20)
Insert into tblProduct Values(2, 'Pens', 14)
Insert into tblProduct Values(3, 'Pencils', 11)
Insert into tblProduct Values(4, 'Clips', 10)


Create Table tblProductSales
(
 ProductId int,
 QuantitySold int
)
Go
Insert into tblProductSales values(1, 10)
Insert into tblProductSales values(3, 23)
Insert into tblProductSales values(4, 21)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 13)
Insert into tblProductSales values(3, 12)
Insert into tblProductSales values(4, 13)
Insert into tblProductSales values(1, 11)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 14)

Select * from tblProduct
Select * from tblProductSales

Select Name, Sum(ISNULL(UnitPrice * QuantitySold,0)) as TotalSales, COUNT_BIG(*) as TotalTransactions
from tblProduct p
Join tblProductSales ps
on p.ProductId = ps.ProductId
Group by Name

/*
If you want to create an Index, on a view, the following rules should be followed by the view. For the complete list of all rules, 
please check MSDN.
1. The view should be created with SchemaBinding option.
2. If an Aggregate function in the SELECT LIST, references an expression, and if there is a possibility for that expression to become NULL, 
then, a replacement value should be specified. In this example, we are using, ISNULL() function, to replace NULL values with ZERO.
3. If GROUP BY is specified, the view select list must contain a COUNT_BIG(*) expression.
4. The base tables in the view, should be referenced with 2 part name. In this example, tblProduct and tblProductSales are referenced using 
dbo.tblProduct and dbo.tblProductSales respectively.
*/

Create view vWTotalSalesByProduct
With Schemabinding
As
	Select Name, Sum(ISNULL(UnitPrice * QuantitySold,0)) as TotalSales, COUNT_BIG(*) as TotalTransactions
	from dbo.tblProduct p
	Join dbo.tblProductSales ps
	on p.ProductId = ps.ProductId
	Group by Name

select * from vWTotalSalesByProduct

Create Unique Clustered Index IX_VWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)

