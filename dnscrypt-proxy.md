# remove dns
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved

sudo rm /etc/resolv.conf

sudo nano /etc/resolv.conf

nameserver 8.8.8.8
nameserver 1.1.1.1

sudo vim /etc/NetworkManager/NetworkManager.conf
[main]
dns=default

sudo systemctl restart NetworkManager
