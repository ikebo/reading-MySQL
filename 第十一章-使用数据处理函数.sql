# 第十一章-使用数据处理函数

# 文本处理函数
SELECT vend_name, Upper(vend_name) AS vend_name_upcase
FROM vendors
ORDER BY vend_name;

SELECT cust_name, cust_contact
FROM customers
WHERE cust_contact = 'Y. Lie';

SELECT cust_name, cust_contact
FROM customers
WHERE Soundex(cust_contact) = soundex('Y. Lie');

# 日期处理函数
SELECT cust_id, order_num
FROM orders
WHERE order_date = '2005-09-01';

SELECT cust_id, order_num
FROM orders
WHERE Date(order_date) = '2005-09-01';

SELECT cust_id, order_num
FROM orders
WHERE Date(order_date) BETWEEN '2005-09-01' AND '2005-09-30';

SELECT cust_id, order_num
FROM orders
WHERE Year(order_date) = 2005 AND Month(order_date) = 9;

# 数值处理函数...