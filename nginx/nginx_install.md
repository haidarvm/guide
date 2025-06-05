
vi /etc/yum.repos.d/nginx.repo


[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true


# nginx default server
listen 80 default_server;
listen [::]:80 default_server;
server_name _;