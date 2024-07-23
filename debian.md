#debian reset pass recovery
go to recovery grub menu

# add /usr/sbin
export PATH=$PATH:/usr/sbin

# add sudo
usermod -aG sudo username

# change user
su - haidar

#change to bin/bash
chsh -s /bin/bash

# dnsmasq
sudo apt install dnsmasq

# date time sync
apt install systemd-timesyncd
systemctl status systemd-timesyncd.service
