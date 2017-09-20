# 第二十章-更新和删除数据

# 更新数据
# 更新表中特定行
# 更新表中所有行
USE book;

UPDATE customers
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers
SET cust_name = 'The Fudds',
	cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

UPDATE customers
SET cust_email = NULL
WHERE cust_id = 10005;

# 删除数据
# 从表中删除特定行
# 从表中删除所有行
DELETE FROM customers
WHERE cust_id = 10006;
# DELETE 不需要列名或者通配符，DELETE删除整行而不是删除列
# 删除列可以用UPDATE语句