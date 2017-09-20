# 全文本搜索

USE test;

CREATE TABLE productnotes
(
	note_id		int			NOT NULL	AUTO_INCREMENT,
	prod_id		char(10)	NOT NULL,
	note_date   datetime    NOT NULL,
    note_text	text		NULL,
    PRIMARY KEY(note_id),
    FULLTEXT(note_text)
) ENGINE=MyISAM;

SHOW tables FROM test;

SHOW COLUMNS FROM productnotes;

# 进行全文本索搜
USE book;

SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('rabbit');
# 这句返回匹配'rabbit'的行
# 传递给Match()的值必须与FULLTEXT()定义中的相同

SELECT note_text
FROM productnotes
WHERE note_text LIKE '%rabbit%';

SELECT note_text,
       Match(note_text)  Against('rabbit') AS rank
FROM productnotes;

# 使用查询扩展
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('anvils');

SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('anvils' WITH QUERY EXPANSION);
# 返回了7行，第一行包含词‘anvils’， 因此等级最高。
# 第二行与anvils无关，但因为它包含第一行中的两个词，所以也被检索出来

# 布尔文本搜索
# 要匹配的词，要排斥的词，排列提示，表达式分组，另外一些内容。
# 没有FULLTEXT索引也可以使用
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('heavy' IN BOOLEAN MODE);
# 这行并没有指定布尔操作符，因此，其结果与没指定时一样


# 排除一个词， * 代表词尾
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('heavy -rope*' IN BOOLEAN MODE);

# 必须有
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('+rabbit +bait' IN BOOLEAN MODE);

# 短语
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('"rabbit bait"' IN BOOLEAN MODE);

# 包含，并增加和降低词的等级
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('>rabbit <carrot' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('+safe +(<combination)' IN BOOLEAN MODE); 

