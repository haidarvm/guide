-- completely remove
sudo apt-get --purge remove "mariadb*"


-- install from official
curl -LsS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash

-- completely remove mariadb
apt-get --purge remove "mariadb*"

-- repair database
mysqlcheck -uusername -p databasename

-- all database
mysqlcheck -c -u root -p --all-databases


-- error ERROR 1419 (HY000) at line 31369: You do not have the SUPER privilege and binary logging is enabled 
mysql -u username -p set global log_bin_trust_function_creators=1;

-- search match
ALTER TABLE posts ADD FULLTEXT(post_title);
SELECT * FROM posts WHERE match(post_title) against('+persib bandung' IN BOOLEAN MODE) LIMIT 10;

-- mysql check variables
SHOW VARIABLES;
SHOW VARIABLES LIKE '%max_connect%';

-- show create tables sql format
SHOW CREATE TABLE `customer_address`;


-- create user
CREATE USER 'haidarvm'@'localhost';
GRANT ALL PRIVILEGES ON haidarvm.* To 'haidarvm'@'localhost' IDENTIFIED BY 'bismillah';


-- create users
CREATE TEMPORARY TABLE usertemp SELECT * FROM users WHERE ID = 5;
UPDATE usertemp SET ID = 8 WHERE ID = 5;
INSERT INTO users SELECT * FROM usertemp WHERE ID = 8;

-- insert wp users
INSERT INTO `users` (`user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES ('muhtoha', SHA1(UUID()), 'muhtoha', 'muhtoha@gmail.com', 'http://haidarvm.com', NOW(), UUID(), '1', 'muhtoha');

--  create user =====
CREATE USER 'jabarnewscom'@'206.189.153.114' IDENTIFIED BY 'bismillah';
GRANT ALL PRIVILEGES ON jabarnews.* To 'jabarnewscom'@'206.189.153.114' IDENTIFIED BY 'bismillah';
GRANT ALL ON jabarnews.* TO 'jabarnewscom'@'206.189.153.114';
FLUSH PRIVILEGES;

-- delete user ----
DROP USER 'bloguser'@'localhost';
DROP USER 'ekampusid'@'localhost';


mysql -u userName -p -f -D dbName < script.sql

ALTER USER 'root'@'localhost' IDENTIFIED BY 'bismillah';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'bismillah';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'bismillah';

CREATE USER 'haidar'@'%' IDENTIFIED BY 'bismillah';
CREATE USER 'dini'@'172.17.0.1' IDENTIFIED BY 'bismillah';
GRANT ALL ON *.* TO 'dini'@'172.17.0.1' IDENTIFIED BY 'bismillah';
GRANT ALL PRIVILEGES ON *.* To 'dini'@'172.17.0.1' IDENTIFIED BY 'bismillah';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.17.0.%' IDENTIFIED BY 'bismillah' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'bismillah';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'bismillah' WITH GRANT OPTION;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'bismillah';
FLUSH PRIVILEGES;

UPDATE urls
SET url = REPLACE(url, 'domain1.com/images/', 'domain2.com/otherfolder/')

UPDATE wp_posts set `post_content` = REPLACE(post_content, 'kitabemas.or.id', 'kitabemas.online');
UPDATE wp_posts set `guid` = REPLACE(guid, 'kitabemas.online', 'kitabemas.or.id')

UPDATE skpkai_pdf_user
SET image_name = REPLACE(image_name, '/home/skpkai/public_html/', '/home/client/skpkai/public_html/')

ALTER TABLE old_table_name RENAME new_table_name;

-- disable strict group by conf
sql-mode = "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"

---findReplace utfmb
sed 's/utf8mb4_0900_ai_ci/utf8_general_ci/g' original-mysql-data.sql > updated-mysql-data.sql
sed 's/utf8mb4/utf8/g' original-mysql-data.sql > updated-mysql-data.sql


sed 's/utf8mb4_0900_ai_ci/utf8_general_ci/g' 2020-10-26-fisipunla > updated-2020-10-26-fisipunla.sql
sed 's/utf8mb4/utf8/g' updated-2020-10-26-fisipunla.sql > updated2-2020-10-26-fisipunla.sql

select GROUP_CONCAT(stat SEPARATOR ' ') from (select concat('KILL ',id,';') as stat from information_schema.processlist) as stats;

-- show current config 
SHOW VARIABLES LIKE '%query%'; 

--- delete old data
DELETE from kks_dsensor_air where id_dSensor_air < 24821000;

-- create table with updated_at
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

-- updated_at change after update
ALTER TABLE `whatevertable` ADD `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL  AFTER `created_at`;

-- alter change field to update time on update
ALTER TABLE whatevertable  CHANGE whatevercolumn  whatevercolumn TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP   ON UPDATE CURRENT_TIMESTAMP;

-- alter change data type
ALTER TABLE post_data MODIFY body JSON;

-- select json
ALTER TABLE post_date CHANGE body 
SELECT JSON_EXTRACT(body, '$[1]') FROM post_data;

-- select json object
SELECT JSON_EXTRACT(body, '$.status') FROM post_data;

-- group concat order desc
SELECT GROUP_CONCAT(category_id ORDER BY category_id DESC)  FROM `wput_list_category` WHERE `post_id` = 5798

-- select json object
SELECT (UNIX_TIMESTAMP(created_at)*1000) as unix1, UNIX_TIMESTAMP(created_at) as unix FROM post_data; 

-- select most common
SELECT column, COUNT(*) AS datas 
FROM table 
GROUP BY column 
ORDER BY datas DESC

-- select longest char
ORDER BY LENGTH(description) DESC LIMIT 10;

-- update quran table
update  quranindo 
INNER join quran ON quranindo.id = quran.id
SET ayah = quran.ayah_text

CREATE TABLE `users` (
  `user_id` int(5)  NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(400) NOT NULL,
  `fullname` varchar(400) NOT NULL,
  `email` varchar(50)  NULL,
  `phone` varchar(50)  NULL,
  `token` varchar(255)  NULL,
  `is_active` ENUM('0','1') DEFAULT '0' ,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE posts (
    id int NOT NULL AUTO_INCREMENT,
    post_title varchar(255) NOT NULL,
    post_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE `stack`.`Posts`  (
  `Id` int(11) NULL,
  `PostTypeId` int(11) NULL,
  `ParentId` int(11) NULL,
  `AcceptedAnswerId` int(3) NULL,
  `CreationDate` datetime NULL,
  `Score` int(3) NULL,
  `ViewCount` int(11) NULL,
  `Body` text NULL,
  `OwnerUserId` int(11) NULL,
  `LastEditorUserId` int(11) NULL,
  `LastEditDate` datetime NULL,
  `LastActivityDate` datetime NULL,
  `Title` varchar(2000) NULL,
  `Tags` varchar(2000) NULL,
  `AnswerCount` int(11) NULL,
  `CommentCount` int(11) NULL,
  `FavoriteCount` int(11) NULL,
  `ContentLicense` varchar(2000) NULL
);


 <row Id="1" PostTypeId="1" AcceptedAnswerId="161" CreationDate="2010-08-05T19:34:49.473" Score="54" ViewCount="166544" Body="&lt;p&gt;When should I use &lt;em&gt;can&lt;/em&gt;? When should I use &lt;em&gt;could&lt;/em&gt;?&lt;br&gt;&-- xA;What is right under what context?&lt;/p&gt;&-- xA;" OwnerUserId="9" LastEditorUserId="300" LastEditDate="2013-01-24T22:00:48.513" LastActivityDate="2015-06-12T21:02:26.507" Title="When do I use &quot;can&quot; or &quot;could&quot;?" Tags="&lt;word-choice&gt;&lt;tenses&gt;&lt;politeness&gt;&lt;subjunctive-mood&gt;&lt;can-could&gt;" AnswerCount="6" CommentCount="4" FavoriteCount="36" ContentLicense="CC BY-SA 3.0" />

-- export trigger only
mysqldump -u root -p --routines --no-create-info --no-data --no-create-db --skip-opt asli_pjb > asli_pjb_trigger.sql

-- duplicate without copy
CREATE TABLE newtable LIKE oldtable ; 

-- duplicate table
CREATE TABLE tbl_new AS SELECT * FROM tbl_old;

-- load csv    
LOAD DATA LOCAL INFILE 'abc.csv' IGNORE INTO TABLE abc
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@col1, col2, col3, col4, col5);

-- load txt
LOAD DATA LOCAL 
    INFILE '/tmp/mtext.txt' INTO TABLE json

-- convert xml to sql
LOAD XML LOCAL INFILE 'Posts.xml' INTO TABLE Posts;


LOAD XML LOCAL INFILE 'Posts.xml'
INTO TABLE Posts
ROWS IDENTIFIED BY 'Posts';

LOAD XML LOCAL INFILE 'Tags.xml'
INTO TABLE Tags
ROWS IDENTIFIED BY 'Tags';

-- export csv
mysqldump -u root -p -t  -T/tmp  stack Posts --fields-terminated-by=','

-- clean id
INSERT INTO Posts_id (post_id)  SELECT id FROM Posts;

-- province insert ignore
INSERT IGNORE INTO province(province_name) SELECT province from district ORDER BY province ASC;

-- insert city with province
INSERT IGNORE INTO city(province_name, city_name) SELECT province, city FROM district ORDER BY city ASC;

-- mapping province id 
SELECT p.province_id, p.province_name, c.province_name
FROM city c
INNER JOIN province p ON p.province_name = c.province_name 

-- Update city with provicen id
UPDATE city c
INNER JOIN province p ON p.province_name = c.province_name 
SET c.province_id = p.province_id

-- mapping city_id on district
SELECT c.city_id, c.city_name, d.city
FROM district d
INNER JOIN city c ON c.city_name = d.city

-- Update district with city id
UPDATE district d
INNER JOIN city c ON c.city_name = d.city
SET d.city_id = c.city_id


SELECT * FROM `district`
WHERE city_id=362

-- select same value 
SELECT district, count(*) AS c
FROM district
GROUP BY district
HAVING c > 1
ORDER BY c DESC


--- beritainspiratif repair ---
CREATE TABLE wprg_popular_posts_inno AS SELECT * FROM wprg_popular_posts; 
ALTER TABLE wprg_popular_posts_inno ENGINE = INNODB;
ALTER TABLE wprg_popular_posts RENAME wprg_popular_posts_bak;
ALTER TABLE wprg_popular_posts_inno RENAME wprg_popular_posts;


-- GIS Spatial 
-- -6.930535830053941, 107.67589986346103
-- -6.910082661685127, 107.65429371643137

SET @g1 = ST_GeomFromText('POINT(1 1)', 4326);
SET @g2 = ST_GeomFromText('POINT(2 2)', 4326);

SELECT ST_Distance(@g1, @g2);

-- real data
SET @g1 = ST_GeomFromText('POINT(-6.9313431075398055 107.6764776013658)', 4326);
SET @g2 = ST_GeomFromText('POINT(-6.9291509708830965 107.67644972737274)', 4326);

SELECT ST_Distance(@g1, @g2);


SET @g1 = ST_GeomFromText('POINT(-6.9313431075398055 107.6764776013658)', 4326);
SET @g2 = ST_GeomFromText('POINT(-6.925014724732742 107.70379269171875)', 4326);

SELECT ST_Distance(@g1, @g2);


SET @g1 = ST_GeomFromText('POINT(-6.931342140442688 107.67648472916808)', 4326);
SET @g2 = ST_GeomFromText('POINT(-6.930425656234586 107.67672608183953)', 4326);

SELECT ST_Distance(@g1, @g2);

SELECT ST_Distance(@g1, @g2,'metre');

 select ST_Distance_Sphere(
    point(-87.6770458, 41.9631174),
    point(-73.9898293, 40.7628267)) ;
    
select ST_Distance_Sphere(
    ST_GeomFromText('POINT(-6.931342140442688 107.67648472916808)', 4326),
	 ST_GeomFromText('POINT(-6.930425656234586 107.67672608183953)', 4326));
	 
select ST_Distance(
    ST_GeomFromText('POINT(-6.931342140442688 107.67648472916808)', 4326),
	 ST_GeomFromText('POINT(-6.930425656234586 107.67672608183953)', 4326));

-- ST_Within()
-- ST_Equals()
-- ST_Intersects()
-- ST_Contains()


-- compare using gogole distance api
