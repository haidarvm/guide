#mkdir /etc/nginx/default.d/ and save 

server {
    root /home/haidar/public_html;
    index index.php index.html index.htm;
    error_log      /var/log/nginx/haidar_error.log error;
    access_log     /var/log/nginx/haidar_access.log;

    server_name haidar.test;
    
	location / {
        #autoindex on;
        try_files $uri $uri/ /index.php?$args;
    }

	#include /etc/nginx/default.d/*.conf;

	#save this to default.d/ so no need to use it every create new server
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
    
    location ~ /\.  { return 403; }
}












#good one
server {

    root /home/haidar/public_html/basicphp/app/public;
    index index.php index.html index.htm;
    error_log      /var/log/nginx/basic_error.log error;

    server_name basic.test;

    location / {
        #autoindex on;
        try_files $uri $uri/ /index.php?$args;
    }

    include /etc/nginx/default.d/*.conf;
    
    location ~ /\.  { return 403; }

}
