#debian reset pass recovery
go to recovery grub menu

# add /usr/sbin
export PATH=$PATH:/usr/sbin

# add user
sudo useradd -m haidar
sudo passwd haidar

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


# expand grow qcow2
qemu-img resize nama-file-anda.qcow2 +7G

# grow qcow2
sudo apt install cloud-guest-utils -y
sudo growpart /dev/vda 1


# add gui gnome
sudo apt update && sudo apt upgrade
sudo apt install gnome-core
sudo apt install gdm3
sudo systemctl enable --now gdm3  # Or lightdm/gdm3/sddm
sudo systemctl set-default multi-user.target
sudo systemctl set-default graphical.target
sudo systemctl isolate graphical.target
sudo apt install spice-vdagent qemu-guest-agent
sudo apt install spice-webdavd
sudo systemctl enable --now spice-vdagent
sudo systemctl enable --now qemu-guest-agent
