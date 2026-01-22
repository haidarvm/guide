# show ip address
ip a

#list all network
arp -a
nmap -sP 192.168.1.0/24

#traceroute

#list all port
sudo nmap -sTU -O 192.168.1.1

# list if blocked
sudo nmap -sTU -O -Pn 192.168.1.1

# display TCP information,
ss -t

#change ip manual fedora 43
nmcli connection show shared | grep ipv4.addresses

#setting dns globally
vi /etc/systemd/resolved.conf
DNS=67.207.67.2 67.207.67.3
DNS=9.9.9.9 149.112.112.112
sudo systemctl restart systemd-resolved.service

#check it with
resolvectl dns
systemd-resolve --status

#check dns record
host -t ns domain.com
host -t txt domain.com

#manually 
sudo resolvectl dns wlp2s0 8.8.8.8 4.4.4.4

iftop 
sudo nethogs

host haidar.mukminin.com 8.8.8.8 
# resolvectl dns
systemd-resolve --status

# check dns record
host -t ns domain.com
host -t txt domain.com

# change IP armbian /etc/network/interface
allow-hotplug eth0
auto eth0
iface eth0 inet static
        address 192.168.1.76
        gateway 192.168.1.1
        
# change IP interfaces /etc/network/interface
# Ethernet adapter 0
auto eth0
allow-hotplug eth0
#no-auto-down eth0
iface eth0 inet static
address 192.168.1.78
netmask 255.255.255.0
gateway 192.168.1.1
#dns-nameservers 192.168.1.1
dns-nameservers 1.1.1.1 192.168.1.1

#set ip
ip addr add 192.168.50.1/24 dev wlan0

#check wifi
iw dev
# change IP nmcli
nmcli con mod enps03 ipv4.addresses 192.168.2.20/24

#create hostpot 
nmcli dev wifi hotspot ifname wlp0s20u5 ssid rhelThinkCentre password "rhelthink"

nmcli con add type wifi ifname wlp0s20u10 con-name Hostspot autoconnect yes ssid rhelThinkCentre
nmcli con modify Hostspot 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
nmcli con modify Hostspot wifi-sec.psk "rhelthink"

# turn off eth0
ifdown eth0

# check list connection
nmcli connection

# turn off wifi
ifdown haidar

# connect wifi 
nmcli device wifi rescan
nmcli device wifi rescan
nmcli device wifi connect my_lil_router password 1234567890

# manually 
sudo resolvectl dns wlp2s0 8.8.8.8 4.4.4.4

# monitoring
iftop 
sudo nethogs

# vpn 

# reverse ssh
ssh -R 22:2022 haidar@dont-look-at.me
ssh -p 2022 haider@dont-look-at.me sh

sudo tcpdump -i wlo1 dst host 118.98.97.151

ping 180.253.26.191
ping bandung telkom

$ sudo pacman -S dnscrypt-proxy

$ sudo nano /etc/resolv.conf

hapus semua nameserver jadi
nameserver 127.0.0.1
nameserver 127.0.0.2

# lookup network
nslookup reddit.com
dig reddit.com
host reddit.com 8.8.8.8 

sudo apt install  dnscrypt-proxy

sudo nano /etc/resolv.conf

# hapus semua nameserver jadi
nameserver 127.0.0.1
nameserver 127.0.0.2

# modem serial
dmesg | egrep -i --color 'serial|ttyS'

# set chmod 
sudo gpasswd --add ${USER} dialout
sudo chmod 666 /dev/ttys0

$ sudo systemctl start dnscrypt-proxy

$ sudo /usr/sbin/dnscrypt-proxy --daemonize

Lalu test buka http://vimeo.com


blocked site
vimeo.com
reddit.com

