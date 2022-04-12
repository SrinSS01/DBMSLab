-- 1
create table employee (
    EMPLOYEE_ID NUMBER(6),
    LAST_NAME VARCHAR2(25),
    JOB_ID VARCHAR2(10),
    SALARY NUMBER(8,2),
    COMM_PCT NUMBER (4,2),
    MGR_ID NUMBER (6),
    DEPARTMENT_ID NUMBER (4)
);

-- 2
insert into employee values (198, 'Connell', 'SH_CLERK', 2600, 2.5, 124, 50);
insert into employee values (199, 'Grant', 'SH_CLERK', 2600, 2.2, 124, 50);
insert into employee values (200, 'Whalen', 'AD_ASST', 4400, 1.3, 101, 10);
insert into employee values (201, 'Hartstein', 'IT_PROG', 6000, null, 100, 20);
insert into employee values (202, 'Fay', 'AC_MGR', 6500, null, 210, 20);
insert into employee values (203, 'Mavris', 'AD_VP', 7500, null, 101, 40);
insert into employee values (204, 'Baer', 'AD_PRES', 3500, 1.5, 101, 90);
insert into employee values (205, 'Higgins', 'AC_MGR', 2300, null, 101, 60);
insert into employee values (206, 'Gitz', 'IT_PROG', 5000, null, 103, 60);
insert into employee values (100, 'King', 'AD_ASST', 8956, 0.3, 108, 100);
insert into employee values (101, 'Kochar', 'SH_CLERK', 3400, 1.3, 118, 30);

-- 3
select employee_id, last_name, job_id from employee;

-- 4
select * from employee where DEPARTMENT_ID = 60;

-- 5
select * from employee where LAST_NAME = 'King';

-- 6
select distinct JOB_ID "JOB_TITLE" from employee;

-- 7
select LAST_NAME, SALARY, (SALARY + 300) as Increased_Salary from employee;

-- 8
select last_name, salary, (SALARY * 12 + 100) as annual_compensation from employee;

-- 9
select * from employee where COMM_PCT is not null;

-- 10
select * from employee where COMM_PCT is null;

-- 11
select EMPLOYEE_ID, DEPARTMENT_ID, SALARY from employee where SALARY > 5000;

-- 12
select LAST_NAME, SALARY from employee where SALARY between 4000 and 7000;

-- 13
select * from employee where SALARY in (600, 6500, 7000);

-- 14
select * from employee where DEPARTMENT_ID in (10, 20, 30, 50);

-- 15
select * from employee where SALARY != 5000;

-- 16
select * from employee where JOB_ID like '%CLERK';

-- 17
update employee set JOB_ID = 'grade_a' where SALARY > 5000;
select * from employee;

-- 18
select * from employee where JOB_ID in ('IT_PROG', 'SH_CLERK', 'AD_ASST');

-- 19
select * from employee where JOB_ID like '%CLERK' and SALARY < 3000;

-- 20
select LAST_NAME, MGR_ID from employee where SALARY > 3000 and MGR_ID = 101;