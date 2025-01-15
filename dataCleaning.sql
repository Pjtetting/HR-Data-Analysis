use DB_HR

select * from Department
select * from HR_Data
select * from Position

--making the names all consistent
update HR_Data
Set LastName = upper(left(LastName, 1)) + lower(substring(LastName,2,len(LastName)))


update HR_Data
set FirstName = upper(left(LastName, 1)) + lower(substring(LastName,2,len(LastName)))

--checking there is any duplicate with the count and the number of rows
select distinct count(EmpID) from HR_Data

----making the genders all consistent
update HR_Data
set Sex =
case
	when sex = 'male' then upper(sex)
	when sex = 'female' then upper(sex)
	else sex
end

--adding a new column
alter table HR_Data
add FullName varchar(50)

update HR_Data
set FullName =concat(FirstName,' ', MiddleInitial, '.',' ', LastName)


--adding a new column
alter table HR_Data
add Position varchar(50)

--getting rid of the null and updating there position
--the file csv named the Position table column wrong, they forget the 'i' in position
update HR_Data
set HR_Data.Position = PositionTable.[Position Name]
from HR_Data 
join Position AS PositionTable 
on HR_Data.PositionID = PositionTable.[Position ID]

--checking if it updated
select Position from HR_Data

--adding a new column
alter table HR_data
add Department varchar(50)

--getting rid of the null and updating there department
update HR_Data
set HR_Data.Department = d.Department_Name
from HR_Data h
join Department d 
on h.DepartmentID = d.DepartmentID

--checking if it updated
select Department from HR_Data


