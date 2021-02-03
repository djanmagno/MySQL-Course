-- MySQL Tutorial for Beginners
-- Exercise 01 - Return all products with name, unit price and new price column where (unit price * 1.1)
select 
	name, 
    `unit_price`, 
    (`unit_price` * 1.1) as `new_price` 
from products;

-- Exercise 02 - Get the orders places in 2018
select 
	order_id,
    order_date
from orders
where order_date >= '2019-01-01';

-- Exercise 03 - From the order_items table, get the items for order #6
--               where the total price is greater than 30
select 
	*,
	(unit_price * quantity) as 'total_price'
from order_items
where order_id = '6' and (unit_price * quantity) > '30';

-- Exercise 04 - Return products with quantity in stock equal to 49, 38, 72
select * 
from products
where quantity_in_stock in (49, 38, 72);

-- Exercise 05 - Return customers who born between 1/1/1990 and 1/1/2000
select * from customers
where birth_date between '1990-01-01' and '2000-01-01';

# Use of LIKE operator
-- Observation : % it is used for any number of characters and _ it is used for a single character

-- Exercise 05.1 - Get the customers whose addresses contain Trail or Avenue 
select * from customers
where (address like '%trail%' or 
address like '%avenue%');

-- Exercise 05.2 - Get the customers whose phone numbers ends with 9
select * from customers
where phone like '%9';

# Use of REGEXP operator
-- Structure:
-- SELECT * FROM 'table' WHERE 'column' REGEXP 'condition'
-- ^ beginning of the word
-- $ end of the word
-- | logical OR
-- [abcd]
-- [a-j] range

-- Exercise 06.1 - Get the customers whose fisrt names are ELKA or AMBUR
select * 
from customers 
where first_name 
regexp 'elka|ambur';

-- Exercise 06.2 - Get the customers whose last names ends with Ey or ON
select *
from customers
where last_name
regexp 'ey$|on$';

-- Exercise 06.3 - Get the customers whose last names starts with MY or contains SE
select *
from customers
where last_name
regexp 'ˆme|se';

-- Exercise 06.4 - Get the customers whose last names contains B followed by R or U
select *
from customers
where last_name
regexp 'b[ru]';

-- Exercise 07 - Get the orders that are not shipped yet
select * 
from orders
where shipped_date is null;

-- Exercise 08 - On the table order items select all orders with id 2 in descendent order of total price
select *,
	(quantity * unit_price) as 'total_price'
from order_items
where order_id = '2'
order by 'total_price' desc;

-- Exercise 09 - Select the top 3 clients (clients with more points than anyone else)
select * 
from customers
order by points desc
limit 3;

-- Exercise 10 - Join the tables order items and products on product_id column
select o.order_id, o.product_id, p.name, o.quantity, o.unit_price 
from products as p
inner join order_items as o
	on p.product_id = o.product_id;

-- Selecting and Joining tables from different databases
use sql_inventory;

select *
from sql_store.order_items as oi
inner join products as p
	on oi.product_id = p.product_id;

-- A table can join with itself (SELF JOIN)
use sql_hr;

select 
	e.employee_id,
    e.first_name,
    e.last_name,
    e.job_title,
    m.first_name as manager
from employees as e
inner join employees m
	on e.reports_to = m.employee_id;

-- Exercise 11 - Join the tables order clients, payments and payments methods from sql_invoicing database
use sql_invoicing;

select 
	p.date, 
	p.invoice_id,
    p.amount,c.name, 
    pm.name 
from payments as p
inner join clients as c
	on p.client_id = c.client_id
inner join payment_methods as pm
	on p.payment_method = pm.payment_method_id;

-- Join two tables related by a composite columns primary key or foreign key
# Multiple conditions to join two tables
use sql_store;
select *
from order_items as oi
inner join order_item_notes as oin
	on oi.order_id = oin.order_id
    and oi.product_id = oin.product_id;

-- Exercise 12 - Outter Join the tables products and order items tables from sql_store database
select 
	p.product_id,
    p.name,
    oi.quantity
from products as p
left outer join order_items as oi
	on p.product_id = oi.product_id;
    
-- Exercise 13 - Outter Join of multiple tables customers,orders and shippers tables from sql_store database
select 
	o.order_date,
    o.order_id,
    c.first_name,
    s.name as 'shipper',
    os.name as 'order_status_name'
from orders as o
inner join customers as c
	on o.customer_id = c.customer_id
left outer join shippers as s
	on o.shipper_id = s.shipper_id
inner join order_statuses as os
	on o.status = os.order_status_id
order by order_status_name;

-- Exercise 14 - USING clause with join on sql_invoicing database
use sql_invoicing;
select 
	p.date,
	c.name,
    p.amount,
    pm.name as 'method'
from payments as p
inner join clients as c
	using(client_id)
inner join payment_methods as pm
	on p.payment_method = pm.payment_method_id;

-- NATURA JOIN clause join tables based in common columns
-- CROSS JOIN clause is used to combine every record from one table with every record of a second table

-- Exercise 15.1 - Use the Implicit CROSS JOIN method with the tables shippers and producs on sql_store database
use sql_store;
select 
	s.name as 'shipper',
    p.name as 'product'
from shippers as s, products as p
order by s.name;
-- Exercise 15.2 - Use the Explicit CROSS JOIN method with the tables shippers and producs on sql_store database
select 
	s.name as 'shipper',
    p.name as 'product'
from shippers as s
cross join products as p
order by s.name;

-- Exercise 16 - Use the union cluase to classify the number of points of each client in bronze, silber and gold
select 
	customer_id,
    first_name,
	points,
    'Bronze' as 'type'
from customers
where points < 2000
union
select 
	customer_id,
    first_name,
    points,
    'Silver' as 'type'
from customers
where points between 2000 and 3000
union
select 
	customer_id,
    first_name,
    points,
    'Gold' as 'type'
from customers
where points >= 3000
order by first_name;

-- Exercise 17 - Insert three rows in the products table
insert into products
values  (default, 'candy', 10000, 0.02),
		(default, 'notebook', 300, 5.59),
        (default, 'paper', 200000, 0.99);
select * from products;

-- Inserting Hierarchical Rows 
insert into orders (customer_id, order_date, status)
values (1, '2019-01-02', 1);

select last_insert_id();

insert into order_items
values
	(last_insert_id(), 2, 1, 2.95),
    (last_insert_id(), 3, 1, 4.95);
    
select * from order_items;

-- Exercise 18 - Create a copy of invoice table where it is possible to see the name of the clients and there is no null payment_date
use sql_invoicing;

create table invoice_archive
select
	i.invoice_id,
    i.number,
	c.name,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.due_date,
    i.payment_date
from invoices as i
inner join clients as c
using(client_id)
where payment_date is not null;

select * from invoice_archive;

-- Exercise 19 - Write a SQL statement to give any customer born before 1990 50 extra points
use sql_store;

update customers
set 
	points = points + 50
where birth_date < '1990-01-01';

-- Exercise 20 - Update the comments in the order table for the customers with more than 3000 points
update orders
set 
	comments = 'Gold customer'
where customer_id in 
	(select customer_id
	from customers
	where points > 3000);
