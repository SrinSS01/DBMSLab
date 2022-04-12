-- 3
create table Student_156(
    roll number(5),
    name varchar2(30),
    age number(5),
    course varchar2(5),
    maths number(6, 2),
    physics number(6, 2),
    computer number(6, 2),
    birthday date
);

-- 4
create table MSc as select * from Student_156;

-- 5 desc MSc

-- 6
create table MCA as select * from Student_156;
alter table MCA rename column name to first_name;
alter table MCA rename column course to department;

-- 7 desc MCA

-- 8
insert into Student_156 values (1, 'Rahul', 22, 'BCA', 79.5, 67, 89, '15-jun-93');
insert into Student_156 values (2, 'Kunal', 24, 'BCA', 68, 76, 59.5, '16-aug-91');
insert into Student_156 values (3, 'Aditi', 23, 'MSc', 90, 73, 56, '20-sep-92');
insert into Student_156 values (4, 'Sumit', 24, 'MCA', 57.5, 78, 81, '07-dec-91');
insert into Student_156 values (5, 'Abirban', 21, 'MCA', 90, 68, 63, '15-sep-94');
insert into Student_156 values (6, 'Kumkum', 20, 'BCA', 72, 54.5, 60, '08-feb-95');
insert into Student_156 values (7, 'Suman', 21, 'BCA', 91.5, 32, 61, '10-mar-94');
insert into Student_156 values (8, 'Rohit', 23, 'MSc', 85, 76, 92, '19-apr-92');
insert into Student_156 values (9, 'Manas', 21, 'MCA', 95, 90, 92, '19-sep-94');
insert into Student_156 values (10, 'Avijit', 22, 'MSc', 85, 80, 65, '19-july-93');
insert into Student_156 values (11, 'Rex', 19, 'BCA', 94, 56, 78, '10-jan-96');
insert into Student_156 values (12, 'Ram', 20, 'BCA', 85, 86, 87, '15-july-95');
insert into Student_156 values (13, 'Roshan', 19, 'BCA', 85, 96, 78, '15-jan-96');
insert into Student_156 values (14, 'Aditya', 22, 'MSc', 76, 89, 97, '18-aug-93');
insert into Student_156 values (15, 'Kashyap', 24, 'MCA', 56, 78, 45, '17-oct-91');

-- 9
select * from Student_156;

-- 10
select roll, name, maths, physics, computer from Student_156;