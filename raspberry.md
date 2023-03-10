#create raspberry to sdcard
sudo dd if=2021-10-30-raspios-bullseye-armhf-lite.img of=/dev/sda status=progress bs=4M

# setting static ip raspi
cd /boot
touch ssh
cd /rootfs/etc

# simple dhcpd
sudo vi /etc/dhcpcd.conf

# uncomment this
slaac private
interface eth0
static ip_address=192.168.1.100/24
static routers=192.168.1.1

# raspi config
sudo raspi-config

# list all service
sudo service --status-all

# perl warning
sudo vi /etc/locale.gen
`uncomment en_US.UTF-8 UTF-8`
sudo dpkg-reconfigure locales

sudo locale-gen

# wvdial
vi /etc/ppp/peers/wvdial

defaultroute
replacedefaultroute


# install gui
sudo apt-get install raspberrypi-ui-mods


# CHANGE HOSTNAME (see also https://wiki.debian.org/HowTo/ChangeHostname)
'grep -R jessie-rpi /etc/*' check which files you need to edit
'vi /etc/hostname' edit the hostname in /etc/hostname
'vi /etc/hosts' edit the hostname in /etc/hosts
'dpkg-reconfigure exim4-config' reconfigure exim4
'reboot' reboots the system



# PREVENT PACKAGE FLASH-KERNEL UPDATING FROM OFFICIAL REPO WITH APT PINNING
'touch /etc/apt/preferences.d/flash-kernel' create a new file
'vi /etc/apt/preferences.d/flash-kernel' edit it an add the following lines to it:
Package: flash-kernel
Pin: origin repositories.collabora.co.uk
Pin-Priority: 1000
'apt-cache policy flash-kernel' check if the package is pinned

# GENERATE NEW SSH KEYS (from http://sjoerd.luon.net/posts/2015/02/debian-jessie-on-rpi2/#comment-4c4e1defb59a765819781eddc928fd6d)
'rm /etc/ssh/ssh_host_*_key*' remove the old ones
'dpkg-reconfigure openssh-server' create new ones

# RECONFIGURE LOCALES AND TIMEZONE
'dpkg-reconfigure locales'
'dpkg-reconfigure tzdata'

ACTIVATE ADDITIONAL REPOS
'vi /etc/apt/sources.list' open editor and add the following:
deb http://ftp.us.debian.org/debian/ jessie contrib non-free
deb http://security.debian.org/ jessie/updates main contrib non-free
deb http://ftp.us.debian.org/debian/ jessie-updates main contrib non-free

NOW YOU CAN SAFELY UPDATE THE SYSTEM
'apt-get update'
'apt-get upgrade'
