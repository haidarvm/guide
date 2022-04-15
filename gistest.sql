CREATE INDEX ON location USING GIST(location);
CREATE TABLE global_points (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64),
    location GEOGRAPHY(POINT,4326)
  );
INSERT INTO global_points (name, location) VALUES ('bandung', 'SRID=4326;POINT(107.6049539 -6.9344694 )');
INSERT INTO global_points (name, location) VALUES ('Town', 'SRID=4326;POINT(-110 30)');
INSERT INTO global_points (name, location) VALUES ('Forest', 'SRID=4326;POINT(-109 29)');
INSERT INTO global_points (name, location) VALUES ('London', 'SRID=4326;POINT(0 49)');
  CREATE INDEX global_points_gix ON global_points USING GIST ( location );
	
SELECT ST_X(location::geometry),ST_Y(location::geometry)  FROM global_points;

  SELECT name FROM global_points WHERE ST_DWithin(location, 'SRID=4326;POINT( 107.6049539 -6.9344694 )'::geography, 1000000);
  SELECT ST_Distance('LINESTRING(-122.33 47.606, 0.0 51.5)'::geography, 'POINT(-21.96 64.15)'::geography);
	122.235
	
select * From location;

SELECT 'SRID=26910;POINT(-123 34)'::geography;
SELECT 'SRID=4326;POINT(-123 34)'::geography;

SELECT st_distancesphere(st_point(lat,lon)::geometry, st_point(-6.99284, 107.60179)::geometry) FROM location;

SELECT st_distancesphere(st_point(lat,lon)::geometry, st_point(-6.99284, 107.60179)::geometry) FROM location;

									 
SELECT location, name FROM location ORDER BY location <-> point '(-7.0023,107.5674)';
-- get in meters
select st_distancesphere(location::geometry, st_point(-6.93128,107.67618)),  st_distance(location::geometry, st_point(-6.93128,107.67618))  from location;

SELECT ST_Distance(
 ST_GeogFromText('SRID=4326;POINT(4.87660185549649 52.3551151038034 )')
, ST_GeogFromText('SRID=4326;POINT(107.67618) -6.93128)')
);

-- get from lat lon
SELECT st_distancesphere(ST_Point(lat,lon), ST_Point(-6.93128,107.67618)::geometry) as distances, name FROM location order by distances;

-- correct script
SELECT st_distancesphere(st_point(lat,lon), st_point(-6.93128,107.67618)), name FROM location;

SELECT st_distance(st_point(lat,lon), st_point(-6.93128,107.67618)) FROM location;
								 
select st_distance(text, text);

SELECT  st_distancesphere(st_point(-6.93128, 107.67618), st_point(-6.92910,107.67647)) 
 
 update location
 set location = concat(lat,',',long);
 
 select * From location where name IS NULL;
 select * From location where name ='';

 