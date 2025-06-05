CREATE VIEW totalordersperrawmaterial AS 
SELECT RawMaterial, COUNT(*) AS Total_Orders
FROM orders
GROUP BY RawMaterial
ORDER BY Total_Orders DESC;

# Query creates a view that returns the total number of orders for each raw materials sorted from most to least ordered.


CREATE VIEW SupplierContributiontoOrders AS 
SELECT 
    COUNT(DISTINCT o.OrderID) AS Orders_Supplied,  
    SUM(o.Order_Quantity) AS Total_Quantity_Supplied,
    s.SupplierID,
    s.SupplierName
FROM Orders o
JOIN (SELECT DISTINCT SupplierID, SupplierName FROM Suppliers) s 
ON o.SupplierID = s.SupplierID
GROUP BY s.SupplierID, s.SupplierName
ORDER BY Orders_Supplied DESC;

# Query creates a view that shows the number of unique orders for each supplier and the total quantity supplied.
# The results are sorted from the supplier with the most orders to the least orders.

CREATE VIEW OrderDistributionAcrossSuppliers AS
SELECT SupplierID, RawMaterial, COUNT(*) AS Orders_Per_Supplier
FROM Orders
GROUP BY SupplierID, RawMaterial
ORDER BY SupplierID, Orders_Per_Supplier DESC;

# Query creates a view that shows the number of orders each supplier has fulfilled for each raw material.

CREATE VIEW NumberofSuppliersperCountry AS 
SELECT Country, COUNT(*) AS Total_Suppliers
FROM Suppliers
GROUP BY Country
ORDER BY Total_Suppliers DESC;

#Query creates a view that identifies the number of suppliers per each country.
#The results are sorted from the country with the highest no of suppliers to the least.

CREATE VIEW SuppliersUsingEachTransportRoute AS 
SELECT Route, COUNT(*) AS Supplier_Count
FROM Suppliers
GROUP BY Route;

# Query creates a view that identifies how many suppliers use each transport route to deliver raw materials.


CREATE VIEW  SupplierswiththeMostOrders AS 
SELECT s.SupplierName, COUNT(distinct o.OrderID) AS Total_Orders
FROM Orders o
JOIN Suppliers s ON o.SupplierID = s.SupplierID AND o.key_id = s.key_id
GROUP BY s.SupplierName
ORDER BY Total_Orders DESC;

# Query creates a view that ranks suppliers by the total number of unique orders received.


