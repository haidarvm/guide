
#debian
docker run -t -d --name debiantest debian
docker run -t -d --name centos7 centos/httpd-24-centos7 
docker exec -it my_debian bash

#pull centos 7
docker pull centos:7

#run 
docker run -t -d --name clearlinuxtest clearlinux

#start by name
sudo docker start centos7

#nginx
docker run -it --rm -d -p 8080:80 --name nginxtest nginx

#exec docker
sudo docker exec -u root -it centos7 bash
sudo docker exec -it clearlinuxtest bash

#list
docker image list

#list running docker
docker ps -a

#run nginx
sudo /usr/sbin/nginx -s reload

#running by id
sudo docker run fe1f71042611

#stop running docker
sudo docker stop centos7

#remove image
docker rmi <image-id>

#docker copy from host to container
docker cp foo.txt container_id:/home/
#docker copy from container to host
docker cp container_id:/home/foo.txt foo.txt


#run as root
sudo docker exec -u root -it centos7 bash

#docker ubuntu 18.04
docker run -it --name centostest ubuntu:18.04 bash

docker run --name mariadbtest --net=host -e MYSQL_ROOT_PASSWORD=hai2coders -v /var/lib/mariadb:/var/lib/mysql -d mariadb

docker run -p 3306:3306 --name mysqltest  --network=host -e MYSQL_ROOT_PASSWORD=hai2coders -d mysql

docker run --name mysql1 -p 3306:3306 --network=host -e MYSQL_ROOT_PASSWORD=password -v mysql:/var/lib/mysql -d mysql/mysql-server

#correct to run mysql using local
docker run --name mysqltest --net=host -v /var/lib/mysql/:/var/lib/mysql/ mysql/mysql-server
docker run --name mysqltest --net=host -e MYSQL_ROOT_PASSWORD=hai2coders -v /var/run/mysqld/mysql.sock:/var/run/mysqld/mysql.sock -d mysql/mysql-server

docker run --name mysql2 --net=host -it -e MYSQL_ROOT_PASSWORD=hai2coders -v /host:/shared -d mysql/mysql-server


#run
mysql -h 127.0.0.1 -u root -p

#docker_run0aa083728d87
docker run  -p 3306:3306  -v /var/lib/mysql/:/var/lib/mysql/ mysqltest
/var/lib/mysql/mysql.sock

docker ps
docker start 

#no service
yum install initscripts


docker run --rm -d --network host --name nginxtest nginx


docker run --name mysqltest --net=host -e MYSQL_ROOT_PASSWORD=hai2coders -d mysql/mysql-server:latest

#lighttpd
docker run --rm -d --network host --name lighttpd lighttpd

#oracle
docker run --name oraclexe -d -p 51521:1521 -p 55500:5500 -e ORACLE_PWD=hai2coders -e ORACLE_CHARACTERSET=AL32UTF8 oracle/database:18.4.0-xe
docker run --name oraclexe -d -p 1521:1521 -p 5500:5500 -e ORACLE_PWD=hai2coders -e ORACLE_CHARACTERSET=AL32UTF8 oracle/database:18.4.0-xe

docker exec -it --user=oracle oraclexe bash
./sqlplus  sys/hai2coders@//localhost:1521/XE as sysdba
./sqlplus sys/hai2coders@\"localhost:1521/XEPDB1\" as sysdba
./sqlplus haidar/hai2coders@\"localhost:1521/XEPDB1\"
 
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER haidar IDENTIFIED BY "hai2coders";
alter user haidar identified by "hai2coders" account unlock; 
GRANT CREATE SESSION TO haidar;
GRANT CONNECT TO haidar;
grant all privileges to haidar;

#postgres
docker run --name postgrestest --net=host -e POSTGRES_PASSWORD=hai2coders -d postgres
docker exec -it postgrestest psql -U postgres

#centos
docker run --name centostest --net=host centos
docker run -it --name centostest centos bash
docker run -it --name hb --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw"  hp-setup
docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" gui-app
docker exec -it centos /bin/bash

docker run -it  -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix  centos bash

docker run -it  -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix jdeathe/centos-ssh bash

docker run -it  -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix  ubuntu bash

#centos
docker run -it --name centostest centos bash
 
xhost +
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY centos

xhost +
if failed run export DISPLAY=:1.0
docker start
docker exec -it 9b88540a2337 bash


-e DISPLAY=unix$DISPLAY
-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY 

docker exec -it centos /bin/bash

#rundocker
xhost +local:docker
docker run -it \
    -e DISPLAY="$DISPLAY" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --device /dev/snd:/dev/snd \
    --device /dev/dri:/dev/dri \
    --ipc host \
    heaven-archlinux
    
    
docker run -it  -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix:rw --device /dev/snd:/dev/snd --device /dev/dri:/dev/dri --privileged --device /dev/fuse --ipc host ubuntu bash

docker run -it  -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix:rw --device /dev/snd:/dev/snd --device /dev/dri:/dev/dri --privileged --device /dev/fuse --ipc host jdeathe/centos-ssh bash

#windows
docker pull repasscloud/ltsc2019-win10adk-v2004

#docker add name
docker run -d -name ubuntutest ubuntu:latest

#network
docker network create -d bridge --subnet 192.168.0.0/24 --gateway 192.168.0.1 dockernet


#iptables
iptables -t nat -I PREROUTING -i enp0s25:2 -p tcp --dport 80 -j DNAT --to-destination 10.88.0.52:80
iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.25 -d 10.88.0.52:80 --dport 80 -j SNAT --to 10.88.0.52:80
iptables -t nat -I POSTROUTING -s 192.168.1.25  -d 10.88.0.52 -j MASQUERADE
iptables -t nat -A POSTROUTING -p tcp --dport 80 -d 192.168.1.25 -j SNAT --to 10.88.0.52
iptables -t nat -A PREROUTING -i enp0s25:2 -p tcp --dport 80 -d 10.88.0.52 -j DNAT --to-destination 192.168.1.25
iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.25 -d 192.168.1.25 --dport 80 -j SNAT --to 10.88.0.52


iptables -t nat -A PREROUTING -s 192.168.1.25 -p tcp -j DNAT --to-destination 10.88.0.52
iptables -t nat -A POSTROUTING -p tcp -d 192.168.1.25 --dport 80 -j SNAT --to-source 10.88.0.52

iptables -t nat -A OUTPUT -d 192.168.1.25 -j DNAT --to-destination 10.88.0.52

