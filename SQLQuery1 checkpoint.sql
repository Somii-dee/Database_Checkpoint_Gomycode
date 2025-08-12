--AN EMPLOYEE PARTICIPATION INFORMATION SYSTEM

Create database Employee_Participation_Information;

use Employee_Participation_Information;

--Creating Department Table
Create table Department (
Num_S int primary key,
Label varchar(255) not null,
Manager_Name varchar(255) not null,
);

--Inserting into Department Table

INSERT INTO department (num_s, label, manager_name)
VALUES
(1, 'IT', 'Alice Johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');


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

--Inserting Employee Table

INSERT INTO employee (num_e, name, position, salary, department_num_s) VALUES
(101, 'John Doe', 'Developer', 60000.00, 1),
(102, 'Jane Smith', 'Analyst', 55000.00, 2),
(103, 'Mike Brown', 'Designer', 50000.00, 3),
(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);


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

--Inserting into Project Table
INSERT INTO project (num_p, title, start_date, end_date, department_num_s) VALUES
(201, 'Website Redesign', '2024-01-15', '2024-06-30', 1),
(202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
(203, 'Market Research', '2024-02-01', '2024-07-31', 3),
(204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);

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
--inserting into Employee_Project
INSERT INTO employee_project (employee_num_e, project_num_p, role) VALUES
(101, 201, 'Frontend Developer'),
(104, 201, 'Backend Developer'),
(102, 202, 'Trainer'),
(105, 202, 'Coordinator'),
(103, 203, 'Research Lead'),
(101, 204, 'Network Specialist');


/*modifying table employee_project with employee_num_e and project_num_p where it is = 101 and 201 
respectfully and changing the role from frontend developer to full stack developer'''*/

UPDATE employee_project
SET role = 'Full Stack Developer'
WHERE employee_num_e = 101 AND project_num_p = 201;

DELETE FROM employee
WHERE num_e = 103;
