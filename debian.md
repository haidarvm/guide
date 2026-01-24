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

#genericcloud
ip addr add 192.168.122.50/24 dev enp1s0
ip route add default via 192.168.122.1
ip link set enp1s0 up
# 1. Remove the existing file/symlink completely
rm -f /etc/resolv.conf

# 2. Create a new, fresh file with Google and Cloudflare DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf

# 3. Ensure the file is readable by everyone
chmod 644 /etc/resolv.conf

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
rm ~/.config/monitors.xml
