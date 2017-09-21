-- 第二十五章-使用触发器

-- 创建触发器
CREATE TRIGGER newproduct AFTER INSERT ON products
FOR EACH ROW SELECT 'Product added';

# 删除触发器
DROP TRIGGER newproduct;

# 使用触发器

# INSERT 触发器
CREATE TRIGGER neworder AFTER INSERT ON orders
FOR EACH ROW SELECT NEW.order_num;

INSERT INTO orders(order_date, cust_id)
VALUES(Now(), 10001);

# DELETE 触发器
CREATE TRIGGER deleteorder BEFORE DELETE ON orders
FOR EACH ROW
BEGIN
	INSERT INTO archive_orders(order_num, order_date, cust_id)
    VALUES(OLD.order_num, OLD.order_date, OLD.cust_id);
END;

# UPDATE 触发器
CREATE TRIGGER updatevendor BEFORE UPDATE ON vendors
FOR EACH ROW SET NEW.vend_state = Upper(NEW.vend_state);

