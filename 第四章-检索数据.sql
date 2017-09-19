use book;
show tables from book;
show columns from customers;
select cust_name from customers;
select * from customers;
select prod_id, prod_name, prod_price FROM products;
select * from products;

select vend_id from products;
# 关键字 DISTINCT 表示只返回不同的值
SELECT DISTINCT vend_id FROM products;

# 限制结果
SELECT prod_name FROM products LIMIT 5;
# 为得出下一个5行，可指定要检索的开始行和行数
SELECT prod_name FROM products LIMIT 5,5;

# 使用完全限定的表名
SELECT products.prod_name FROM products;
SELECT products.prod_name FROM book.products;


