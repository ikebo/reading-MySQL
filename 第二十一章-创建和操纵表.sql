# 第二十一章-创建和操纵表

CREATE TABLE customers
(
	cust_id			int 		NOT NULL AUTO_INCREMENT,
    cust_name		char(50)	NOT NULL,
    cust_address 	char(50) 	NULL,
    cust_city		char(50)	NULL,
    cust_state		char(5) 	NULL,
    cust_zip 		char(10) 	NULL,
    cust_country	char(50) 	NULL,
    cust_contact 	char(50) 	NULL,
    cust_email 		char(255)	NULL,
    PRIMARY KEY (cust_id)
) ENGINE = InnoDB;

# 使用NULL值
# 不允许NULL值的列不接受该列没有值的行

CREATE TABLE orders
(
	order_num		int 		NOT NULL AUTO_INCREMENT,
    order_date		datetime	NOT NULL,
    cust_id			int			NOT NULL,
    PRIMARY KEY (order_num)
) ENGINE = InnoDB;

CREATE TABLE vendors
(
	vend_id 		int			NOT NULL AUTO_INCREMENT,
    vend_name   	char(50)	NOT NULL,
    vend_address	char(50)	NULL,
    vend_city		char(50)	NULL,
    vend_state		char(5)	 	NULL,
    vend_zip 		char(10)	NULL,
	vend_country	char(50)	NULL,
    PRIMARY KEY(vend_id)
) ENGINE = InnoDB;

# 主键再介绍
CREATE TABLE orderitems
(
	order_num 		int 		NOT NULL ,
    order_item		int 		NOT NULL ,
    prod_id			char(10)	NOT NULL ,
    quantity		int			NOT NULL ,
    item_price		decimal(8,2) NOT NULL,
    PRIMARY KEY(order_num, order_item)
) ENGINE = InnoDB;
# 订单号和订单物品的组合式唯一的，从而适合作为主键 

# 使用AUTO_INCREMENT（每个表只允许一个AUTO_INCREMENT, 而且它必须被索引）
# 确定AUTO_INCREMENT值 SELECT last_insert_id()

# 指定默认值
CREATE TABLE orderitems
(
	order_num	int 	NOT NULL ,
    order_item  int 	NOT NULL ,
    prod_id 	char(10)	NOT NULL,
	quantity 	int 	NOT NULL DEFAULT 1,
    item_price  decimal(8,2)	NOT NULL,
    PRIMARY KEY(order_num, order_item)
)ENGINE = InnoDB;

# 更新表  在表的设计过程中需要花费大量时间来考虑
# 以便后期不对表进行大的改动
ALTER TABLE vendors
ADD vend_phone CHAR(20);

ALTER TABLE vendors
DROP COLUMN vend_phone;

# ALTER TABLE 的一种常见用法是定义外键。下面是用来
# 定义本书中的表所用的外键的代码

ALTER TABLE orderitems
ADD CONSTRAINT fk_orderitems_orders
FOREIGN KEY (order_num) REFERENCES orders (order_num);

ALTER TABLE orderitems
ADD CONSTRAINT fk_orderitemd_products FOREIGN KEY (prod_id)
REFERENCES products(prod_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers FOREIGN KEY (cust_id)
REFERENCES customers (cust_id);

ALTER TABLE products
ADD CONSTRAINT fk_products_vendors
FOREIGN KEY (vend_id) REFERENCES vendors (vend_id);

# 删除表
DROP TABLE customers2;

#  重命名表
RENAME TABLE customers2 TO customers;

RENAME TABLE backup_customers TO customers,
			 backup_vendors TO  vendors,
             backup_products TO products;