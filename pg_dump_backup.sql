-- import db
psql -U postgres -d invtcmit -a -f c:/invtcmit.sql
psql -U postgres -h localhost -d stack -a -f stack_pg.sql

-- export db
pg_dump -U postgres -o -v -d invtcmit > C:/invtcmit.sql

pg_dump -h localhost -U postgres --format plain --verbose --file wprg_posts.sql --table public.wprg_posts jabarnews

pg_dump -h localhost -U postgres  --verbose --file Posts.sql --table '"Posts"' stack

-- table
pg_dump -h localhost -U postgres -t '"Posts"' -t '"PostsId"' stack > stack_pg.sql


pg_dump -h localhost -Fc test > /home/postgres/dump.sql


-- drop db
DROP DATABASE invtcmit;

-- create db
CREATE DATABASE invtcmit;

-- PGADMIN BACKUP
pg_dump.exe --host localhost --port 5432 --username "postgres" --role "postgres" --no-password  --format tar --blobs --verbose --file "D:\backup\pg_gps5_11_15.backup" "gps_tcm"

-- PGADMIN RESTORE
/usr/bin/pg_restore --host localhost --port 5432 --username "postgres" --dbname "gps_tcm" --role "postgres" --no-password  --verbose "/home/haidar/public_html/pg_gps5_11_15.backup"


