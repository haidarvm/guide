-- import db
psql -U postgres -d dbname -a -f c:/dbname.sql
psql -U postgres -h localhost -d stack -a -f stack_pg.sql
psql -U postgres -d stack -a -f stack_pg.sql

-- export db
pg_dump dbname > db.sql
pg_dump -U postgres -F c dbname > dbname.tar
pg_dump -U postgres dangerousdb | gzip > dangerousdb.gz


-- restore db
-- if exists
pg_restore -U postgres -Ft -d dbcooper < dbcooper.tar
--- if not exist
pg_restore -U postgres -Ft -C -d dbcooper < dbcooper.tar

-- restore
psql -f dbcopper.sql


pg_dump -h localhost -U postgres --format plain --verbose --file wprg_posts.sql --table public.wprg_posts jabarnews

pg_dump -h localhost -U postgres  --verbose --file Posts.sql --table '"Posts"' stack

-- table
pg_dump -h localhost -U postgres -t '"Posts"' -t '"PostsId"' stack > stack_pg.sql



-- drop db
DROP DATABASE dbname;

-- create db
CREATE DATABASE dbname;

-- PGADMIN BACKUP
pg_dump.exe --host localhost --port 5432 --username "postgres" --role "postgres" --no-password  --format tar --blobs --verbose --file "D:\backup\pg_gps5_11_15.backup" "gps_tcm"

-- PGADMIN RESTORE
/usr/bin/pg_restore --host localhost --port 5432 --username "postgres" --dbname "gps_tcm" --role "postgres" --no-password  --verbose "/home/haidar/public_html/pg_gps5_11_15.backup"


