# 第十七章-组合查询

# 组合查询， 有两种基本情况需要：
# 在单个查询中从不同的表返回类似结构的数据
# 对单个表执行多个查询，按单个查询返回数据

# 创建组合查询
# 可用UNION操作符来组合数条SQL语句。
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001, 1002);

SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5 
  OR vend_id IN (1001, 1002);
  
# 包含或取消重复的行
# UNION 自动取消重复的行
# UNION ALL 返回所有匹配行

SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION ALL
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001, 1002);

# 对组合查询结果排序
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001,1002)
ORDER BY prod_price, vend_id;

