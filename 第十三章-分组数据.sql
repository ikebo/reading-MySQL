# 第十三章-分组数据

# 数据分组
SELECT COUNT(*) AS num_prods
FROM products
WHERE vend_id = 1003;

# 创建分组
SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id;

# 过滤分组
SELECT cust_id, COUNT(*) AS orders
FROM orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;

SELECT vend_id, COUNT(*) AS num_prods
FROM products
WHERE prod_price >=10
GROUP BY vend_id
HAVING COUNT(*) >= 2;

SELECT order_num, SUM(quantity * item_price) AS ordertotal
FROM orderitems
GROUP BY order_num
HAVING SUM(quantity * item_price) >= 50;

SELECT order_num, SUM(quantity * item_price) AS ordertotal
FROM orderitems
GROUP BY order_num
HAVING SUM(quantity * item_price) >= 50
ORDER BY ordertotal;

# SELECT 子句顺序
# SELECT
# FROM
# WHERE
# GROUP BY
# HAVING
# ORDER BY
# LIMIT