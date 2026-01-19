setsebool -P httpd_can_network_connect 1
setsebool -P httpd_can_network_connect_db 1


#/var/www web app
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/home/haidar/www(/.*)?"

#qemu
sudo setsebool -P virt_use_home_run_res 1
sudo semanage fcontext -a -t virt_content_t "/home/haidar/Downloads/app(/.*)?"
sudo restorecon -Rv /home/haidar/Downloads/app