-- 1
create table customer (
    cust_id char(3) primary key check ( cust_id like 'A%' ),
    fname varchar2(30) not null,
    lname varchar(30),
    area char(2) not null,
    phone number(10)
);

create table movie (
    mv_no int primary key,
    title varchar2(30) not null,
    type varchar2(30) not null,
    star char(2) not null,
    price number(8, 2) not null
);

create table invoice (
    inv_no char(3) primary key check ( inv_no like 'I%' ),
    mv_no int references movie,
    cust_id char(3) references customer,
    issue_date date,
    return_date date
);

insert into customer values ('A01', 'Ivan', 'Bayross', 'SA', 6125467);
insert into customer values ('A02', 'Vandana', 'Saiteal', 'MU', 5560379);
insert into customer values ('A03', 'Pramada', 'Jauguste', 'DA', 4560389);
insert into customer values ('A04', 'Basu', 'Navindi', 'BA', 61253401);
insert into customer values ('A05', 'Ravi', 'Shreedhar', 'NA', null);
insert into customer values ('A06', 'Rukmini', null, 'GH', 5125274);

insert into movie values (1, 'Bloody', 'Action', 'JC', 181);
insert into movie values (2, 'The Firm', 'Thriller', 'TC', 200);
insert into movie values (3, 'Pretty Woman', 'Romance', 'RG', 151);
insert into movie values (4, 'Home Alone', 'Comedy', 'MC', 150);
insert into movie values (5, 'The Fugitive', 'Thriller', 'MF', 200);
insert into movie values (6, 'Coma', 'Suspense', 'MD', 100);
insert into movie values (7, 'Dracula', 'Horror', 'GO', 150);
insert into movie values (8, 'Quick Change', 'Comedy', 'BM', 100);
insert into movie values (9, 'Gone with the Wind', 'Action', 'CB', 200);
insert into movie values (10, 'Carry on Doctor', 'Comedy', 'LP', 100);

insert into invoice values ('I01', 4, 'A01', '21-jul-93', '25-jul-93');
insert into invoice values ('I02', 3, 'A02', '12-aug-93', '15-aug-93');
insert into invoice values ('I03', 1, 'A02', '15-aug-93', '18-aug-93');
insert into invoice values ('I04', 6, 'A03', '10-sep-93', '13-sep-93');
insert into invoice values ('I05', 7, 'A04', '5-aug-93', '8-aug-93');
insert into invoice values ('I06', 2, 'A06', '18-sep-93', '21-sep-93');
insert into invoice values ('I07', 9, 'A05', '7-jul-93', '10-jul-93');
insert into invoice values ('I08', 9, 'A01', '11-aug-93', '14-aug-93');
insert into invoice values ('I09', 5, 'A03', '6-jul-93', '9-jul-93');
insert into invoice values ('I10', 8, 'A06', '3-sep-93', '6-sep-93');

-- 2
select movie.title, i.cust_id, i.mv_no
from movie
inner join invoice i on movie.mv_no = i.mv_no;

-- 3
select movie.title, movie.type
from movie
inner join invoice i on movie.mv_no = i.mv_no
inner join customer c on c.cust_id = i.cust_id
where c.fname = 'Vandana';

-- 4
select customer.fname || ' ' || customer.lname as name
from customer
inner join invoice i on customer.cust_id = i.cust_id
inner join movie m on i.mv_no = m.mv_no
where m.type = 'Action';

-- 5
select 'The movie taken by '|| customer.fname || ' ' || customer.lname || ' is ' || m.title || '.'
from customer
inner join invoice i on customer.cust_id = i.cust_id
inner join movie m on i.mv_no = m.mv_no
where i.mv_no >= 3;

-- 6
select * from customer
inner join invoice i on customer.cust_id = i.cust_id
where inv_no = 'I10';

-- 7
select customer.fname || ' ' || customer.lname as name, customer.phone, customer.area
from customer
inner join invoice i on customer.cust_id = i.cust_id
and i.issue_date < '1-aug-93';

-- 8
select distinct movie.mv_no, movie.title
from movie
inner join invoice i on movie.mv_no = i.mv_no
inner join customer c on c.cust_id = i.cust_id
where c.fname in ('Ivan', 'Vandana', 'Ravi');

-- 9
select distinct movie.mv_no, movie.title
from movie
inner join invoice i on movie.mv_no = i.mv_no;

-- 10
select type, movie.mv_no
from movie
inner join invoice i on movie.mv_no = i.mv_no
where i.cust_id in ('A01', 'A02');

-- 11
select invoice.cust_id
from invoice
inner join movie m on invoice.mv_no = m.mv_no
where star = 'TC';

-- 12
select distinct fname, lname
from customer
inner join invoice i on customer.cust_id = i.cust_id;

-- 13
select movie.mv_no
from movie
left join invoice i on movie.mv_no = i.mv_no
where i.mv_no is null;
-- 14
select max(price) as max_price, min(price) as min_proce, avg(price) as avg_price
from movie;

-- 15
select count(mv_no)
from movie;

-- 16
select mv_no
from invoice
group by mv_no
having count(mv_no) > 1

-- 17
