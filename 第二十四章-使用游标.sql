-- 第二十四章-使用游标

-- 创建游标
USE BOOK;
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
	DECLARE ordernumbers CURSOR
    FOR
    SELECT order_num FROM orders;
END //
DELIMITER ;
-- 游标失效，因为它局限于存储过程
-- 打开和关闭游标
OPEN ordernumbers;
CLOSE ordernumbers;

DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
    -- Declare the cursor
    DECLARE ordernumbers CURSOR
    FOR
    SELECT order_num FROM orders;
    
    -- Open the cursor
    OPEN ordernumbers;
    
    -- Close the cursor
    CLOSE ordernumbers;
END //
DELIMITER ;

-- 使用游标数据
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN 
    -- Declare local variables
    DECLARE o INT;
    
    -- Declare the cursor
    DECLARE ordernumbers CURSOR
	FOR
    SELECT order_num FROM orders;
    
    -- open the cursor
    OPEN ordernumbers;
    
    -- Get order number
    FETCH ordernumbers INTO o;
    
    -- Close the cursor
    CLOSE ordernumbers;
    
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
	-- Declare local variables
    DECLARE done BOOLEAN DEFAULT 0;
    DECLARE o INT;
    
    -- Declare the cursor
    DECLARE ordernumbers CURSOR
    FOR
    SELECT order_num FROM orders;
    
    -- Decalre continue handler
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
    
    -- Open the cursor
    OPEN ordernumbers;
    -- Loop through all rows
    REPEAT
		-- Get order number
        FETCH ordernumbers INTO o;
	-- End of loop
	UNTIL done END REPEATl
    
    -- CLOSE the cursor
    CLOSE ordernumbers;
END;
DELIMITER ;

DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
	-- Declare local variables
    DECLARE done BOOLEAN DEFAULT 0;
    DECLARE o INT;
    DECLARE t DECIMAL(8,2);
	
    -- Dclare the cursor
    DECLARE ordernumbers CURSOR
    FOR
    SELECT order_num FROM orders;
    
    -- Dclare continue handler
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
    
    -- Create a table to store the results
    CREATE TABLE IF NOT EXISTS ordertotals
		(order_num INT, total DECIMAL(8,2));
        
	-- Open the cursor
    OPEN ordernumbers;
    
    -- Loop through all rows
    REPEAT
		-- Get order number
        FETCH ordernumbers INTO o;
        
        -- Get the total for this order
        CALL ordertotal(0, 1, t);
        
        -- INSERT order and total into ordertotals
        INSERT INTO ordertotals(order_num, total)
        VALUES(0, t);
		
        -- End of loop
        UNTIL done END REPEAT;
        
        -- Close the cursor
        CLOSE ordernumbers;
        
END;
DELIMITER ;

SELECT * FROM ordertotals;

