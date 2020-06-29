Select * from tblViewEmployee
Select * from tblViewDepartment

Select * from vwEmployeeDetailsByDepartment

Delete from vwEmployeeDetailsByDepartment where id in (4,5)

Alter Trigger tr_vwEmployeeDetailsByDepartment_InsteadOfDelete
On vwEmployeeDetailsByDepartment
instead Of Delete
As
Begin
	Delete tblViewEmployee
	from tblViewEmployee e
	Join deleted d
	on e.Id = d.Id

	-- Subquery
	--Delete from tblViewEmployee
	--where id in (Select id from deleted)
End