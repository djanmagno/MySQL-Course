-- MySQL Tutorial for Beginners

-- Exercise 21 - Using the invoices table get the total sales, total payments and the difference between 
-- those two columns naming it as 'what we expect'fromthe first half of 2019 and second half and the total
select
	'First Half of 2019' as 'date_range',
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payment,
    sum(invoice_total - payment_total) as 'what_we_expect'
from invoices
where invoice_date between '2019-01-01' and '2019-06-30'
union
select
	'Second Half of 2019' as 'date_range',
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payment,
    sum(invoice_total) - sum(payment_total) as 'what_we_expect'
from invoices
where invoice_date between '2019-07-01' and '2019-12-31'
union
select
	'Total' as 'date_range',
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payment,
    sum(invoice_total) - sum(payment_total) as 'what_we_expect'
from invoices;

-- Exercise 22 - Using the payment and payment_methods table use groupby to combine the dates 
-- getting the payment methods and the total payments
select 
	date,
    name as 'payment_method',
    sum(amount) as 'total_payments'
from payments as p
inner join payment_methods as pm
	on p.payment_method = pm.payment_method_id
group by date,payment_method
order by date;
