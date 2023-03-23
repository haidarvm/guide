# set to php8
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
rpm -Uvh http://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el8.noarch.rpm
dnf install openlitespeed lsphp80 lsphp80-common lsphp80-gd  lsphp80-imap lsphp80-mbstring lsphp80-mysqlnd lsphp80-opcache lsphp80-pdo lsphp80-process lsphp80-xml lsphp80-common 

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

# set html path to group and nobody owner
chown -R username:nobody /path/to/dir/html

# setup php change php setting
https://openlitespeed.org/kb/change-php-settings-by-vhost-and-user/
 
sudo systemctl stop lsws

sudo certbot certonly -d www.example.com -d example.com

# firewall
firewall-cmd --zone=public --add-port=7080/tcp --permanent
firewall-cmd --reload

>>>>>>> 8cef044602effe8b251fbcc74e653179e50bdb06
# logs
$VH_ROOT/logs/$VH_NAME_error.log
$VH_ROOT/logs/$VH_NAME_access.log

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
Rewrite Rules
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}/%{REQUEST_URI} [R,L]


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

# wp .htaccess
RewriteBase /
RewriteRule ^/index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]

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

# chown
sudo chown -R nobody:nobody /usr/local/lsws/Example/html/
