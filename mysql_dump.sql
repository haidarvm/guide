

mysqldump -u root -p haidarvm PostsId > PostsId.sql


mysqldump -u root -p --databases db1 db2 db3 > dball_backup15okt1319.sql
mysqldump -u root -p --all-databases > all_databases.sql

#backup to gzip
mysqldump -u root -p --databases db1 db2 db3 | gzip > db_all_backupT430Apr2.sql.gz

#toGzip
mysqldump -u root -p database_name | gzip > dump.gz

#restore
mysql -u root -p < database.sql
