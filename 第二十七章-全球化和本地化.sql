# 第二十七章-全球化和本地化

# 所支持的字符集完整列表
SHOW CHARACTER SET;

# 所支持的校对的完整列表
SHOW COLLATION;

# 确定所有的字符集和校对
SHOW VARIABLES LIKE 'character%';
SHOW VARIABLES LIKE 'collation%';

# 为了指定字符集和校对，可使用带字句的CREATE TABLE
CREATE TABLE mytable
(
	columnn1 INT,
    columnn2 VARCHAR(10)
) DEFAULT CHARACTER SET hebrew
  COLLATE hebrew_general_ci;
# 可以对每个列设置它们

CREATE TABLE mytable
(
	columnn1 INT,
    columnn2 VARCHAR(10),
    column3	 VARCHAR(10) CHARACTER SET latin1 COLLATE
) DEFAULT CHARACTER SET hebrew
  COLLATE hebrew_general_ci;
  
SELECT * FROM customers
ORDER BY lastname, firstname COLLATE latin1_general_cs;
