-- 1
create table client_master (
    client_no varchar2(5) primary key check ( client_no like 'C%' ),
    name varchar2(20) unique,
    address1 varchar2 (30),
    state varchar2 (30),
    city varchar2 (15)
);

insert into client_master values ('C01', 'Ivaan', 'Church Rd', 'Maharashtra', 'Mumbai');
insert into client_master values ('C02', 'Vandana', 'St.Mary Rd', 'Tamil Nadu', 'Chennai');
insert into client_master values ('C03', 'Pramada', 'Mall Rd', 'Maharashtra', 'Mumbai');
insert into client_master values ('C04', 'Basu', 'Church Rd', 'Maharashtra', 'Mumbai');
insert into client_master values ('C05', 'Ravi', 'Chandni', null, 'Delhi');
insert into client_master values ('C06', 'Rukmini', 'Mall Rd', 'Maharashtra', 'Mumbai');

create table product_master (
    product_no varchar2 (10) primary key,
    description varchar2 (20) unique not null,
    qty_on_hand number (8) check ( qty_on_hand > 10 ),
    sell_price number (8, 2) not null,
    cost_price number (8, 2) not null,
    constraint product_no_check check ( product_no like 'P%' )
);

insert into product_master values ('P01', '1.44 Floppies', 100, 525, 500);
insert into product_master values ('P02', 'Monitors', 25, 12000, 11280);
insert into product_master values ('P03', 'Mouse', 20, 1050, 1000);
insert into product_master values ('P04', '1.22 floppies', 100, 525, 500);
insert into product_master values ('P05', 'Keyboards', 15, 3150, 3050);
insert into product_master values ('P06', 'Cd drive', 14, 5250, 5100);

create table sales_order (
    s_order_no varchar2(10) primary key check ( s_order_no like 'O%' ),
    s_order_date date not null,
    client_no varchar2 (5),
    salesman_no varchar2 (10) check ( salesman_no like 'S%' ),
    product_no varchar2 (10),
    constraint product_no_fk foreign key (product_no) references product_master,
    constraint client_no_fk foreign key (client_no) references client_master
);

insert into sales_order values ('O19001', '12-jan-96', 'C01', 'S01', 'P01');
insert into sales_order values ('O19002', '25- jan-96', 'C02', 'S02', 'P02');
insert into sales_order values ('O19003', '18-feb-96', 'C03', 'S03', 'P03');
insert into sales_order values ('O19004', '03-apr-96', 'C01', 'S01', 'P04');
insert into sales_order values ('O19005', '20-may-96', 'C04', 'S02', 'P05');
insert into sales_order values ('O19006', '24-may-96', 'C05', 'S04', 'P06');

-- 2
alter table client_master modify address1 varchar2 (30) not null;
-- desc client_master;

-- 3
insert into client_master values (null, 'Foo', 'Bar', 'Foo', 'Bar');
insert into product_master values (null, 'Foo', 0, 0, 0);
insert into sales_order values (null, '1996-01-12', 'C01', 'S01', 'P01');

-- 4
delete from client_master where client_no = 'C01';
insert into sales_order values ('O19007', '12-jan-96', 'C09', 'S07', 'P08');

-- 5
insert into product_master values ('A01', '1.44 Floppies', 100, 525, 500);
insert into sales_order values ('B19001', '12-jan-96', 'C01', 'F01', 'P01');
insert into product_master values ('Z06', 'Cd drive', 14, 5250, 5100);

-- 6
select (sell_price - cost_price) as Profit from product_master;

-- 7
select (cost_price * qty_on_hand) "Total cost price" from product_master;

-- 8
select * from client_master where name like 'I%';

-- 9
select * from client_master where name like 'R%i';

-- 10
select * from client_master where name like '__a_a%';

-- 11
select * from client_master where name like '%aa%';

-- 12
select * from client_master where name like '____';

-- 13
select * from client_master where state is null;

-- 14
select * from sales_order where s_order_date > '31-JAN-1996';

-- 15
update sales_order set s_order_date = '24-JULY-1996', product_no = 'P06', salesman_no = 'S04' where client_no = 'C01';

-- 16
update client_master set city = 'Kolkata' where client_no = 'C05';

-- 17
alter table client_master modify client_no varchar2(15);
alter table sales_order modify client_no varchar2(15);

-- 18
update sales_order set client_no = 'C08' where s_order_no = 'O19001';

-- 19
alter table sales_order drop constraint product_no_fk;

-- 20
alter table sales_order drop constraint client_no_fk;

-- 21
alter table product_master drop constraint product_no_check;

-- 22
delete from client_master where client_no = 'C02';

-- 23
delete
from product_master
where sell_price between 1000 and 10000;

-- 24
create table users(
    client_id number(5),
    phone_number number(10),
    name varchar2(10),
    joined_at date,
    constraint clientID_phone_ck primary key (client_id, phone_number)
);

-- 25
create table guild (
    owner_id number(5),
    owner_phone number(10),
    id number(5) primary key,
    constraint owner_fk foreign key (owner_id, owner_phone) references users
);