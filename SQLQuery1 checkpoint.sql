--AN EMPLOYEE PARTICIPATION INFORMATION SYSTEM

Create database Employee_Participation_Information;

use Employee_Participation_Information;

--Creating Department Table
Create table Department (
Num_S int primary key,
Label varchar(255) not null,
Manager_Name varchar(255) not null,
);

--Creating Employee Table

Create Table Employee (
Num_E int primary key,
Name varchar(255) not null,
Position varchar(255) not null,
Salary decimal (10,2) not null check (salary >= 0),
Department_Num_S int,
Foreign Key (Department_Num_S) references Department (Num_S)
	on delete set null
	on update cascade
);

--Creating Project Table

Create table Project (
Num_P int primary key,
Title varchar (255) not null,
Start_Date date not null,
End_Date date not null,
Department_Num_S int,
foreign key (Department_Num_S) references department (Num_S)
	on delete set null
	on update cascade,
check (end_date >= start_date)
);

--Creating Employee_Project

Create Table Employee_Project (
Employee_Num_E int not null,
Project_Num_P int not null,
Role varchar(255) not null,
primary key (Employee_Num_E, Project_Num_P),
foreign key (Employee_Num_E) references Employee (Num_E)
	on delete cascade
	on update cascade,
foreign key (Project_Num_P) references Project (Num_P)
	on delete no action
	on update no action
);