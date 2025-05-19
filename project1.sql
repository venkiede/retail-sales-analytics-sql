select name from sys.databases;

create database project;

use project;

select name from sys.tables;

select * from retail_sales_dataset;

create table customer(
customer_id varchar(10),
gender char(15),
age int
);

insert into customer select Customer_ID,Gender,Age from retail_sales_dataset;

select * from customer;

select distinct customer_id from customer;

create table products(
product_id varchar(10),
product_category varchar(20),
price_per_unit int
);

drop table products;

select name from sys.tables;

create table products(
product_id int identity(1,1),
product_category varchar(20),
price_per_unit int
);

select * from products;

select * from retail_sales_dataset;

insert into products(product_category,price_per_unit) 
select distinct [Product_Category],[Price_per_Unit] from retail_sales_dataset;

select * from products;

create table transactions(
transaction_id int,
Date Date,
customer_id varchar(20),
product_id int,
quantity int,
total_amount int
);

insert into transactions(transaction_id,Date,customer_id,quantity,total_amount) select [Transaction_ID],[Date],[Customer_ID],[Quantity],[Total_Amount] from retail_sales_dataset ;

select * from transactions;

select * from products;

insert into transactions(product_id)
select product_id from products;

delete from transactions where product_id>0;

alter table transactions drop column product_id;

select * from transactions;




select * from transactions;

alter table transactions drop column quantity,total_amount;

alter table transactions add product_id int;



alter table transactions add quantity int,total_amount int;

insert into transactions(quantity,total_amount) 
select [Quantity],[Total_Amount] from retail_sales_dataset;

select * from transactions;

delete from transactions where quantity<=1;

update T
set T.quantity=R.Quantity
from transactions as T
join retail_sales_dataset as R
on T.transaction_id=R.Transaction_ID;

select * from transactions;


update T

set T.total_amount=R.Total_Amount
from transactions as T
join retail_sales_dataset as R
on T.customer_id=R.Customer_ID;

update T
set T.product_id=P.product_id
from transactions as T
join retail_sales_dataset as R
on T.transaction_id=R.Transaction_ID
join products as P
on R.Product_Category=P.product_category and
R.Price_per_Unit=P.price_per_unit;

select * from transactions;

alter table customer alter column customer_id varchar(20) not null;

alter table customer add constraint cust_pk
Primary key(customer_id);

select name from sys.tables;

select * from customer;

alter table products alter column 
product_id int not null;

alter table products add constraint prodid_pk 
primary key(product_id);

select * from transactions;

alter table transactions 
alter column transaction_id int not null;

alter table transactions 
add constraint transid_pk
primary key (transaction_id);

alter table transactions add constraint
custid_fk foreign key (customer_id) references
customer(customer_id);

alter table transactions 
add constraint prodid_fk foreign key(product_id)
references products(product_id);


