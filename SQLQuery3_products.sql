SELECT 
ProductID, 
ProductName,
Price,
CASE
WHEN Price<50 THEN 'Low'
WHEN Price between 50 and 200 THEN 'Medium'
ELSE 'High'
end as PriceCategory
FROM dbo.products;