sudo useradd -m -c "haidarvm" haidarvm  -s /bin/bash 
sudo usermod -a -G sudo <username>

#/etc/sudoers

ssh-keygen -t rsa -b 4096 -C "haidarvm@gmail.com"


sudo useradd -m -c "telegram" telegram  -s /bin/bash 

sudo useradd -m -c "mark" mark  -s /bin/bash 

sudo useradd -m -c "haidarvm" haidarvm  -s /bin/bash 


sudo useradd -m -c "prianganholiday" prianganholiday  -s /bin/bash 

sudo useradd -m -c "javanewstv" javanewstv  -s /bin/bash 

sudo useradd -m -c "admin" admin  -s /bin/bash 

sudo useradd -m -c "flatearthid" flatearthid  -s /bin/bash 

sudo useradd -m -c "beritainspiratif" beritainspiratif  -s /bin/bash 

sudo usermod -aG www-data jabarnews
sudo usermod -a -G  nginx ec2-user


#deleted_user
userdel -r mark

#login nginx bash
sudo su -l nginx -s /bin/bash

sudo chmod -R 770 /home/jabarnews/public_html

sudo userdel -r flatearth

chgrp www-data /home/myuser/public_html
chmod g+rwxs /home/myuser/public_html


chgrp nginx /home/ec2-user/public_html
sudo chmod g+rwxs /home/ec2-user/public_html


sudo groupadd ec2-user
sudo useradd -g jabarnews -G www-data jabarnews
sudo useradd -g todayid -G www-data,ftp todayid
sudo useradd -g ec2-user -G nginx ec2-user

grep 'grpup-name-here' /etc/group

sudo groupadd jabarnews
sudo useradd -g jabarnews -G www-data,ftp jabarnews
