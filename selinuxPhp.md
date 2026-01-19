setsebool -P httpd_can_network_connect 1
setsebool -P httpd_can_network_connect_db 1



#qemu
sudo setsebool -P virt_use_home_run_res 1
sudo semanage fcontext -a -t virt_content_t "/home/haidar/Downloads/app(/.*)?"
sudo restorecon -Rv /home/haidar/Downloads/app