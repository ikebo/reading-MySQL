# 第二十三章 - 使用存储过程

# 执行存储过程
CALL productpricing(@pricelow,
					@pricehigh,
                    @priceaverage);
                    
# 创建存储过程
# 改变分隔符
DELIMITER //

USE book//
CREATE PROCEDURE productpricing()
BEGIN
	SELECT Avg(prod_price) AS priceaverge
    FROM products;
END //

DELIMITER ;

CALL productpricing();

# 删除存储过程
DROP PROCEDURE productpricing;

# 使用参数
DELIMITER //
CREATE PROCEDURE productpricing(
	OUT pl DECIMAL(8,2),
	OUT ph DECIMAL(8,2),
    OUT pa DECIMAL(8,2)
)
BEGIN
	SELECT Min(prod_price)
    INTO pl
    FROM products;
    SELECT Max(prod_price)
    INTO ph
    FROM products;
    SELECT Avg(prod_price)
    INTO pa
    FROM products;
    
END//
DELIMITER ;

CALL productpricing(@pricelow,
					@pricehigh,
                    @priceaverage);
                    
SELECT @priceaverage;

SELECT @pricehigh, @pricelow, @priceaverage;

DELIMITER //
CREATE PROCEDURE ordertotal(
	IN onumber INT,
    OUT ototal DECIMAL(8,2)
)
BEGIN
	SELECT Sum(item_price * quantity)
    FROM orderitems
    WHERE order_num = onumber
    INTO ototal;
END //
DELIMITER ;

CALL ordertotal(20005, @total);

SELECT @total;
CALL ordertotal(20009, @total);
SELECT @total;

# 建立只能存储过程
-- Name: ordertotal
-- Parameters: onumber = order number
--        taxable = o if not taxable, 1 if taxable
--        ototal = order total variable

DELIMITER //
CREATE PROCEDURE ordertotal(
	IN onumber INT,
    IN taxable BOOLEAN,
    OUT ototal DECIMAL(8,2)
) COMMENT 'Obtain order total, optionally adding tax'
BEGIN
	-- Declare variable for total
    DECLARE total DECIMAL(8,2);
    -- Declare tax percentage
    DECLARE taxrate INT DEFAULT 6;
    
    -- Get the order total
    SELECT Sum(item_price * quantity)
    FROM orderitems
    WHERE order_num = onumber
    INTO total;
    
    -- Is this taxable
    IF taxable THEN
		-- Yes, so add taxrate to the total
        SELECT total + (total / 100 * taxrate) INTO total;
	END IF;
	-- And finally, save to out variable
    SELECT total INTO ototal;
END;
DELIMITER ;

CALL ordertotal(20005, 0, @total);
SELECT @total;

CALL ordertotal(20005, 1, @total);
SELECT @total;

-- 检查存储过程
SHOW CREATE PROCEDURE ordertotal;
SHOW PROCEDURE STATUS;

SHOW PROCEDURE STATUS LIKE 'ordertotal';





