-- go to postgres bash
sudo su - postgres
psql

-- create password
\password


-- change main conf md5
nano /var/lib/pgsql/12/data/pg_hba.conf
nano /etc/postgresql/13/main/pg_hba.conf

sudo systemctl restart postgresql


-- connect
psql -U postgres -h localhost
psql -U postgres

-- create databsae
CREATE DATABASE invtcmit;
 


-- show all db
\l

-- use database
\c news;

-- show tables
\dt

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
