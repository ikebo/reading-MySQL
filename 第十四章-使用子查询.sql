# 第十四章-使用子查询

SELECT order_num FROM orderitems
WHERE prod_id = 'TNT2';

SELECT cust_id
FROM orders
WHERE order_num IN (20005, 20007);

SELECT cust_id
FROM orders
WHERE order_num IN (SELECT order_num
					FROM orderitems
                    WHERE prod_id = 'TNT2');

SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (SELECT cust_id
				  FROM orders
                  WHERE order_num IN (SELECT order_num
									  FROM orderitems
                                      WHERE prod_id = 'TNT2'));
                                      
# 作为计算字段使用子查询
SELECT COUNT(*) AS orders
FROM orders
WHERE cust_id = 10001;

SELECT cust_name,
       cust_state,
       (SELECT COUNT(*)
       FROM orders
       WHERE orders.cust_id = customers.cust_id) AS orders
FROM customers
ORDER BY cust_name;

# 相关子查询，涉及外部查询的子查询成为相关子查询。
# 任何时候只要列名可能有多义性，就必须使用这种语法。