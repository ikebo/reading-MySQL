# 第十二章-汇总数据

# 聚集函数
# AVG(), COUNT(), MAX(), MIN(), SUM()

# AVG() 函数
SELECT AVG(prod_price) AS avg_price
FROM products;

# COUNT()函数
SELECT COUNT(*) AS num_cust FROM customers;

SELECT COUNT(cust_email) AS num_cust
FROM customers;

# MAX() 函数  会忽略NULL 值
SELECT MAX(prod_price) AS max_price
FROM products;

# MIN () 函数
SELECT MIN(prod_price) AS min_price
FROM products;

# SUM() 函数
SELECT SUM(quantity) AS items_ordered
FROM orderitems
WHERE order_num = 20005;

SELECT SUM(item_price * quantity) AS total_price
FROM orderitems
WHERE order_num = 20005;

# 聚集不同值
# 只包含不同值
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM products
WHERE vend_id = 1003;

# 组合聚集函数
SELECT COUNT(*) AS num_items,
	   MIN(prod_price) AS price_min,
	   MAX(prod_price) AS price_max,
       AVG(prod_price) AS price_avg
FROM products;