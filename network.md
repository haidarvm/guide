# show ip address
ip a

#list all network
arp -a
nmap -sP 192.168.1.0/24

#traceroute

#list all port
sudo nmap -sTU -O ip_address

# display TCP information,
ss -t

#


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

sudo tcpdump -i wlo1 dst host 118.98.97.151

ping 180.253.26.191
ping bandung telkom

Ane nyobain pake windows sukses dan lancar auto start service
tapi berhubung ane sudah pensiun dari windows skrg pake Linux

Bagi yg ingin coba di linux (Arch Linux) cara nya gampang install dnscrypt-proxy 

$ sudo pacman -S dnscrypt-proxy

$ sudo nano /etc/resolv.conf

hapus semua nameserver jadi
nameserver 127.0.0.1
nameserver 127.0.0.2

$ sudo systemctl start dnscrypt-proxy

$ sudo /usr/sbin/dnscrypt-proxy --daemonize

Lalu test buka http://vimeo.com



blok site
vimeo.com
reddit.com



xrandr --output HDMI1 --gamma 0.5:1.0:1.0

xrandr --output HDMI1 --brightness 0.8
