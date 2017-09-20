# 第二十二章

# 利用视图简化复杂的联结
CREATE VIEW productcustomers AS
SELECT cust_name, cust_contact, prod_id
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
  AND orderitems.order_num = orders.order_num;
  
SELECT cust_name, cust_contact
FROM productcustomers
WHERE prod_id = 'TNT2';

# 用视图重新格式化检索出的数据
CREATE VIEW vendorlocations AS
SELECT Concat(RTrim(vend_name), ' (', RTrim(vend_country), ')')
		AS vend_title
FROM vendors
ORDER BY vend_name;

SELECT * 
FROM vendorlocations;

# 用视图过滤不想要的数据
CREATE VIEW customeremaillist AS
SELECT cust_id, cust_name, cust_email
FROM customers
WHERE cust_email IS NOT NULL;

SELECT *
FROM customeremaillist;

# 使用视图与计算字段
SELECT  prod_id,
		quantity,
        item_price,
        quantity * item_price AS expanded_price
FROM orderitems
WHERE order_num = 20005;

CREATE VIEW orderitemsexpanded AS
SELECT order_num,
		prod_id,
		quantity,
        item_price,
        quantity * item_price AS expanded_price
FROM orderitems;

SELECT *
FROM orderitemsexpanded
WHERE order_num = 20005;

# 大部分情况下视图都是不可更新的，它主要用于检索