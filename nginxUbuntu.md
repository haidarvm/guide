server {
    listen 8000;

    root /var/www/html/project4;
    index index.php index.html index.htm;

    server_name haidarvm.ddns.net;
    
	location / {
        #autoindex on;
        try_files $uri $uri/ /index.php?$args;
    }


    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/run/php/php7.3-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
