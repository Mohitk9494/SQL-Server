Select * from tblViewEmployee
Select * from tblViewDepartment

select * from vwEmployeeDetailsByDepartment

-- We get error when going to update the view because it's containt multiple tables
update vwEmployeeDetailsByDepartment set Name = 'Rob', DeptName = 'HR' where Id= 1

-- One table will be update successfully
update vwEmployeeDetailsByDepartment set DeptName = 'IT' where Id= 1

update tblViewDepartment set DeptName = 'HR' where DeptId = 1

Create Trigger tr_vwEmployeeDetailsByDepartment_InsteadOfUpdate
On vwEmployeeDetailsByDepartment
instead of update
as
begin
	-- if EmployeeId is updated
	if(UPDATE(Id))
	Begin
		Raiserror('Id cannot be changed',16,1)
		return
	End

	 -- If DeptName is updated
	 If(UPDATE(DeptName))
	 Begin
		Declare @DeptId int
		
		Select @DeptId = d.DeptId
		from inserted i
		join tblViewDepartment d
		On i.DeptName = d.DeptName

		if(@DeptId is null)
		Begin
			Raiserror('Invalid Department Name',16,1)
			return
		End

		 Update tblViewEmployee set DepartmentId = @DeptId
		 from inserted
		 join tblViewEmployee
		 on tblViewEmployee.Id = inserted.id
	 End

	 -- If gender is updated
	 if(Update(Gender))
	 Begin
		  Update tblViewEmployee set Gender = inserted.Gender
		  from inserted
		  join tblViewEmployee
		  on tblViewEmployee.Id = inserted.id
	 End

	  -- If Name is updated
	 if(Update(Name))
	 Begin
		  Update tblViewEmployee set Name = inserted.Name
		  from inserted
		  join tblViewEmployee
		  on tblViewEmployee.Id = inserted.id
	 End
End


