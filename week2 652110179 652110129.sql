select OrderID, OrderDate, CustomerName, ProductName , Price, Quantity, sum(Price * Quantity) as TotalPrice
from orders
join customers using (CustomerID)
join order_details using (OrderID)
join products using (ProductID)
where month(OrderDate)='11'
group by OrderID
order by OrderDate desc;

select OrderID, OrderDate, CustomerID, CustomerName, ShipperID, ShipperName from orders
join shippers using (ShipperID)
join customers using (CustomerID)
where month(OrderDate)='11'
order by OrderDate desc;

select EmployeeID, sum(price * Quantity) as total from employees 
join orders using(EmployeeID) 
join order_details using (OrderID) 
join products using(ProductID) 
group by EmployeeID limit 10;

Select orderId from order_details where productID in 
(select productId from products where supplierID in (Select SupplierID from suppliers where SupplierName ="Tokyo Traders"));