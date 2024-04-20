Cara install MariaDB-server-10.5.8-1 terbaru
# installmariabd-rhel
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
dnf update
dnf install MariaDB-server
sudo systemctl start mariadb
mariadb-secure-installation

# on deb
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
sudo bash mariadb_repo_setup --os-type=ubuntu  --os-version=focal --mariadb-server-version=10.6
sudo bash mariadb_repo_setup --os-type=ubuntu  --os-version=focal --mariadb-server-version=11.1
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8

# upgrade version
- backup all
sudo systemctl stop mariadb
rpm -qa | grep -i '^mariadb-'  
sudo dnf remove MariaDB-server
sudo systemctl start mariadb
sudo mariadb-upgrade -u root -p

# create log folder
chown -R mysql:mysql /var/log/mariadb

#  reset root password
sudo mariadbd-safe --skip-grant-tables --skip-networking &
mariadb -u root
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '321dYlUrsH08B!s';
 sudo kill 'cat /var/run/mariadb/mariadb.pid'

# on rpm
sudo rpmkeys --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB

sudo systemctl enable mariadb.service 
sudo systemctl restart mariadb.service
mariadb-secure-installation

#mysqladmin password

$ nano /etc/yum.repos.d/MariaDB.repo 
#mariadb
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.3/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1


sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.3/ubuntu bionic main'



sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64] http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.4/ubuntu disco main'


SET PASSWORD FOR 'root'@'%.loc.gov' = PASSWORD('newpass');

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('bismillah');


SET PASSWORD FOR 'root'@'localhost' = PASSWORD('Bismillah');
FLUSH PRIVILEGES;

CREATE database haidarvm;
CREATE USER 'haidarvm'@'localhost' IDENTIFIED BY 'bismillah';
GRANT ALL PRIVILEGES ON haidarvm.* To 'haidarvm'@'localhost' IDENTIFIED BY 'bismillah';
GRANT ALL ON haidarvm.* TO 'localhost'@'localhost';
FLUSH PRIVILEGES;


#repairDatabase
mysqlcheck -uberitainspiratifnew -p beritainspiratifnew
mysqlcheck -uroemahmedia -p roemahmedia
