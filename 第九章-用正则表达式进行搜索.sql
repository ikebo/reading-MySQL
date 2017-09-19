# 第九章-用正则表达式进行搜索

# 基本字符匹配
SELECT prod_name FROM products WHERE prod_name REGEXP '1000' ORDER BY prod_name;

SELECT prod_name FROM products WHERE prod_name REGEXP '.000' ORDER BY prod_name;

# LIKE 和 REGEXP 的差别
SELECT prod_name FROM products WHERE prod_name LIKE '1000' ORDER BY prod_name;
SELECT prod_name FROM products WHERE prod_name REGEXP '1000' ORDER BY prod_name;
# 发现第一条语句不反回数据，而第二条返回
#（LIKE 不进行相等匹配，而是用通配符进行相似匹配）

# 进行 OR 匹配
SELECT prod_name FROM products WHERE prod_name REGEXP '1000|2000' ORDER BY prod_name;

# 匹配几个字符之一
SELECT prod_name FROM products WHERE prod_name REGEXP '[123] Ton' ORDER BY prod_name;
SELECT prod_name FROM products WHERE prod_name REGEXP '1|2|3 Ton' ORDER BY prod_name;

# 匹配范围
SELECT prod_name FROM products WHERE prod_name REGEXP '[1-5] Ton';

# 匹配特殊字符
SELECT vend_name FROM vendors WHERE vend_name REGEXP '\\.' ORDER BY vend_name;

# 匹配多个实例
SELECT prod_name FROM products WHERE prod_name REGEXP '\\([0-9] sticks?\\)';
SELECT prod_name FROM products WHERE prod_name REGEXP '[[:digit:]{4}]';

# 定位符
SELECT prod_name FROM products WHERE prod_name REGEXP '^[0-9\\.]' ORDER BY prod_name;