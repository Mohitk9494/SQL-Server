Create table tblPerson
(
	ID int identity(1,1) primary key,
	Name varchar(100) not null,
	Email varchar(200) not null,
	GenderId int
)

Create table tblGender
(
	ID int identity(1,1) primary key,
	Gender varchar(200)
)



Select * from tblPerson
Select * from tblGender

Alter table tblPerson add constraint tblPreson_GenderID_FK
Foreign key (GenderId) references tblGender(ID)

