-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select productname, categoryname 
from product as p
join category as c on c.Id = p.CategoryId;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.id, s.companyname 
from [order] as o
join shipper as s on o.shipvia = s.id
where o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select productname, quantity 
from product as p
join orderdetail as od on od.productid = p.id
join [order] as o on o.id = od.orderid
where o.id = 10251;



-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select 
    o.id as [Order ID]
    , e.lastname as [Employee's Last Name]
    , c.companyname as [Customer's Company Name] 
from [order] as o
join customer as c on c.id = o.customerid
join employee as e on o.employeeid = e.id;

-- STRETCH

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

select
  categoryname
  , count(p.categoryid) as [Total Products]
from categories as c
join products as p on c.categoryid = p.categoryid
group by p.categoryid;

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

select
  orderid
  , count(productid) as ItemCount
from orderdetails
group by orderid;