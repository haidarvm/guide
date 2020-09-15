-- create password
\password

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


id posttypeid acceptedanswerid creationdate creationdate score viewcount owneruserid lasteditoruserid lasteditdate lastactivitydate title tags answercount commentcount favoritecount contentlicense

id,posttypeid,acceptedanswerid,creationdate,creationdate,score,viewcount,owneruserid,lasteditoruserid,lasteditdate,lastactivitydate,title,tags,answercount,commentcount,favoritecount,contentlicense

COPY posts(id,posttypeid,acceptedanswerid,creationdate,creationdate,score,viewcount,owneruserid,lasteditoruserid,lasteditdate,lastactivitydate,title,tags,answercount,commentcount,favoritecount,contentlicense)
FROM '/tmp/Posts.txt' DELIMITER ','
