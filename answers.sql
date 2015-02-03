1

-----

Write a query that shows all the information about all the salespeople in
the database. Use a basic SELECT query.

-----

SELECT * FROM salespeople


==========
2

-----

Write a query that shows all the information about all salespeople from
the 'Northwest' region.

-----

SELECT * FROM salespeople WHERE region = 'Northwest';


==========
3

-----

Write a query that shows just the emails of the salespeople from the
'Southwest' region.

-----

SELECT email from salespeople WHERE region = 'Southwest'


==========
4

-----

Write a query that shows the given name, surname, and email of all
salespeople in the 'Northwest' region.

-----

select givenname, surname, email from salespeople where region = 'Northwest';


==========
5

-----

Write a query that shows the common name of melons that cost more than
$5.00.

-----

SELECT common_name FROM melons WHERE price > 5.00


==========
6

-----

Write a query that shows the melon type and common name for all
watermelons that cost more than $5.00.


-----

select melon_type, common_name from melons where melon_type = 'Watermelon' and price > 5;


==========
7

-----

Write a query that displays all common names of melons that start with
the letter 'C'.


-----

select common_name from melons where common_name like 'C%';


==========
8

-----

Write a query that shows the common name of any melon with 'Golden'
anywhere in the common name.


-----

select common_name from melons where common_name like '%Golden%';


==========
9

-----

Write a query that shows all the distinct regions that a salesperson can belong to.


-----

select distinct region from salespeople;


==========
10

-----

Write a query that shows the emails of all salespeople from both the
Northwest and Southwest regions.


-----

select email from salespeople where region = 'Northwest' or region = 'Southwest';


==========
11

-----

Write a query that shows the emails of all salespeople from both the
Northwest and Southwest regions, this time using an 'IN' clause.  


-----

select email from salespeople where region in ('Northwest', 'Southwest');


==========
12

-----

Write a query that shows the email, given name, and surname of all
salespeople in either the Northwest or Southwest regions whose surnames start
with the letter 'M'.

-----

select email, givenname, surname from salespeople where region in ('Northwest', 'Southwest') and surname like 'M%'


==========
13

-----

Write a query that shows the melon type, common name, price, and the
price of the melon given in euros. The 'melons' table has prices in dollars,
and the dollar to euro conversion rate is 0.735693.


-----

select melon_type, common_name, price, price * .735693 from melons;


==========
14

-----

Write a query that shows the total number of customers in our customer
table.

-----

select count(id) from customers;


==========
15

-----

Write a query that counts the number of orders shipped to California.

-----

select count(id) from orders where shipto_state = 'CA';


==========
16

-----

Write a query that shows the total amount of money spent across all melon
orders.

-----

select sum(order_total) from orders;


==========
17

-----

Write a query that shows the average order cost.

-----

select avg(order_total) from orders;


==========
18

-----

Write a query that shows the order total that was lowest in price.

-----

select min(order_total) from orders;


==========
19

-----

Write a query that fetches the id of the customer whose email is 
'phyllis@demizz.edu'.

-----

select id from customers where email = 'phyllis@demizz.edu';


==========
20

-----

Write a query that shows the id, status and order_total for all orders 
made by customer 100.

-----

select id, status, order_total from orders where customer_id = 100;


==========
21

-----

Write a single query that shows the id, status, and order total for all
orders made by 'phyllis@demizz.edu'. Use a subselect to do this.


-----

select id, status, order_total from orders where customer_id = (select id from customers where email = 'phyllis@demizz.edu');


==========
22

-----

Write a query that shows the id, status, and order total for all orders
made by 'phyllis@demizz.edu'. Use a join to do this.

-----

select orders.id, status, order_total from orders join customers on (customer_id = customers.id) where email = 'phyllis@demizz.edu';


==========
23

-----

Write a query that shows all columns that were attached to order #2725.

-----

select * from order_items where order_id = 2725;


==========
24

-----

Write a query that shows the common_name, melon_type, quantity,
unit_price and total_price for all the melons in order #2725.

-----

select melons.common_name, melons.melon_type, order_items.quantity, order_items.unit_price, order_items.total_price from melons join order_items on (melons.id=melon_id) where order_id = 2725;


==========
25

-----

Write a query that shows the total amount of revenue that comes from
internet orders.

-----

select sum(order_total) from orders where salesperson_id is null;


==========
26

-----

Challenge: Produce a list of all salespeople and the total amount of orders
they've sold, while calculating a 15% commission on all of their orders.
Include their given name, surname, the total of all their sales, and their
commission. Only report one row per salesperson. Include salespeople who have
not made any sales.

You will need 'left join' (http://sqlzoo.net/wiki/LEFT_JOIN) and 'group by'
(http://sqlzoo.net/wiki/SELECT_.._GROUP_BY) clauses to finish this one.

-----

select salespeople.givenname, salespeople.surname, sum(orders.order_total), sum(orders.order_total)*0.15 from salespeople left join orders on (orders.salesperson_id = salespeople.id) group by salespeople.id;