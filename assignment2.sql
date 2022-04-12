-- 1
create table EMP1 (
    id number(2),
    name varchar2(10),
    basic number(6, 2),
    designation varchar2(10),
    age number(2)
);

-- 2
alter table EMP1 modify (basic number(6));

-- 3
alter table EMP1 modify (name varchar2(15));

-- 4
create table EMP_trainee as select * from EMP1;
alter table EMP_trainee rename column id to emp_id;

-- 5
insert into EMP1 values (1, 'Rohit', 6700, 'Manager', 24);
insert into EMP1 values (2, 'Sunil', 6200, 'Engineer', 27);
insert into EMP1 values (3, 'Payal', 6300, 'Engineer', 25);
insert into EMP1 values (4, 'Kunal', 6700, 'Trainee', 28);
insert into EMP1 values (5, 'Sunita', 6230, 'Trainee', 26);
insert into EMP1 values (6, 'Bimal', 7000, 'Trainee', 25);
insert into EMP1 values (7, 'Anal', 8000, 'Manager', 27);
insert into EMP1 values (8, 'Arup', 7000, 'Trainee', 25);
insert into EMP1 values (9, 'Kushal', 5500, 'Trainee', 24);
insert into EMP1 values (10, 'Sunita', 6000, 'Engineer', 25);

-- 6
insert into EMP_trainee select * from EMP1 where designation = 'Trainee';

-- 7 desc both the tables

-- 8
alter table EMP1 add (skills varchar2(10), DOJ date);
update EMP1 set skills='gaming', DOJ='21-jan-2022' where ID=1;
update EMP1 set skills='teaching', DOJ='1-jul-2020' where ID=2;
update EMP1 set skills='coding', DOJ='2-feb-2001' where ID=3;
update EMP1 set skills='sports', DOJ='3-march-2009' where ID=4;
update EMP1 set skills='cooking', DOJ='4-april-2021' where ID=5;
update EMP1 set skills='dancing', DOJ='5-may-2010' where ID=6;
update EMP1 set skills='arts', DOJ='6-june-2019' where ID=7;
update EMP1 set skills='painting', DOJ='7-jul-2013' where ID=8;
update EMP1 set skills='gamling', DOJ='8-aug-2021' where ID=9;
update EMP1 set skills='singing', DOJ='9-sep-2022' where ID=10;

-- 9
alter table EMP_trainee modify designation varchar2(18);
update EMP_trainee set designation='Programmer_Trainee' where designation='Trainee';

-- 10 not clear

-- 11
select id, designation, age from EMP1;

-- 12
select * from EMP1 where designation = 'Manager';

-- 13
alter table EMP1 modify id varchar2(5);

-- 14
alter table EMP1 modify age number(1);

-- 15
select * from EMP1;
select * from EMP_trainee;

-- 16
alter table EMP1 rename column age to age_in_years;

-- 17
delete from EMP1 where designation = 'Trainee';

-- 18
alter table EMP_trainee drop column age;

-- 19
alter table EMP_trainee drop (basic, designation);

-- 20
alter table EMP1 rename to EMP_Mgr_Engr;

-- 21
drop table EMP_trainee;

-- 22
delete from EMP_MGR_ENGR;

-- 23
rollback;

-- 24
truncate table EMP_MGR_ENGR;

-- 25
rollback;

select * from EMP_MGR_ENGR;