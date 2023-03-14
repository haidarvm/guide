sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
# rhel 9
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm

sudo dnf -qy module disable postgresql
sudo dnf install -y postgresql14-server
sudo /usr/pgsql-14/bin/postgresql-14-setup initdb || postgresql-setup --initdb
sudo systemctl enable postgresql-14
sudo systemctl start postgresql-14

-- go to postgres bash
sudo su - postgres
psql

-- create password
\password

-- reset password
nano /var/lib/pgsql/13/data/pg_hba.conf
edit line : 
local   all             all                                trust
sudo systemctl restart postgresql

-- change main conf md5
nano /var/lib/pgsql/12/data/pg_hba.conf
nano /etc/postgresql/13/main/pg_hba.conf

local   all             postgres                                md5

sudo vi /var/lib/pgsql/main/pg_ident.conf

-- connect
psql -U postgres -h localhost
psql -U postgres


-- pgadmin4-web
sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-redhat-repo-2-1.noarch.rpm

-- Install for desktop mode only.
sudo dnf install pgadmin4-desktop

-- Install for web mode only.
sudo dnf install pgadmin4-web

-- install for web only
sudo /usr/pgadmin4/bin/setup-web.sh

-- open in browser
http://localhost:88/pgadmin4/browser


-- create databsae
CREATE DATABASE invtcmit; 

-- show all db
\l

-- use database
\c news;

-- show tables
\dt

-- show create table
pg_dump -U <user> -h <host> -st <tablename> <db name>

CREATE TABLE posts (
id SERIAL,
post_title varchar,
post_date timestamp without time zone DEFAULT now());

CREATE TABLE employees (
id SERIAL,
name varchar,
salary bigint,
age int
);

CREATE TABLE "user" (
  "user_id" SERIAL PRIMARY KEY,
  "username" varchar(200) NOT NULL,
  "fullname" varchar(2000)  NOT NULL,
  "create_at" timestamp NOT NULL DEFAULT NOW(),
  "last_login" timestamp 
);

-- uniq
ALTER TABLE "user" ADD CONSTRAINT uniqusername UNIQUE (username);
ALTER TABLE "mt_user" ADD CONSTRAINT uniqemail UNIQUE (email);

CREATE TABLE transaction (
trx_id SERIAL PRIMARY KEY,
trx_type int,
account_id int,
amount BIGINT,
trx_date timestamp NOT NULL DEFAULT NOW()
);

CREATE TABLE posts_id (
autoid SERIAL PRIMARY KEY,
post_id int4
);

insert into employees(name,salary, age) values ('haidar','14000000', '34');


#import OSM
create extension postgis; create extension hstore;
osm2pgsql -d indogis -U postgres -H localhost -W -C 4000 indonesia-latest.osm.pbf 


#duplicate copy table
CREATE TABLE posts_clean AS SELECT * FROM posts where viewcount IS NOT NULL;

-- stack.Posts definition

CREATE TABLE Posts (
  Id bigint ,
  PostTypeId int ,
  AcceptedAnswerId int ,
  CreationDate TIMESTAMP without time zone ,
  Score int ,
  ViewCount int ,
  Body text ,
  OwnerUserId int ,
  LastEditorUserId int ,
  LastEditDate TIMESTAMP without time zone ,
  LastActivityDate TIMESTAMP without time zone ,
  Title varchar ,
  Tags varchar ,
  AnswerCount int ,
  CommentCount int ,
  FavoriteCount int ,
  ContentLicense varchar 
) 

CREATE TABLE public.posts (
	id int8 NULL,
	posttypeid int4 NULL,
	acceptedanswerid int4 NULL,
	creationdate timestamp NULL,
	score int4 NULL,
	viewcount int4 NULL,
	body text NULL,
	owneruserid int4 NULL,
	lasteditoruserid int4 NULL,
	lasteditdate timestamp NULL,
	lastactivitydate timestamp NULL,
	title varchar NULL,
	tags varchar NULL,
	answercount int4 NULL,
	commentcount int4 NULL,
	favoritecount int4 NULL,
	contentlicense varchar NULL
);


#rename table
ALTER TABLE "Posts" RENAME TO posts;
ALTER TABLE "PostsId" RENAME TO postsid;

id posttypeid acceptedanswerid creationdate creationdate score viewcount owneruserid lasteditoruserid lasteditdate lastactivitydate title tags answercount commentcount favoritecount contentlicense

id,posttypeid,acceptedanswerid,creationdate,creationdate,score,viewcount,owneruserid,lasteditoruserid,lasteditdate,lastactivitydate,title,tags,answercount,commentcount,favoritecount,contentlicense

COPY posts(id,posttypeid,acceptedanswerid,creationdate,creationdate,score,viewcount,owneruserid,lasteditoruserid,lasteditdate,lastactivitydate,title,tags,answercount,commentcount,favoritecount,contentlicense)
FROM '/tmp/Posts.txt' DELIMITER ','
