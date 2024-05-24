# debian
docker run -t -d --name debiantest debian:slim
docker run -t -d --name centos7 centos/httpd-24-centos7 
docker exec -it my_debian bash

#pull centos 7
docker pull centos:7
docker pull debian:testing-slim
docker run -t -d --name debiantest debian:testing-slim
docker exec -it debiantest bash
apt update


# openlitespeed
docker run --name openlitespeed -p 7080:7080 -p 80:80 -p 443:443 -it litespeedtech/openlitespeed:latest
docker run --name ols -p 7080:7080 -p 80:80 -p 443:443 -it openlitespeed
podman start openlitespeed
podman exec -it openlitespeed /bin/bash 


# devuan
podman pull dyne/devuan:daedalus
podman run -t -d --name deu devuan:daedalus

# install in deb
apt-get update && apt-get install -y gnupg2
apt-key list
wget -O - https://repo.litespeed.sh | sudo bash 
apt-get install openlitespeed

# centos stream 9
podman pull centos:stream9 
podman run -t -d --name cent9 centos:stream9 
podman exec -it cent9 /bin/bash 
podman run cent9 -p 8088:88
podman stop cent9
podman commit cent9 cent9a
podman run --name cent9a -p 8080:8088 -td cent9a 
podman exec -it cent9a /bin/bash 

# add service
vi /usr/lib/systemd/system/lsws.service
[Unit]
Description=openlitespeed

[Service]
ExecStart=/usr/local/lsws/bin/lswsctrl

[Install]
WantedBy=multi-user.target

systemctl daemon-reload
systemctl enable lsws.service


# gcc 9
alias gcc='docker run --user $(id -u):$(id -g) --rm -t -v /:/mnt -w /mnt/"$PWD" gcc:9 gcc'
alias gcc='podman run --user $(id -u):$(id -g) --rm -t -v /:/mnt -w /mnt/"$PWD" gcc:9 gcc'

# ubuntu bionic
docker run -t -d --name bionictest ubuntu:bionic

#pull centos 7
docker pull centos:7
docker run -t -d --name centos7 centos/httpd-24-centos7 
# docker pull mysql latest 
docker pull mysql:latest
docker run --name mytest -p 33060:3306 -e MYSQL_ROOT_PASSWORD=Bismillah -d mysql
docker exec -it mytest mysql -uroot -p
docker exec -it mytest bash

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

## how to ###

#remove image
docker rmi -f <image-id>

#remove container
docker rm f926834ede53

#run with local folder
docker run -v <host_dir>:<container_dir>  imagename 
docker run -v /home/haidar/public_html/test/php/apps/:/var/www/apps -t -d --name ubfgator ubuntu:focal

# go to container folder
chroot /var/lib/docker/containers/2465790aa2c4*/root/


# run with running container
# docker commit CONTAINERID NEWIMAGENAME
docker commit 10300d2992f4  bionictest

# go to container folder
chroot /var/lib/docker/containers/2465790aa2c4*/root/

# eth0 network oly
edit ipv4 routes
use this connection only for resources on this network

# docker copy from host to container --use container name
docker cp folder focal:/var/www/html/
docker cp foo.txt container_id:/home/

# docker copy from container to host
docker cp container_id:/home/foo.txt foo.txt

# add name container id 
docker rename 345df9ed5b47 new_name


# get ip address
docker inspect -f '{{ .NetworkSettings.IPAddress }}' container_name_or_container_id

podman inspect -f '{{ .NetworkSettings.IPAddress }}' <container_name_or_container_id>


# run as root
sudo docker exec -u root -it centos7 bash

# docker ubuntu 18.04
docker run -it --name centostest ubuntu:18.04 bash

docker run --name mariadbtest --net=host -e MYSQL_ROOT_PASSWORD=Bismillah -v /var/lib/mariadb:/var/lib/mysql -d mariadb

docker run -p 3306:3306 --name mysqltest  --network=host -e MYSQL_ROOT_PASSWORD=Bismillah -d mysql

docker run --name mysql1 -p 3306:3306 --network=host -e MYSQL_ROOT_PASSWORD=password -v mysql:/var/lib/mysql -d mysql/mysql-server

#correct to run mysql using local
docker run --name mysqltest --net=host -v /var/lib/mysql/:/var/lib/mysql/ mysql/mysql-server
docker run --name mysqltest --net=host -e MYSQL_ROOT_PASSWORD=Bismillah -v /var/run/mysqld/mysql.sock:/var/run/mysqld/mysql.sock -d mysql/mysql-server

docker run --name mysql2 --net=host -it -e MYSQL_ROOT_PASSWORD=Bismillah -v /host:/shared -d mysql/mysql-server


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

docker run --name mysqltest --net=host -e MYSQL_ROOT_PASSWORD=Bismillah -d mysql/mysql-server:latest

#lighttpd
docker run --rm -d --network host --name lighttpd lighttpd


#oracle
docker run --name oraclexe -d -p 51521:1521 -p 55500:5500 -e ORACLE_PWD=Bismillah -e ORACLE_CHARACTERSET=AL32UTF8 oracle/database:18.4.0-xe
docker run --name oraclexe -d -p 1521:1521 -p 5500:5500 -e ORACLE_PWD=Bismillah -e ORACLE_CHARACTERSET=AL32UTF8 oracle/database:18.4.0-xe

docker exec -it --user=oracle oraclexe bash
./sqlplus  sys/Bismillah@//localhost:1521/XE as sysdba
./sqlplus sys/Bismillah@\"localhost:1521/XEPDB1\" as sysdba
./sqlplus haidar/Bismillah@\"localhost:1521/XEPDB1\"
 
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER haidar IDENTIFIED BY "Bismillah";
alter user haidar identified by "Bismillah" account unlock; 
GRANT CREATE SESSION TO haidar;
GRANT CONNECT TO haidar;
grant all privileges to haidar;

#postgres
docker run --name postgrestest --net=host -e POSTGRES_PASSWORD=Bismillah -d postgres
docker exec -it postgrestest psql -U postgres

#centos
docker run --name centostest --net=host centos
docker run -it --name centostest centos bash
docker run -it --name hb --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw"  hp-setup
docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" gui-app
docker exec -it centos /bin/bash

docker run -it  -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix  centos bash
docker run -it  --name rockytest -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix  rockylinux/rockylinux bash

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


# docker

## build dockerize php using podman Part 1

# create index.php <?php echo "haidart test podman" ?>

# create Dockerfile
FROM php:7.2-apache
COPY index.php /var/www/html/index.php
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# build an image
sudo podman build -t phphaidemo:v1 . 

# run image
sudo podman run -d -p9090:80 phpdemo:v1


# podman build with dockerfile
podman build -t ubuntubionic -f ./Dockerfile

# run 
podman run -it ubuntubionic
podman run -p 8080:80 --name bionictest  ubuntubionic
podman run -p 8080:80 --name bionic --rm ubuntubionic
podman run -p 8090:80 --name bionic bionictest


# run with volume
podman run --name ubuntubionic \
  -v /home/haidar/public_html/test/rs/medicalapp-alislam:/usr/share/nginx/html:Z \
  -p 9080:80 -d ubuntu:bionic


# docker check log
sudo docker logs --tail=50  container_name

# docker login
docker login --username=haidarvm --email=haidarvm@haidarvm.com

# check container size
docker system df

sudo du -sh /var/lib/docker/ 
docker ps --size

## build dockerize php clearlinux base using podman Part 2
# create foldername
mkdir haidockcl
cd haidockcl
# create index.php 
nano index.php
<?php echo "haidart test podman" ?>

# create Dockerfile
nano Dockerfile
FROM clearlinux:base
#install php-basic	
RUN swupd update && swupd bundle-add php-basic 
#copy file
COPY index.php /var/www/html/index.php
EXPOSE 80
CMD ["php","-S","0.0.0.0:80", "-t", "/var/www/html"]

# build an image
sudo podman build -t haidockcl:v1 . 

# compose 
sudo docker-compose up -d
sudo podman-compose up -d

# remember set selinux to 0
sudo setenforce 0

#rebuild
sudo podman-compose up --force-recreate --build -d

sudo docker-compose up --force-recreate --build -d

# run image
sudo podman run -d -p9191:80 haidockcl:v1

# or
sudo podman run -p 9191:80 haidockcl
