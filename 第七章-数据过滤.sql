# 第7章 数据过滤

USE book;
SHOW tables FROM book;
SHOW COLUMNS FROM customers;

# 组合WHERE 字句
# AND操作符
SELECT prod_id, prod_price, prod_name FROM  products WHERE vend_id = 1003 AND prod_price <=10;

# OR操作符
SELECT prod_name, prod_price FROM products WHERE vend_Id = 1002 OR vend_id = 1003;

# IN 操作符
SELECT prod_name, prod_price FROM products WHERE vend_id IN (1002, 1003) ORDER BY prod_name;

# NOT 操作符
SELECT prod_name, prod_price FROM products WHERE vend_id NOT IN (1002, 1003) ORDER BY prod_name;
