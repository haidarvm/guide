# copy file with progress
rsync -av --progress '/home/haidar/Downloads/app/Orangepizero2_3.0.0_debian_bullseye_desktop_xfce_linux5.16.17.img' /run/media/haidar/3933-3738

rsync -av --progress '/home/haidar/Downloads/app/Orangepizero2_3.0.0_debian_bullseye_desktop_xfce_linux5.16.17.img' /run/media/haidar/sandisk64/

# with verifying
rsync -avzh '/home/haidar/Downloads/app/Orangepizero2_3.0.0_debian_bullseye_desktop_xfce_linux5.16.17.img' /run/media/haidar/3933-3738


# to get from ip 1.7
rsync -avzhe ssh pi@192.168.1.7:/var/www/ /var/www/
rsync -avzhe ssh pi@192.168.1.3:/var/www/ /var/www/


# passwordless ssh
ssh-keygen
ssh-copy-id -i pi@192.168.1.4

# if error
sshpass -p 'haitech' ssh 192.168.1.7 -o StrictHostKeyChecking=no
ssh-keygen -R 192.168.1.4

# run server command
ssh pi@192.168.1.7 "/home/pi/synch.sh"


# mirror rsync
rsync --archive --verbose --delete --delete-delay --delay-updates archive.raspbian.org::archive /path/to/local/mirror
