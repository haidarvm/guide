select id, LENGTH(body) as lenb from posts where viewcount IS NOT NULL ORDER BY lenb DESC LIMIT 1000;
select count(Id) from posts ;
select * FROM posts where id=504812;
SELECT * FROM "Posts" LIMIT 10
SELECT p."Body" FROM "Posts" p INNER JOIN "PostsId" i ON i.post_id = p."Id" where autoid =172072
SELECT p."Body" FROM "Posts" p INNER JOIN "PostsId" i ON i.post_id = p."Id" where autoid =79985
SELECT count(id) from PostsId;

--INSERT INTO posts_id (post_id) select id from posts_clean

SELECT count(autoid) from posts_id;

SELECT * FROM Posts where Body LIKE '%In pre-atomic theory%';

SELECT p.Body FROM Posts p INNER JOIN Posts a ON p.Id = a.Id where p.Id =546;

SELECT Body FROM Posts_clean c INNER JOIN Posts_id i ON i.post_id = c.id  where autoid =1199;

SELECT posttypeid From posts GROUP BY posttypeid;
