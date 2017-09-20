# 第十九章-插入数据

# 插入完整的行  要求指定表名和被插入到新航中的值
USE book;

INSERT INTO customers
VALUES(NULL,
	   'Pep E. LaPew',
       '100 Main Street',
       'Los Angeles',
       'CA',
       '90046',
       'USA',
       NULL,
       NULL);
       
 SHOW COLUMNS FROM customers;
 SELECT * FROM customers;
 
 INSERT INTO customers(cust_name,
	cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country,
    cust_contact,
    cust_email)
    VALUES('Pep E. LaPew',
			'100 Main Street',
            'Los Angeles',
            'CA',
            '90046',
            'USA',
            NULL,
            NULL);
SELECT * FROM customers;

INSERT INTO customers(cust_name,
	cust_contact,
    cust_email,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country)
    VALUES('Pep E.Lapew',
		NULL,
        NULL,
        '100 Main Street',
        'Los Angeles',
        'CA',
        '90046',
        'USA');
        
# 插入多个行
INSERT INTO customers(cust_name,
	cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country)
    VALUES(
			'Pep, E. LaPew',
            '100 Main Street',
            'Los Angeles',
            'CA',
            '90046',
            'USA'
            ),
		(
			'M. Martian',
            '42 Galaxy',
            'New York',
            'NY',
            '11213',
            'USA'
		);
        
SELECT * FROM customers;

INSERT INTO customers(cust_id,
	cust_contact,
    cust_email,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country)
SELECT cust_id,
	cust_contact,
    cust_email,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country
FROM custnew;
