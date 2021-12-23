# set to php8

# ssl with certbot
certbot certonly --non-interactive --agree-tos -m demo@gmail.com --webroot -w /var/www/html -d example.com -d www.example.com

# if in home add nobody to group user
usermod -a -G user lsadm

# create new vhost


# create vhost with proxy reverse


# log filename
$VH_ROOT/logs/$VH_NAME_error.log
$VH_ROOT/logs/$VH_NAME_access.log


# rewrite redirect to https
make sure add both port 80 map and https
# add rewrite rules
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]