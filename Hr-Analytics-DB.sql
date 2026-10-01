Create database EmployeeAnalyticsDB;
use EmployeeAnalyticsDB;
-- Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    department_id INT,
    hire_date DATE,
    job_title VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_id INT
);

-- Jobs Table
CREATE TABLE Jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50),
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2)
);

-- Performance Table
CREATE TABLE Performance (
    performance_id INT PRIMARY KEY,
    employee_id INT,
    review_date DATE,
    performance_score INT,
    remarks VARCHAR(200)
);

-- Attendance Table
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    date DATE,
    status VARCHAR(20)
);

-- Training Table
CREATE TABLE Training (
    training_id INT PRIMARY KEY,
    employee_id INT,
    course_name VARCHAR(100),
    completion_date DATE,
    status VARCHAR(20)
);

-- Attrition Table
CREATE TABLE Attrition (
    attrition_id INT PRIMARY KEY,
    employee_id INT,
    exit_date DATE,
    reason VARCHAR(100),
    rejoin_eligibility VARCHAR(10)
);

-- Projects Table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20)
);
Select * from Projects;
Select * from Employees;
Select * from Departments;
-- Employees → Departments
ALTER TABLE Employees
ADD CONSTRAINT fk_emp_dept
FOREIGN KEY (department_id) REFERENCES Departments(department_id);

-- Employees → Jobs
ALTER TABLE Employees
ADD CONSTRAINT fk_emp_job
FOREIGN KEY (job_title) REFERENCES Jobs(job_title);

-- Performance → Employees
ALTER TABLE Performance
ADD CONSTRAINT fk_perf_emp
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id);

-- Attendance → Employees
ALTER TABLE Attendance
ADD CONSTRAINT fk_att_emp
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id);

-- Training → Employees
ALTER TABLE Training
ADD CONSTRAINT fk_train_emp
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id);

-- Attrition → Employees
ALTER TABLE Attrition
ADD CONSTRAINT fk_attr_emp
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id);

-- Projects → Departments
ALTER TABLE Projects
ADD CONSTRAINT fk_proj_dept
FOREIGN KEY (department_id) REFERENCES Departments(department_id);

ALTER TABLE Jobs
ADD CONSTRAINT uq_job_title UNIQUE (job_title);

ALTER TABLE Employees
ADD CONSTRAINT fk_emp_job
FOREIGN KEY (job_title) REFERENCES Jobs(job_title);

INSERT INTO Employees (employee_id, name, gender, dob, department_id, hire_date, job_title, salary) VALUES
(1, 'Amit Sharma', 'Male', '1990-05-12', 1, '2015-06-01', 'Data Analyst', 55000.00),
(2, 'Priya Mehta', 'Female', '1992-08-20', 2, '2016-07-15', 'HR Manager', 65000.00),
(3, 'Rahul Verma', 'Male', '1988-03-10', 3, '2014-09-10', 'Software Engineer', 70000.00),
(4, 'Sneha Patil', 'Female', '1995-01-25', 1, '2019-03-12', 'Recruiter', 40000.00),
(5, 'Vikas Rao', 'Male', '1991-11-05', 2, '2017-08-01', 'Finance Analyst', 60000.00),
(6, 'Neha Kulkarni', 'Female', '1993-07-14', 3, '2018-09-20', 'Business Analyst', 58000.00),
(7, 'Rohan Desai', 'Male', '1987-02-18', 4, '2013-05-10', 'Project Manager', 90000.00),
(8, 'Kavita Joshi', 'Female', '1994-09-22', 5, '2020-01-15', 'HR Executive', 45000.00),
(9, 'Suresh Nair', 'Male', '1989-12-01', 2, '2016-11-05', 'Accountant', 52000.00),
(10, 'Anjali Gupta', 'Female', '1996-04-30', 1, '2021-02-01', 'Recruiter', 42000.00),
(11, 'Manish Singh', 'Male', '1990-06-11', 3, '2015-07-01', 'Software Engineer', 68000.00),
(12, 'Pooja Iyer', 'Female', '1992-08-25', 4, '2017-09-12', 'Business Analyst', 60000.00),
(13, 'Deepak Kumar', 'Male', '1988-03-05', 5, '2014-10-20', 'Finance Manager', 75000.00),
(14, 'Shweta Jain', 'Female', '1995-01-19', 2, '2019-03-15', 'HR Executive', 46000.00),
(15, 'Arjun Reddy', 'Male', '1991-11-09', 1, '2017-08-10', 'Data Analyst', 56000.00),
(16, 'Meera Shah', 'Female', '1993-07-21', 3, '2018-09-25', 'Software Engineer', 70000.00),
(17, 'Nikhil Pawar', 'Male', '1987-02-12', 4, '2013-05-15', 'Project Manager', 88000.00),
(18, 'Ritika Malhotra', 'Female', '1994-09-28', 5, '2020-01-20', 'Finance Analyst', 61000.00),
(19, 'Sanjay Patil', 'Male', '1989-12-07', 2, '2016-11-10', 'Accountant', 53000.00),
(20, 'Divya Kapoor', 'Female', '1996-05-02', 1, '2021-02-05', 'Recruiter', 43000.00);

INSERT INTO Departments (department_id, department_name, manager_id) VALUES
(1, 'Human Resources', 2),
(2, 'Finance', 5),
(3, 'IT', 7),
(4, 'Marketing', 12),
(5, 'Operations', 13),
(6, 'Sales', 15),
(7, 'Legal', 18),
(8, 'Admin', 20),
(9, 'Research', 11),
(10, 'Support', 14),
(11, 'Procurement', 16),
(12, 'Quality Assurance', 19),
(13, 'Training', 8),
(14, 'Strategy', 9),
(15, 'Customer Success', 10),
(16, 'Product', 6),
(17, 'Design', 4),
(18, 'Security', 3),
(19, 'Compliance', 1),
(20, 'Analytics', 17);

INSERT INTO Jobs (job_id, job_title, min_salary, max_salary) VALUES
(1, 'Data Analyst', 40000, 80000),
(2, 'HR Manager', 50000, 90000),
(3, 'Software Engineer', 45000, 95000),
(4, 'Recruiter', 35000, 60000),
(5, 'Finance Analyst', 42000, 85000),
(6, 'Business Analyst', 45000, 85000),
(7, 'Project Manager', 60000, 100000),
(8, 'Accountant', 40000, 70000),
(9, 'Finance Manager', 55000, 95000),
(10, 'HR Executive', 35000, 55000),
(11, 'Legal Advisor', 60000, 100000),
(12, 'Sales Executive', 30000, 60000),
(13, 'Marketing Specialist', 40000, 75000),
(14, 'Operations Manager', 50000, 95000),
(15, 'Support Engineer', 35000, 65000),
(16, 'Research Analyst', 45000, 85000),
(17, 'Trainer', 40000, 70000),
(18, 'Product Manager', 65000, 110000),
(19, 'Designer', 40000, 75000),
(20, 'Security Specialist', 50000, 95000);

INSERT INTO Performance (performance_id, employee_id, review_date, performance_score, remarks) VALUES
(1, 1, '2022-01-15', 4, 'Excellent work'),
(2, 2, '2022-01-15', 3, 'Good performance'),
(3, 3, '2022-01-15', 5, 'Outstanding'),
(4, 4, '2022-01-15', 2, 'Needs improvement'),
(5, 5, '2022-01-15', 4, 'Consistent performer'),
(6, 6, '2022-01-15', 3, 'Average'),
(7, 7, '2022-01-15', 5, 'Leadership qualities'),
(8, 8, '2022-01-15', 4, 'Strong HR skills'),
(9, 9, '2022-01-15', 3, 'Good accounting knowledge'),
(10, 10, '2022-01-15', 2, 'Needs training'),
(11, 11, '2022-01-15', 4, 'Solid technical skills'),
(12, 12, '2022-01-15', 3, 'Good analyst'),
(13, 13, '2022-01-15', 5, 'Excellent finance management'),
(14, 14, '2022-01-15', 3, 'Average HR performance'),
(15, 15, '2022-01-15', 4, 'Strong data analysis'),
(16, 16, '2022-01-15', 5, 'Excellent coding'),
(17, 17, '2022-01-15', 4, 'Good project handling'),
(18, 18, '2022-01-15', 3, 'Average finance skills'),
(19, 19, '2022-01-15', 2, 'Needs improvement'),
(20, 20, '2022-01-15', 4, 'Good recruiter');

INSERT INTO Attendance (attendance_id, employee_id, date, status) VALUES
(201, 1, '2022-01-01', 'Present'),
(202, 2, '2022-01-01', 'Absent'),
(203, 3, '2022-01-01', 'Late'),
(204, 4, '2022-01-01', 'Present'),
(205, 5, '2022-01-01', 'Present'),
(206, 6, '2022-01-01', 'Absent'),
(207, 7, '2022-01-01', 'Present'),
(208, 8, '2022-01-01', 'Late'),
(209, 9, '2022-01-01', 'Present'),
(210, 10, '2022-01-01', 'Absent'),
(211, 11, '2022-01-01', 'Present'),
(212, 12, '2022-01-01', 'Present'),
(213, 13, '2022-01-01', 'Late'),
(214, 14, '2022-01-01', 'Present'),
(215, 15, '2022-01-01', 'Absent'),
(216, 16, '2022-01-01', 'Present'),
(217, 17, '2022-01-01', 'Present'),
(218, 18, '2022-01-01', 'Late'),
(219, 19, '2022-01-01', 'Absent'),
(220, 20, '2022-01-01', 'Present');

INSERT INTO Training (training_id, employee_id, course_name, completion_date, status) VALUES
(301, 1, 'SQL Basics', '2022-02-10', 'Completed'),
(302, 2, 'HR Analytics', '2022-02-15', 'Completed'),
(303, 3, 'Python for Data Analysis', '2022-02-20', 'In Progress'),
(304, 4, 'Recruitment Strategies', '2022-02-25', 'Completed'),
(305, 5, 'Financial Modeling', '2022-03-01', 'Completed'),
(306, 6, 'Business Communication', '2022-03-05', 'Completed'),
(307, 7, 'Leadership Training', '2022-03-10', 'Completed'),
(308, 8, 'HR Policies', '2022-03-15', 'In Progress'),
(309, 9, 'Accounting Standards', '2022-03-20', 'Completed'),
(310, 10, 'Recruitment Tools', '2022-03-25', 'Completed'),
(311, 11, 'Advanced SQL', '2022-03-30', 'Completed'),
(312, 12, 'Data Visualization', '2022-04-05', 'Completed'),
(313, 13, 'Finance Risk Analysis', '2022-04-10', 'Completed'),
(314, 14, 'HR Compliance', '2022-04-15', 'Completed'),
(315, 15, 'Machine Learning Basics', '2022-04-20', 'In Progress'),
(316, 16, 'Agile Development', '2022-04-25', 'Completed'),
(317, 17, 'Project Management', '2022-04-30', 'Completed'),
(318, 18, 'Financial Reporting', '2022-05-05', 'Completed'),
(319, 19, 'Taxation Basics', '2022-05-10', 'Completed'),
(320, 20, 'HR Recruitment', '2022-05-15', 'Completed');

INSERT INTO Attrition (attrition_id, employee_id, exit_date, reason, rejoin_eligibility) VALUES
(401, 4, '2021-12-01', 'Better Opportunity', 'Yes'),
(402, 7, '2022-03-15', 'Personal Reasons', 'No'),
(403, 10, '2022-06-20', 'Retirement', 'No'),
(404, 12, '2022-07-01', 'Relocation', 'Yes'),
(405, 15, '2022-08-10', 'Career Change', 'No'),
(406, 18, '2022-09-05', 'Health Issues', 'No'),
(407, 20, '2022-10-01', 'Higher Studies', 'Yes'),
(408, 2, '2022-11-12', 'Better Pay', 'Yes'),
(409, 5, '2022-12-15', 'Work-Life Balance', 'No'),
(410, 8, '2023-01-20', 'Contract End', 'No'),
(411, 11, '2023-02-25', 'Retirement', 'No'),
(412, 13, '2023-03-10', 'Relocation', 'Yes'),
(413, 14, '2023-04-05', 'Career Change', 'No'),
(414, 16, '2023-05-01', 'Better Opportunity', 'Yes'),
(415, 17, '2023-06-15', 'Personal Reasons', 'No'),
(416, 19, '2023-07-20', 'Health Issues', 'No'),
(417, 1, '2023-08-25', 'Higher Studies', 'Yes'),
(418, 3, '2023-09-30', 'Better Pay', 'Yes'),
(419, 6, '2023-10-10', 'Work-Life Balance', 'No'),
(420, 9, '2023-11-15', 'Contract End', 'No');


INSERT INTO Projects (project_id, project_name, department_id, start_date, end_date, status) VALUES
(501, 'HR Dashboard Implementation', 1, '2021-01-01', '2021-06-01', 'Completed'),
(502, 'Finance Automation System', 2, '2021-02-01', '2021-08-01', 'Completed'),
(503, 'IT Infrastructure Upgrade', 3, '2021-03-01', '2021-12-01', 'Active'),
(504, 'Marketing Campaign 2021', 4, '2021-04-01', '2021-09-01', 'Completed'),
(505, 'Operations Streamlining', 5, '2021-05-01', '2021-11-01', 'Completed'),
(506, 'Sales CRM Implementation', 6, '2021-06-01', '2021-12-01', 'Active'),
(507, 'Legal Compliance Audit', 7, '2021-07-01', '2021-10-01', 'Completed'),
(508, 'Admin Portal Upgrade', 8, '2021-08-01', '2022-01-01', 'Completed'),
(509, 'Research Data Warehouse', 9, '2021-09-01', '2022-03-01', 'Active'),
(510, 'Customer Support Chatbot', 10, '2021-10-01', '2022-04-01', 'Completed'),
(511, 'Procurement System Upgrade', 11, '2021-11-01', '2022-05-01', 'Active'),
(512, 'Quality Assurance Framework', 12, '2021-12-01', '2022-06-01', 'Completed'),
(513, 'Employee Training Portal', 13, '2022-01-01', '2022-07-01', 'Active'),
(514, 'Corporate Strategy Dashboard', 14, '2022-02-01', '2022-08-01', 'Completed'),
(515, 'Customer Success Analytics', 15, '2022-03-01', '2022-09-01', 'Active'),
(516, 'Product Lifecycle Management', 16, '2022-04-01', '2022-10-01', 'Completed'),
(517, 'Design Collaboration Tool', 17, '2022-05-01', '2022-11-01', 'Active'),
(518, 'Security Monitoring System', 18, '2022-06-01', '2022-12-01', 'Completed'),
(519, 'Compliance Reporting Suite', 19, '2022-07-01', '2023-01-01', 'Active'),
(520, 'Analytics Platform Development', 20, '2022-08-01', '2023-02-01', 'Active');

Select * from jobs;

-------- ----------------------------Average Salary by Department--------------------------------------------------------------------------
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name;
----------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------Top 5 Highest Paid Employees----------------------------------------------------------------------------
SELECT name, job_title, salary
FROM Employees
ORDER BY salary DESC
LIMIT 5;
---------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------Employee Performance Distribution-----------------------------------------------------------------------
SELECT performance_score, COUNT(employee_id) AS total_employees
FROM Performance
GROUP BY performance_score
ORDER BY performance_score;
---------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------Monthly Attendance Rate per Department------------------------------------------------------------------
SELECT d.department_name,
       (SUM(CASE WHEN status='Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS attendance_rate
FROM Attendance a
JOIN Employees e ON a.employee_id = e.employee_id
JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name;
---------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------Attrition Rate by Department-------------------------------------------------------------------
SELECT d.department_name,
       COUNT(a.employee_id) * 100.0 / COUNT(e.employee_id) AS attrition_rate
FROM Departments d
LEFT JOIN Employees e ON d.department_id = e.department_id
LEFT JOIN Attrition a ON e.employee_id = a.employee_id
GROUP BY d.department_id, d.department_name;
---------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------Employees Who Completed Training Programs-------------------------------------------------
SELECT e.name, t.course_name, t.completion_date
FROM Training t
JOIN Employees e ON t.employee_id = e.employee_id
WHERE t.status = 'Completed';
---------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------Average Performance Score by Job Title----------------------------------------------------
SELECT e.job_title, AVG(p.performance_score) AS avg_score
FROM Performance p
JOIN Employees e ON p.employee_id = e.employee_id
GROUP BY e.job_title;
---------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------Projects by Department with Active Status----------------------------------------------------
SELECT d.department_name, COUNT(p.project_id) AS active_projects
FROM Projects p
JOIN Departments d ON p.department_id = d.department_id
WHERE p.status = 'Active'
GROUP BY d.department_name;
---------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------Employees Eligible for Rehire (Attrition Table)---------------------------------------------
SELECT e.name, a.reason
FROM Attrition a
JOIN Employees e ON a.employee_id = e.employee_id
WHERE a.rejoin_eligibility = 'Yes';
----------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------Top 5 Employees with Most Training Courses Completed----------------------------------------
SELECT e.name, COUNT(t.training_id) AS total_courses
FROM Training t
JOIN Employees e ON t.employee_id = e.employee_id
WHERE t.status = 'Completed'
GROUP BY e.name
ORDER BY total_courses DESC
LIMIT 5;







