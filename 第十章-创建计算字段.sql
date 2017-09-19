# 第十章-创建计算字段

# 计算字段

# 拼接字段 Concat()函数
SELECT  Concat(vend_name, ' (', vend_country, ')')
FROM vendors ORDER BY vend_name;

# RTrim() 函数去掉空格
SELECT Concat(RTrim(vend_name), ' (', RTrim(vend_country), ')')
FROM vendors  ORDER BY vend_name;

# 使用别名
SELECT Concat(RTrim(vend_name), ' (', RTrim(vend_country), ')') AS
vend_title
FROM vendors
ORDER BY vend_name;


# 执行算术运算
SELECT prod_id, quantity, item_price
FROM orderitems
WHERE order_num = 20005;

SELECT prod_id,
	   quantity,
       item_price,
       quantity * item_price AS expand_price
FROM orderitems
WHERE order_num = 20005;