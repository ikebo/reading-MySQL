# 第二十六章-管理事物处理

# 控制事物处理
# 标识事物的开始
START TRANSACTION;

# 回退MySQL语句
DELIMITER ;
SELECT * FROM ordertotals;
START TRANSACTION;
DELETE FROM ordertotals;
SELECT * FROM ordertotals;
ROLLBACK;
SELECT * FROM ordertotals;

# 使用COMMIT
START TRANSACTION;
DELETE FROM orderitems WHERE order_num = 20010;
DELETE FROM orders WHERE order_num = 20010;
COMMIT;

# 使用保留点
SAVEPOINT delete1;
ROLLBACK TO delete1;

# 更改默认的提交行为
SET autocommit = 0;

