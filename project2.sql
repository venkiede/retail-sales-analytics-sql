select name from sys.databases;

use project;

select name from sys.tables;

select * from customer;

select * from transactions;

select top(5) * from transactions;


select * from customer;

select top (5) customer_id,
SUM(total_amount) as Total_spent
from transactions
group by customer_id
order by Total_spent desc;

select gender ,avg(age) as average_age from customer
group by gender;







use project;

select name from sys.tables;
select * from transactions;

select top 5 customer_id,sum(total_amount) as total_spent
from transactions 
group by customer_id
order by total_spent desc;

select FORMAT(Date,'yyyy-mm') as month,
sum(total_amount)as total_spent
from transactions 
group by FORMAT(Date,'yyyy-mm')
order by total_spent desc;


select p.product_category,
COUNT(t.transaction_id)as number_of_transactions,
SUM(t.quantity)as total_unit_sold,
SUM(t.total_amount )as total_revenue
from transactions as t
join products as p
on t.product_id=p.product_id
group by p.product_category;

select 
SUM(case when c.gender = 'Male' then t.total_amount else 0 end)
as total_sales_male,
SUM(case when c.gender='Female' then t.total_amount else 0 end)as total_sales_femlae
from transactions as t
join customer as c
on t.customer_id=c.customer_id;


select * from customer;