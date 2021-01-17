CREATE USER 'todayid'@'localhost' IDENTIFIED BY 'b1smill4h@t2256';

GRANT ALL PRIVILEGES ON todayid.* To 'todayid'@'localhost' IDENTIFIED BY 'b1smill4h@t2256';

-- error ERROR 1419 (HY000) at line 31369: You do not have the SUPER privilege and binary logging is enabled 
mysql -u username -p set global log_bin_trust_function_creators=1;


=== create user =====
CREATE USER 'jabarnewscom'@'206.189.153.149' IDENTIFIED BY 'b1smill4hjnews477';

GRANT ALL PRIVILEGES ON jabarnews.* To 'jabarnewscom'@'206.189.153.149' IDENTIFIED BY 'b1smill4hjnews477';

GRANT ALL ON jabarnews.* TO 'jabarnewscom'@'206.189.153.149';
FLUSH PRIVILEGES;


mysql -u userName -p -f -D dbName < script.sql

ALTER USER 'root'@'localhost' IDENTIFIED BY 'hai2coders';


ALTER USER 'root'@'localhost' IDENTIFIED BY 'hai2coders';

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'hai2coders';
FLUSH PRIVILEGES;

UPDATE urls
SET url = REPLACE(url, 'domain1.com/images/', 'domain2.com/otherfolder/')

UPDATE skpkai_pdf_user
SET image_name = REPLACE(image_name, '/home/skpkai/public_html/', '/home/client/skpkai/public_html/')

ALTER TABLE old_table_name RENAME new_table_name;


select GROUP_CONCAT(stat SEPARATOR ' ') from (select concat('KILL ',id,';') as stat from information_schema.processlist) as stats;



=== create user =====
CREATE USER 'mers'@'192.168.137.100' IDENTIFIED BY 'hai2s@ms7nG';

GRANT ALL PRIVILEGES ON mers.* To 'mers'@'192.168.137.100';

GRANT ALL ON mers.* TO 'mers'@'192.168.137.100';
FLUSH PRIVILEGES;

ALTER USER 'mers'@'192.168.137.100' IDENTIFIED WITH mysql_native_password BY 'hai2s@ms7nG';

RENAME USER 'mers'@'192.168.137.100' TO 'mers'@'192.168.1.7';
