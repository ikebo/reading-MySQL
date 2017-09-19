# 第十五章-使用联结

# 关系型数据库分解数据为多个表，更方便地处理，并且具有更大的可伸缩性
# 如果数据存储在多个表中，怎样用单条SELECT语句检索出数据？
# 答案是使用联结

# 创建联结
SELECT  vend_name, prod_name, prod_price
FROM vendors, products
WHERE vendors.vend_id = products.vend_id
ORDER BY vend_name, prod_name;

# 笛卡尔积
SELECT vend_name, prod_name, prod_price
FROM vendors, products
ORDER BY vend_name, prod_name;

# 内部联结
# 目前为止所用的联结称为‘等值联结’，它基于两个表之间的相等测试
# 这种联结也称为内部联结
SELECT vend_name, prod_name, prod_price
FROM vendors INNER JOIN products
ON vendors.vend_id = products.vend_id;

# 联结多个表
SELECT prod_name, vend_name, prod_price, quantity
FROM orderitems, products, vendors
WHERE products.vend_id = vendors.vend_id
AND orderitems.prod_id = products.prod_id
AND order_num = 20005;

SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (SELECT cust_id
				  FROM orders
                  WHERE order_num IN (SELECT order_num
									  FROM orderitems
                                      WHERE prod_id = 'TNT2'));

SELECT cust_name, cust_contact
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
  AND orderitems.order_num = orders.order_num
  AND prod_id = 'TNT2';