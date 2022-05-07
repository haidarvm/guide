sudo useradd -m -c "haidarvm" haidarvm  -s /bin/bash 
sudo usermod -a -G sudo <username>

#/etc/sudoers

ssh-keygen -t rsa -b 4096 -C "haidarvm@gmail.com"

sudo useradd -m -c "haidarvm" haidarvm  -s /bin/bash 

sudo useradd -m -c "admin" admin  -s /bin/bash 

sudo usermod -aG www-data haidarvm
sudo usermod -a -G  nginx haidarvm

# check user group
groups
id -Gn haidarvm

# deleted_user
userdel -r mark

# login nginx bash
sudo su -l nginx -s /bin/bash

sudo chmod -R 770 /home/jabarnews/public_html

sudo userdel -r flatearth

chgrp www-data /home/myuser/public_html
chmod g+rwxs /home/myuser/public_html


chgrp nginx /home/ec2-user/public_html
sudo chmod g+rwxs /home/ec2-user/public_html


sudo groupadd ec2-user
sudo useradd -g haidarvm -G www-data haidarvm
grep 'grpup-name-here' /etc/group

sudo groupadd haidarvm
sudo useradd -g haidarvm -G www-data,ftp haidarvm
