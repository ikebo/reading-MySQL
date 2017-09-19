# 第八章-用通配符进行过滤，LIKE 操作符。
# LIKE 操作符只是MySQL，后跟的搜索模式
# 利用通配符匹配而不是直接相等匹配进行比较

USE book;
SHOW tables FROM book;
SHOW columns FROM customers;

# 百分号（%）通配符 (匹配任意个) 搜索是区分大小写的
SELECT prod_id, prod_name FROM products WHERE prod_name LIKE 'jet%';
SELECT prod_id, prod_name FROM products WHERE prod_name LIKE '%anvil%';

# 下划线（_）通配符
SELECT prod_id, prod_name FROM products WHERE prod_name LIKE '_ ton anvil';
SELECT prod_id, prod_name FROM products WHERE prod_name LIKE '% ton anvil';

# 不要过度使用通配符