-- 1

create table customer (
    cust_id char(3) primary key,
    fname varchar2(30) not null,
    lname varchar2(30),
    area char(2) not null,
    phone number(10)
);

create table movie (
    mv_no number(2),
    cust_id char(3),
    title varchar2(30) not null,
    star char(2) not null,
    price number(5, 2) check (price between 100 and 250),
    constraint mv_no_pk primary key (mv_no),
    constraint cust_id_fk foreign key (cust_id) references customer
);

insert into customer values ('A01', 'Ivan', 'Ross', 'SA', 6125467);
insert into customer values ('A02', 'Vandana', 'Ray', 'MU', 5560379);
insert into customer values ('A03', 'Pramada', 'Jauguste', 'DA', 4560389);
insert into customer values ('A04', 'Basu', 'Navindi', 'BA', 6125401);
insert into customer values ('A05', 'Ravi', 'Shridhar', 'NA', null);
insert into customer values ('A06', 'Rukmini', 'Aiyer', 'GH', 5125274);

insert into movie values (1, 'A02', 'Bloody', 'JC', 181);
insert into movie values (2, 'A04', 'The Firm', 'TC', 200);
insert into movie values (3, 'A01', 'Pretty Woman', 'RG', 151);
insert into movie values (4, 'A06', 'Home Alone', 'MC', 150);
insert into movie values (5, 'A05', 'The Fugitive', 'MF', 200);
insert into movie values (6, 'A03', 'Coma', 'MD', 100);
insert into movie values (7, 'A02', 'Dracula', 'GO', 150);
insert into movie values (8, 'A06', 'Quick Change', 'BM', 100);
insert into movie values (9, 'A03', 'Gone with the Wind', 'CB', 200);
insert into movie values (10, 'A05', 'Carry on Doctor', 'LP', 100);

-- 2
insert into movie(mv_no, cust_id, title, star, price)
values (null, 'A01', 'null', 'null', null);

insert into customer(cust_id, fname, lname, area, phone)
values (null, 'Foo', 'Bar', 'AB', 69420);

-- 3
delete from customer where cust_id = 'A01';
delete from customer where cust_id = 'A04';

-- 4
insert into movie (mv_no, cust_id, title, star, price)
values (11, 'A01', 'Foo Movie', 'DC', 300);

-- 5
select title from movie where price > 100 and price < 200;

-- 6
select cust_id from movie where star in ('JC', 'TC', 'MC');

-- 7
select * from customer where area like '%A%';

-- 8
select title from movie where price <= 180 and length(title) = 6;

-- 9
select title, price, (price + price * 0.1) "Incremented price" from movie;

-- 10
select fname || ' ' || lname || ' stays in ' || area || ' and their phone number is ' || phone "Customer Details" from customer;

-- 11
alter table customer modify lname varchar2(30) not null;

-- 12
select fname, lname from customer where phone is null;

-- 13
update customer set phone = 6942069 where phone is null;

-- 14
select distinct cust_id from movie;

-- 15
alter table movie modify star char(2);

-- 16
delete from customer where cust_id = 'A02';

-- 17
delete from movie where cust_id = 'A01';

-- 18
drop table customer;

-- 19
drop table movie;

-- 20
alter table movie drop constraint cust_id_fk;