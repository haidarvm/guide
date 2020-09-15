#completely remove
sudo apt-get --purge remove "mariadb*"


#install from official
curl -LsS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash

#completely remove mariadb
apt-get --purge remove "mariadb*"


CREATE USER 'todayid'@'localhost';

GRANT ALL PRIVILEGES ON todayid.* To 'todayid'@'localhost' IDENTIFIED BY 'b1smill4h@t2256';


=== create user =====
CREATE USER 'jabarnewscom'@'206.189.153.149' IDENTIFIED BY 'b1smill4hjnews477';

GRANT ALL PRIVILEGES ON jabarnews.* To 'jabarnewscom'@'206.189.153.149' IDENTIFIED BY 'b1smill4hjnews477';

GRANT ALL ON jabarnews.* TO 'jabarnewscom'@'206.189.153.149';
FLUSH PRIVILEGES;


mysql -u userName -p -f -D dbName < script.sql

ALTER USER 'root'@'localhost' IDENTIFIED BY 'hai2coders';


ALTER USER 'root'@'localhost' IDENTIFIED BY 'hai2coders';

CREATE USER 'haidar'@'%' IDENTIFIED BY 'hai2coders';
CREATE USER 'dini'@'172.17.0.1' IDENTIFIED BY 'hai2coders';
GRANT ALL ON *.* TO 'dini'@'172.17.0.1' IDENTIFIED BY 'hai2coders';
GRANT ALL PRIVILEGES ON *.* To 'dini'@'172.17.0.1' IDENTIFIED BY 'hai2coders';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.17.0.%' IDENTIFIED BY 'hai2coders' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'hai2coders';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'hai2coders' WITH GRANT OPTION;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'hai2coders';
FLUSH PRIVILEGES;

UPDATE urls
SET url = REPLACE(url, 'domain1.com/images/', 'domain2.com/otherfolder/')

UPDATE skpkai_pdf_user
SET image_name = REPLACE(image_name, '/home/skpkai/public_html/', '/home/client/skpkai/public_html/')

ALTER TABLE old_table_name RENAME new_table_name;


select GROUP_CONCAT(stat SEPARATOR ' ') from (select concat('KILL ',id,';') as stat from information_schema.processlist) as stats;


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


 <row Id="1" PostTypeId="1" AcceptedAnswerId="161" CreationDate="2010-08-05T19:34:49.473" Score="54" ViewCount="166544" Body="&lt;p&gt;When should I use &lt;em&gt;can&lt;/em&gt;? When should I use &lt;em&gt;could&lt;/em&gt;?&lt;br&gt;&#xA;What is right under what context?&lt;/p&gt;&#xA;" OwnerUserId="9" LastEditorUserId="300" LastEditDate="2013-01-24T22:00:48.513" LastActivityDate="2015-06-12T21:02:26.507" Title="When do I use &quot;can&quot; or &quot;could&quot;?" Tags="&lt;word-choice&gt;&lt;tenses&gt;&lt;politeness&gt;&lt;subjunctive-mood&gt;&lt;can-could&gt;" AnswerCount="6" CommentCount="4" FavoriteCount="36" ContentLicense="CC BY-SA 3.0" />

#duplicate table
CREATE TABLE tbl_new AS SELECT * FROM tbl_old;

#load txt
LOAD DATA LOCAL 
    INFILE '/tmp/mtext.txt' INTO TABLE json

#convert xml to sql
LOAD XML LOCAL INFILE 'Posts.xml' INTO TABLE Posts;


LOAD XML LOCAL INFILE 'Posts.xml'
INTO TABLE Posts
ROWS IDENTIFIED BY 'Posts';

LOAD XML LOCAL INFILE 'Tags.xml'
INTO TABLE Tags
ROWS IDENTIFIED BY 'Tags';

#export csv
mysqldump -u root -p -t  -T/tmp  stack Posts --fields-terminated-by=','

#clean id
INSERT INTO Posts_id (post_id)  SELECT id FROM Posts;
