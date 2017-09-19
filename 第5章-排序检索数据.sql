USE book;
SHOW tables FROM book;

# 排序数据
SELECT prod_name FROM products;
# ORDER BY 字句
SELECT prod_name FROM products ORDER BY prod_name;
# 按多个列排序
SELECT prod_id, prod_price, prod_name FROM products ORDER BY prod_price, prod_name;
# 指定排序方向  DESC指定逆序排列
SELECT prod_id, prod_price, prod_name FROM products ORDER BY prod_price DESC;
# DESC 只应用到在它之前的列名中，如果想对多个列逆序排列，必须对每个列制定DESC关键字
SELECT prod_id, prod_price, prod_name FROM products ORDER BY prod_price DESC, prod_name;

# ORDET BY 与 LIMIT 的组合，能够找出一个列中最高或最低的值
SELECT prod_price FROM products ORDER BY prod_price DESC LIMIT 1;