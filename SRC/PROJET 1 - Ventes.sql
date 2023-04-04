USE toys_and_models;



-- Affichage des colonnes Catégorie, Date, et Quantité commandée
SELECT productlines.productLine AS 'Category', 
  DATE_FORMAT(orders.orderDate, "%Y-%m") AS 'Month', 
  SUM(orderdetails.quantityOrdered) AS 'Qty Ordered' 

-- jointure des tables productlines, products, orderdetails et orders
FROM
  productlines
  JOIN products ON productlines.productLine=products.productLine
  JOIN orderdetails ON products.productCode=orderdetails.productCode
  JOIN orders ON orderdetails.orderNumber=orders.orderNumber

-- regroupé par Catégorie et date
GROUP BY
  productlines.productLine,
  DATE_FORMAT(orders.orderDate, "%Y-%m")
  
-- classé par catégorie puis par date
ORDER BY 'Category', 'Month'