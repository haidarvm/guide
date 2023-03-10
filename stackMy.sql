select count(Id) from Posts where ViewCount IS  NULL;
-- DELETE FROM Posts_clean where  ViewCount IS  NULL;
select count(Id) from Posts ;
select count(autoid) from PostsId;

INSERT INTO PostsId (post_id) select id from Posts;
select count(autoid) FROM Posts_id;
SELECT Body FROM Posts p INNER JOIN PostsId i ON i.post_id = p.id  where autoid =1199;
SELECT Body FROM Posts p INNER JOIN PostsId i ON i.post_id = p.id where autoid =153224
SELECT Body FROM 'Posts' p INNER JOIN PostsId i ON i.post_id = p.id where autoid =172072


SELECT count(id) From json

SELECT p.Body, a.Body FROM Posts p INNER JOIN Posts a ON p.Id = a.Id where p.Id =546;

SELECT p.* FROM Posts p where p.Id =546;
SELECT * FROM PostLinks where RelatedPostId =546;


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

