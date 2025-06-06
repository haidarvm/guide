# set to php8
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
rpm -Uvh http://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el8.noarch.rpm
dnf install openlitespeed lsphp80 lsphp80-common lsphp80-gd  lsphp80-imap lsphp80-mbstring lsphp80-mysqlnd lsphp80-opcache lsphp80-pdo lsphp80-process lsphp80-xml lsphp80-common 

#php 8.3
dnf install openlitespeed lsphp83 lsphp83-common lsphp83-gd  lsphp83-imap lsphp83-mbstring lsphp83-mysqlnd lsphp83-opcache lsphp83-pdo lsphp83-process lsphp83-xml lsphp83-common 

# deb
wget -O - https://repo.litespeed.sh | bash

# rhel
sudo wget -O - https://repo.litespeed.sh | sudo bash
rpm -Uvh http://rpms.litespeedtech.com/centos/litespeed.repo
#or
mv litespeed.repo /etc/yum.repos.d/
dnf install epel-release
dnf install openlitespeed

# deb
wget -O - https://repo.litespeed.sh | bash
apt install lsphp83 lsphp83-common lsphp83-opcache lsphp83-mysql lsphp83-imagick


# set admin pass
sudo /usr/local/lsws/admin/misc/admpass.sh

# change to php81
sudo vi /usr/local/lsws/conf/httpd_config.conf
sudo systemctl restart lsws

# ssl with certbot
certbot certonly --non-interactive --agree-tos -m demo@gmail.com --webroot -w /var/www/html -d example.com -d www.example.com
certbot certonly --non-interactive --webroot -w /usr/local/lsws/example/html -d example.com -d www.example.com

# if in home add nobody to group user
sudo usermod -aG yourUserName lsadm
sudo gpasswd -a yourUserName lsadm

# cache makes web error
change module name to caching

# error libexpat

# error libcrypt
error while loading shared libraries: libcrypt.so.1: cannot open shared object
dnf install libxcrypt-compat

# error libonig.so.105
  - nothing provides libonig.so.105()(64bit) needed by lsphp74-mbstring-7.4.32-2.el9.x86_64 
error libonig.so.105
sudo dnf whatprovides libonig.so*
dnf install libxcrypt-compat libnsl -y


# disable webadmin
sudo vim /usr/local/lsws/conf/httpd_config.conf
#add after adminEmails
adminEmails
disableWebAdmin           1

# set html path to group and nobody owner
chown -R username:nobody /path/to/dir/html

# disable autostart automatic startup
/usr/local/lsws/admin/misc/rc-uninst.sh

# podman docker build
sudo wget -O - https://repo.litespeed.sh | sudo bash
rpm -Uvh http://rpms.litespeedtech.com/centos/litespeed.repo
dnf install epel-release
dnf install openlitespeed
dnf install libxcrypt-compat

# setup php change php setting
https://openlitespeed.org/kb/change-php-settings-by-vhost-and-user/
 
sudo systemctl stop lsws

sudo certbot certonly -d www.example.com -d example.com

# firewall
firewall-cmd --zone=public --add-port=7080/tcp --permanent
firewall-cmd --reload

# compile php
https://docs.litespeedtech.com/lsws/extapp/php/getting_started/

# compile php debian ubuntu
apt install build-essential libxml2-devel
apt install libpng-dev libjpeg-dev 
apt install libmysqlclient-dev libonig-dev libzip-dev
apt install libssl-dev libsqlite3-dev  libcurl4-openssl-dev

# logs
$VH_ROOT/logs/$VH_NAME_error.log
$VH_ROOT/logs/$VH_NAME_access.log


## setup cors
Strict-Transport-Security: max-age=31536000; includeSubDomains
Content-Security-Policy "upgrade-insecure-requests;connect-src *"
Referrer-Policy strict-origin-when-cross-origin
X-Frame-Options: SAMEORIGIN
X-Content-Type-Options: nosniff
X-XSS-Protection 1;mode=block
Permissions-Policy: geolocation=(self "")

# copy paste this on vhosts
context exp:^.*(css|gif|ico|jpeg|jpg|js|png|webp|woff|woff2|fon|fot|ttf)$ {                                                                                                                                                                  
	location                $DOC_ROOT/$0                                                                                                                                                                                                       
	allowBrowse             1                                                                                                                                                                                                                  
	enableExpires           1                                                                                                                                                                                                                  
	expiresByType           application/javascript=A15552000, text/css=A15552000                                                                                                                                                               
	extraHeaders            <<<END_extraHeaders                                                                                                                                                                                                
	unset Cache-control                                                                                                                                                                                                                          
	set Cache-control public, max-age=15552000                                                                                                                                                                                                   
	END_extraHeaders                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	addDefaultCharset       off                                                                                                                                                                                                                
}                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                             
context / {                                                                                                                                                                                                                                  
	location                $DOC_ROOT/                                                                                                                                                                                                         
	allowBrowse             1                                                                                                                                                                                                                  
	extraHeaders            <<<END_extraHeaders                                                                                                                                                                                                
	Strict-Transport-Security: max-age=31536000; includeSubDomains                                                                                                                                                                               
	Content-Security-Policy "upgrade-insecure-requests;connect-src *"                                                                                                                                                                            
	Referrer-Policy strict-origin-when-cross-origin                                                                                                                                                                                              
	X-Frame-Options: SAMEORIGIN
	X-Content-Type-Options: nosniff
	X-XSS-Protection 1;mode=block
	Permissions-Policy: geolocation=(self "")
	END_extraHeaders
}


#### create new vhost ####

[Basic] restart 
Config File *  = conf/vhosts/$VH_NAME/vhconf.conf (click create new)
Enable Scripts/ExtApps * =  Yes
Restrained * = Yes
[General] restart
Document Root * = /usr/local/lsws/example/html
Domain Name = example.com
Enable GZIP Compression = Yes
Enable Brotli Compression = Yes
cgroups = on
[Log] restart
Use Server's Log * = yes   ``// if yes then can see on dashboard -> Tools -> Server Log Viewer if no then can only see in log file``
File Name = $VH_ROOT/logs/$VH_NAME_error.log
Log Level = DEBUG  `// if wanna detail or error for error only`
Rolling Size (bytes) = 10M
Keep Days = 
Compress Archive = Yes
[Rewrite] restart
Enable Rewrite = Yes
Auto Load from .htaccess = Yes
Log Level = 5 `9 for detail`
#Rewrite Rules
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}/%{REQUEST_URI} [R,L]
RewriteRule ^.*\.git.* - [R=404]

[SSL] restart
Private Key File = /etc/letsencrypt/live/example.com/privkey.pem
Certificate File = /etc/letsencrypt/live/example.com/fullchain.pem
Chained Certificate = Yes

[listerner]
Default Port 80 Click Magnifier
Virtual Host Mappings click + 
Virtual Host * = choose example
Domains * = example.com

HTTPS Port 443 Click Magnifier
Virtual Host Mappings click + 
Virtual Host * = choose example
Domains * = example.com
================================================================= 

# create vhost with proxy reverse



# denied file xmlrc
# log filename
$VH_ROOT/logs/$VH_NAME_error.log
$VH_ROOT/logs/$VH_NAME_access.log


# rewrite redirect to https
make sure add both port 80 map and https
# add rewrite rules
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]

# BEGIN WordPress
RewriteEngine On
RewriteBase /
RewriteRule ^/index.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
# END WordPress


# ci .htaccess
RewriteBase /
RewriteCond %{REQUEST_URI} ^system.*
RewriteRule ^(.*)$ /index.php?/$1 [L]
RewriteCond %{REQUEST_URI} ^application.*
RewriteRule ^(.*)$ /index.php?/$1 [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php?/$1 [L]
<Directory .git>
    order allow,deny
    deny from all
</Directory>

#laravel
RewriteRule . /laravel/public/index.php [L]
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f


chmod 640 .htaccess
chown nobody:nobody html/.htaccess

systemctl restart lsws

#fedora build php
sudo dnf install libzip-devel oniguruma-devel libcurl-devel

# add external app for compile and build php
Server Configuration > External App
extprocessor lsphp8 {
  type                    lsapi
  address                 uds://tmp/lshttpd/lsphp.sock
  maxConns                10
  initTimeout             60
  retryTimeout            0
  respBuffer              0
  autoStart               2
  path                    fcgi-bin/lsphp8
}


# chown
sudo chown -R nobody:nobody /usr/local/lsws/Example/html/

# freebsd
doas mkdir -p /usr/local/lsws/lsphp81/bin/
doas cp /usr/ports/lang/php81/work/stage/usr/local/bin/lsphp /usr/local/lsws/lsphp81/bin/
cd /usr/local/lsws
doas cp lsphp81/bin/lsphp fcgi-bin/
doas cp lsphp81/bin/lsphp admin/fcgi-bin/admin_php
doas bin/lswsctrl restart



