## FIRST INSTALLATION ##
## first Step

# begin Download
=======
## try rhel 9 ##
## first Step

Download
https://developers.redhat.com/rhel8

# link 
https://developers.redhat.com/blog/2016/03/31/no-cost-rhel-developer-subscription-now-available/

#make live usb from minimal .iso
lsblk
sudo dd if=/home/haidar/Downloads/app/rhel-8.4-x86_64-boot.iso  of=/dev/sda bs=512k

#step one enable ssh press i then :wq
vi /etc/ssh/sshd_config

# edit at bottom 
PasswordAuthentication yes
systemctl restart sshd

## ssh no password ##
PasswordAuthentication no
PermitRootLogin no
TCPKeepAlive yes
ClientAliveInterval 60
ClientAliveCountMax 3
UsePAM no
=======
MaxStartups 3 
Port 2255

# installl 	semanage
dnf install policycoreutils-python-utils
semanage port -a -t ssh_port_t -p tcp 2255
setsebool -P nis_enabled 1
firewall-cmd --zone=public --add-port=2255/tcp --permanent
firewall-cmd --reload
vi /etc/ssh/sshd_config
uncomment Port 22 change to Port 2255
chmod 700 /home/haidarvm/.ssh
chmod 600 /home/haidarvm/.ssh/authorized_keys
vi /home/haidarvm/.ssh/
ssh-copy-id username@remote_host -p 2235

#check the logs
journalctl -t sshd

# install memcahed
sudo dnf install memcached libmemcached


# check cpu 
lscpu | egrep 'Model name|Socket|Thread|NUMA|CPU\(s\)'

# zRAM

# sealert setroubleshoot gui
dnf install setroubleshoot setools
dnf remove setroubleshoot setools

# read sealert terminal
journalctl -t setroubleshoot

# add subscription
subscription-manager register --auto-attach

# install from free developer
https://developers.redhat.com/products/rhel/download

# or online
subscription-manager register --username <username> --password <password> --auto-attach
subscription-manager register

# enable autocomplete
dnf install bash-completion

# create new user
sudo useradd -m -c "haidarvm" haidarvm -s /bin/bash 
sudo useradd -m mark -s /bin/bash 

# make sudo
usermod -aG wheel haidarvm

# add to wheel
visudo
# add haidar 
haidar ALL=(ALL) NOPASSWD:ALL

# go to root
sudo su -

# disable sudo promt 
sudo visudo
# uncomment
%wheel  ALL=(ALL)       NOPASSWD: ALL

# createswapfile 
https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-centos-7
sudo dd if=/dev/zero of=/swapfile count=4096 bs=1MiB
ls -lh /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
swapon -s
sudo nano /etc/fstab
/swapfile   swap    swap    sw  0   0
cat /proc/sys/vm/swappiness
sudo sysctl vm.swappiness=10
sudo nano /etc/sysctl.conf
# install at startup
sudo vi /etc/fstab
/swapfile   swap    swap    sw  0   0
cat /proc/sys/vm/swappiness
sudo sysctl vm.swappiness=10
sudo vi /etc/sysctl.conf
vm.swappiness = 10
vm.vfs_cache_pressure = 50
sudo sysctl vm.vfs_cache_pressure=50


# nmcli connect
nmcli con add type ethernet con-name haidar ifname enp0s3

# nmcli wifi
nmcli device wifi con "ssid" password "password"

# install firewall iptables
sudo dnf install -y firewalld
sudo systemctl enable firewalld
sudo systemctl restart firewalld.service 

# firewall
sudo firewall-cmd --add-service={http,https} --permanent

firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --permanent --zone=public --add-service=ssh
firewall-cmd --zone=public --add-port=5500/tcp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --zone=public --add-port=9236/tcp --permanent

sudo firewall-cmd --reload
firewall-cmd --zone=public --add-port=012/tcp --permanent
sudo firewall-cmd --list-all
firewall-cmd --zone=public --add-port=369/tcp --permanent
sudo firewall-cmd --list-all
firewall-cmd  --remove-service=ssh
firewall-cmd --zone=public --add-service=mysql --permanent

# firewall-cmd remove port
firewall-cmd --zone=public --remove-port=8484/tcp
firewall-cmd --remove-service=ssh --permanent
firewall-cmd --runtime-to-permanent 
firewall-cmd --reload

# firewall remove service
firewall-cmd  --remove-service=ssh --permanent
firewall-cmd --reload 

# nginx enable different port
semanage port -a -t http_port_t -p tcp 8080
semanage port -m -t http_port_t -p tcp 88

# hostnamectl
hostnamectl set-hostname cloud.example.com

# find available application streams
yum module list               

## END INSTALLATION ##

# security check sealart

### tigervnc ###


### openlitespeed ###
sudo rpm -Uvh http://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el9.noarch.rpm

sudo dnf install -y openlitespeed lsphp81 lsphp81-mysqlnd lsphp81-process lsphp81-mbstring lsphp81-gd lsphp81-opcache lsphp81-bcmath lsphp81-pdo lsphp81-common lsphp81-xml lsphp81-mbstring lsphp81-intl 

sudo dnf install -y openlitespeed lsphp82 lsphp82-mysqlnd lsphp82-process lsphp82-mbstring lsphp82-gd lsphp82-opcache lsphp82-bcmath lsphp82-pdo lsphp82-common lsphp82-xml lsphp82-mbstring lsphp82-intl 


#### nginx #### gpasswd
gpasswd -a nginx haidar
chmod g+x /home/public_html
chmod g+x /home/public_html
systemctl restart nginx.service
systemctl restart php-fpm.service
sudo usermod -aG nginx haidarvm
chgrp nginx /home/public_html
chmod g+rwxs /home/public_html
chmod og+x /home/public_html

# begin

sudo chown -R nginx: /home/
sudo chown -R www-data:"$USER" /webdirectory

chcon -R -t httpd_sys_rw_content_t /home/public_html
chcon -R -t httpd_sys_content_rw_t /home/public_html/wp-content/uploads/
chcon -R -t httpd_sys_content_rw_t /home/client/example/public_html/wp-content/uploads/
chcon -R -t httpd_sys_rw_content_t /home/client/example/public_html/wp-content/uploads/
restorecon -R /home/client/example/public_html
restorecon -R /var/www/html/example/public/uploads/

## apache
sudo chown -R apache:ftpname /home/ftpname

chcon -R -t httpd_sys_rw_content_t /home/ftpname
chcon -R -t httpd_sys_content_rw_t /home/ftpname
chcon -R -t httpd_sys_content_rw_t /home/ftpname
chcon -R -t httpd_sys_rw_content_t /home/ftpname
restorecon -R /home/ftpname/public_html
restorecon -R /home/ftpname

### run once
chcon -R -t httpd_sys_rw_content_t /home/client/example/public_html/wp-content/uploads/

chcon -R -t httpd_sys_rw_content_t  /var/www/html


restorecon -R /home
setsebool -P httpd_enable_homedirs 1
setsebool -P httpd_can_network_connect 1
setsebool -P httpd_read_user_content 1
setsebool -P httpd_unified 1
restorecon -R -v /var/run/nginx*
semanage permissive -a httpd_t
semanage permissive -d httpd_t

## nginx stable

# nginx-stable /etc/yum.repos.d/nginx.repo


# repo repomd.xml GPG signature verification error 
sudo dnf clean all
sudo rm -r /var/cache/dnf
sudo dnf check
sudo dnf check-update
sudo dnf update
sudo dnf upgrade

dnf --enablerepo=* clean all
dnf upgrade --refresh
cd /var/lib/rpm/ 
sudo rm -vf __db*
sudo rpm --rebuilddb -vv
sudo rpm --rebuilddb

## https://play.google.com/store/apps/details?id=com.haidarvm.ecommerce
## nginx stable

nano /etc/yum.repos.d/nginx.repo
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
dnf config-manager --set-enabled nginx-stable
dnf install nginx

## reppair failed to set locale
localectl set-locale LANG=en_US.UTF-8
localectl
dnf install langpacks-en glibc-all-langpacks -y


## sudo password timeout
sudo visudo
# add 
Defaults        timestamp_timeout=120
 

## installmariabd rhel
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
dnf update
dnf install MariaDB-server

$ nano /etc/yum.repos.d/MariaDB.repo 
#mariadb
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.3/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1


## selinux ##
sestatus 
vi /etc/selinux/config
SELINUX to disabled

## composer ###
curl -o composer-installer.php https://getcomposer.org/installer
sudo php composer-installer.php --filename=composer --install-dir=/usr/local/bin 
composer --version


### git nginx ###


## remote windows
sudo dnf install vinagre


### git user ###

### install essential ###
dnf install net-tools



### php-fpm-8.0 ###
### php-fpm-7.4.14 ###
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
rpm -qa | grep epel
dnf install https://rpms.remirepo.net/enterprise/remi-release-9.rpm
rpm -qa | grep remi
dnf module list php
dnf module reset php
dnf module enable php:remi-8.1
dnf install php-process  php-cli php-pgsql php-mysqlnd php-json php-intl php-gd php-mbstring php-xml php-fpm php-curl php-opcache php-devel php-fpm php-zip php-readline php-sodium -y
firewall-cmd --zone=public --add-port=8787/tcp --permanent
firewall-cmd --reload

# to downgrade php 8.1 or 7.4
dnf downgrade php\*
## certbot stop nginx first ##
certbot certonly -d www.haidarid.xyz -d haidarid.xyz


### postgresql-server ###
dnf module reset postgresql
dnf module enable postgresql:12
dnf install postgresql postgresql-server
rpm -ql postgresql-server
sudo postgresql-setup --initdb

### change mirror ###
dnf -y install yum-utils 
nano dnf.conf

#dnf.conf
[main]
gpgcheck=1
installonly_limit=3
clean_requirements_on_remove=True
best=False
skip_if_unavailable=True
fastestmirror=1


 
 
## ocs url gnome look
sudo dnf install  ocs-url-3.1.0-1.fc20.x86_64.rpm
 
## wrk ##
sudo dnf -y groupinstall 'Development Tools'
sudo dnf -y install openssl-devel git zlib-devel
make WITH_LUAJIT=/usr WITH_OPENSSL=/usr


# install cockpit and change Port
vi /usr/lib/systemd/system/cockpit.socket
# edit port
[Socket]
ListenStream=PORT_NUMBER
sudo semanage port -a -t websm_port_t -p tcp PORT_NUMBER
sudo firewall-cmd --permanent --service cockpit --add-port=PORT_NUMBER/tcp
sudo firewall-cmd --permanent --service cockpit --remove-port=OLD_PORT_NUMBER/tcp
sudo firewall-cmd --reload
sudo systemctl restart cockpit.socket cockpit.service



#### certbot ####
dnf install certbot python3-certbot-nginx


wget https://dl.eff.org/certbot-auto
sudo mv certbot-auto /usr/local/bin/certbot-auto
sudo chown root /usr/local/bin/certbot-auto
sudo chmod 0755 /usr/local/bin/certbot-auto
sudo /usr/local/bin/certbot-auto --nginx

sudo /usr/local/bin/certbot-auto --nginx --verbose --debug --email haidarvm@gmail.com -d haidarvm.com -d www.haidarvm.com -d ali.haidarvm.com

[Socket]
ListenStream=
ListenStream=PORT_NUMBER

# install gui
sudo dnf groupinstall workstation
sudo dnf group install "Server with GUI"

## install rpmforge
rhel 7 only


## Cara install Gtk3.20+ theme Nodic
sudo dnf install gnome-tweaks
sudo dnf install gnome-shell chrome-gnome-shell gnome-shell-extension-alternate-tab

# install https://extensions.gnome.org/extension/19/user-themes/
# gnome-tweaks -> extensions -> User themes -> On
git clone git@github.com:EliverLara/Nordic.git
sudo cp -r Nordic/ /usr/share/themes/
# gnome-tweaks -> appearance -> Themes -> Nordic

# install dash to panel

# install arc menu
## install icon gnome ##
https://www.gnome-look.org/s/Gnome/p/1348081
tar xvf McMuse-purple.tar.xz 
sudo cp -r McMuse-purple /usr/share/icons/
# gnome-tweaks -> appearance -> Icons -> McMuse-purple

## install gnome shell themes ##
git clone https://github.com/metro2222/Rounded-Rectangle-dark-transparent/
cd Rounded-Rectangle-dark-transparent/
sudo cp -r  Rounded-Rectangle-dark-transparent\ 1.6v/ /usr/share/themes/
# gnome-tweaks -> appearance -> Shell -> Rounded-Rectangle-dark-transparent\ 1.6v


## virtualization
dnf install qemu-kvm libvirt virt-install virt-viewer virt-manager -y
dnf install spice-vdagent

# in guest vm
sudo mkdir /mnt/app
sudo mount -t virtiofs apps /mnt/app


# bridge vm qemu-kvm
https://www.redhat.com/sysadmin/setup-network-bridge-VM


## install aria2
autoreconf -i
./configure
make


### install dropbox ###
aria2c https://linux.dropbox.com/packages/nautilus-dropbox-2.10.0.tar.bz2
tar xjf ./nautilus-dropbox-2.10.0.tar.bz2
cd ./nautilus-dropbox-2.10.0
dnf install nautilus-devel
alternatives --set python /usr/bin/python2
dnf install pygtk2-devel

cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p
# copy paste list software
setxkbmap
#update grub2
grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg

#for cloud server
sudo grub2-mkconfig -o /etc/grub2.cfg


#fastest make
time make -j$(nproc)

#cantfindlib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig

#LD
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:$LD_LIBRARY_PATH

#get lshw disk, model laptop
sudo lshw -class disk
sudo dmidecode | grep -A 9 "System Information"

#gui enable
systemctl set-default graphical.target
systemctl isolate graphical
sudo dnf groupinstall "KDE (K Desktop Environment)"
yum groupinstall "X Window System" Desktop
dnf groupinstall "X Window System" "KDE Desktop"
startx

#disable gui
systemctl get-default​
systemctl set-default multi-user.target ​

#javac
nano /etc/bashrc
export JAVA_HOME=/usr/lib/jvm/java-11
export PATH=$PATH:$JAVA_HOME/bin
source /etc/bashrc
echo $JAVA_HOME

#coordinates
-6.931003,107.67614

#configure with diff path gcc
./configure CC=/usr/bin/gcc

#cant play 
https://www.dailymotion.com
https://vimeo.com/

#postfix
firewall-cmd --permanent --add-port=110/tcp --add-port=995/tcp
firewall-cmd --permanent --add-port=143/tcp --add-port=993/tcp
firewall-cmd --reload

#sendmail
chmod 0600 /var/spool/mail/*
echo "Subject: sendmail test" | sendmail -v haidarvm@gmail.com


#epel
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm


# epel 9
subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm


#urar unrar
7z x file.rar

#install rpm fusion 9
sudo rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo rpm -ivh https://download1.rpmfusion.org/free/el/rpmfusion-free-release-9.noarch.rpm 
sudo rpm -ivh https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-9.noarch.rpm
# on rocky sudo dnf –enablerepo=crb install ladspa
sudo subscription-manager repos --enable "codeready-builder-for-rhel-9-$(uname -m)-rpms"
sudo subscription-manager repos --enable "codeready-builder-for-rhel-9-*-rpms"
sudo dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
# sudo subscription-manager repos --enable "codeready-builder-for-rhel-9-*-rpms"

#install rpm fusion 8
sudo rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo rpm -ivh https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm 
sudo rpm -ivh https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
sudo subscription-manager repos --enable "codeready-builder-for-rhel-8-$(uname -m)-rpms"
sudo subscription-manager repos --enable "codeready-builder-for-rhel-8-*-rpms"
sudo dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# sudo subscription-manager repos --enable "codeready-builder-for-rhel-8-*-rpms"
dnf repolist rpmfusion-*
dnf update
dnf install aria2 -y
dnf install ffmpeg -y
dnf install vlc mpv

#install firefox
aria2c https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US
 
gstreamer-plugins-ffmpeg gstreamer-plugins-good gstreamer-plugins-good-extras gstreamer-plugins-bad-free gstreamer-plugins-ugly gstreamer1-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} gstreamer1-plugin-mpg123


#fix datetime
systemctl stop chronyd
chronyd -q
systemctl start chronyd

#download new
https://haidarvm.com/rhel-8.0-update-3-x86_64-kvm.qcow2

#sdkman
# SDK Man replaced GVM. Using for Groovy, Gradle, and Maven Version Management
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#mount ntfs
mount /dev/sdb1 -t ntfs-3g /media/haiSeagate
mount /dev/sdb2 -t ntfs-3g /media/haiSeagateData

# windows 10
dd if=/home/testuser/Downloads/rhel-server-7-x86_64-boot.iso of=/dev/sdb bs=512k


mount /dev/sdc1 -t ntfs-3g /mnt/data

#unixporn
- tmux theme
- conky
- dock to dash
- libgnome gnome-vfs gconf-2.0 
- dropbox from official
#install software wps office, homebank, marktext, easyssh, filezilla, wireshark, jdownloader, datagrip, draw.io, task , manager, gaphor

why my gnome terminal no colorful

#kernel

dnf install install https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel info kernel-ml
dnf config-manager --enable elrepo-kernel
dnf config-manager --disable elrepo-kernel
yum --enablerepo=elrepo-kernel install kernel-ml
dnf remove  kernel-{devel,tools,tools-libs}
dnf -y --enablerepo=elrepo-kernel install kernel-ml-{devel,headers,tools,tools-libs}
dnf install kernel-ml kernel-ml-{devel,tools,tools-libs} grub2-tools
yum install -y dkms gcc redhat-lsb-languages
# rpm -Uvh kernel-headers-2.6.18-194.el5.x86_64.rpm

#update grub2
grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg


#nvidia
sudo dnf config-manager --add-repo=https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-rhel8.repo
sudo dnf module install nvidia-driver:latest

#gcc 9.1

  --bindir=DIR            user executables [EPREFIX/bin]
  --sbindir=DIR           system admin executables [EPREFIX/sbin]
  --libexecdir=DIR        program executables [EPREFIX/libexec]
  --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
  --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
  --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
  --libdir=DIR            object code libraries [EPREFIX/lib]
  --includedir=DIR        C header files [PREFIX/include]
  --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
  --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
  --oldincludedir=DIR     C header files for non-gcc [/usr/include]
  --infodir=DIR           info documentation [DATAROOTDIR/info]
  --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
  --mandir=DIR            man documentation [DATAROOTDIR/man]
  --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]

../configure                                           \
    --prefix=/usr/local                                \
    --disable-multilib                                 \
    --with-system-zlib                                 \
    --enable-languages=c,c++,d,fortran,go,objc,obj-c++


#tracker dconf-editor
gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2  
gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false
tracker reset -e



#removesession
rm -rf ~/.cache/sessions

#lightdm
groupadd -g 66 lightdm       &&
useradd  -c "Lightdm Daemon" \
         -d /var/lib/lightdm \
         -u 66 -g lightdm    \
         -s /bin/false lightdm

#go

update-alternatives --config go

go build -compiler gc \
          -ldflags "${LDFLAGS:-} \
          -extldflags '%__global_ldflags -static'" -a -v -x \
           github.com/snapcore/snapd/cmd/snap-update-ns



./contrib/download_prerequisites
export PATH=/usr/local/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
export PREFIX=/opt/gcc
mkdir build && cd build
../configure \
  --prefix=$PREFIX \
  --bindir=$PREFIX/bin \
  --sbindir=$PREFIX/sbin \
  --libexecdir=$PREFIX/libexec \
  --sysconfdir=$PREFIX/etc \
  --sharedstatedir=$PREFIX/com \
  --localstatedir=$PREFIX/var \
  --libdir=$PREFIX/lib \
  --includedir=$PREFIX/include \
  --datarootdir=$PREFIX/share   \
 --with-mpfr --with-gmp --with-mpc --disable-multilib \
    --prefix=/usr                                      \
    --disable-libmpx                                   \
    --with-system-zlib                                 \
    --enable-languages=c,c++,d,fortran,go,objc,obj-c++
make BOOT_CFLAGS='-O' bootstrap
time make -j$(nproc)
time make -j$(nproc) BOOT_CFLAGS='-O' bootstrap
make

#configure
cat configure.ac | grep wnck
sed -i 's/AC_MSG_ERROR/AC_MSG_WARN/g' configure.ac m4/*.m4

#cmake
./bootstrap --prefix=/usr/local   --system-libs  --no-system-librhash  --no-system-jsoncpp
./bootstrap --prefix=/usr/local   --system-libs  --no-system-librhash  --no-system-jsoncpp -DCURL_LIBRARY=/home/haidar/
gmake
#extra-cmake-modules

# Download binary from official website
aria2c https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2-Linux-x86_64.sh
# install it under /usr/local
sudo /bin/sh ./cmake-3.15.2-Linux-x86_64.sh --skip-licence --prefix=/usr/local --exclude-subdir
# Check it 
cmake --version

#guide
https://01.org/linuxmedia/quickstart/gstreamer-vaapi-msdk-installation-environment

#Before running ./configure try running autoreconf -f -i. The autoreconf program automatically runs autoheader, aclocal, automake, autopoint and libtoolize as required.
autoreconf -f -i

#install all gstreamer
https://gist.github.com/Brainiarc7/9f9b3de1246c0316f2a273c80841cadc
https://01.org/linuxmedia/quickstart/gstreamer-vaapi-msdk-installation-environment

#Disable Wayland bad and slow
echo $XDG_SESSION_TYPE

#ntfs

#download iso boot
sha256sum rhel-8.3-x86_64-boot.iso
https://access.cdn.redhat.com/content/origin/files/sha256/1b/1b73ebfebd1f9424c806032168873b067259d8b29f4e9d39ae0e4009cce49b93/rhel-8.3-x86_64-boot.iso?user=9099afdb5227ec27d7a195ebbc9226da&_auth_=1611075893_87f5d58376ec1de1556b72c7e0e557d3
https://developers.redhat.com/products/rhel/download
download.devel.redhat.com/composes/latest-RHEL7/compose/server/x86_64/os

#first install
subscription-manager register --auto-attach
subscription-manager register
subscription-manager auto-attach
subscription-manager subscribe

#enable extra repos
sudo subscription-manager repos
sudo subscription-manager list --available
sudo subscription-manager repos --list-enabled

sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-source-rpms
sudo subscription-manager repos --enable rhel-8-for-x86_64-rt-source-rpms
sudo subscription-manager repos --enable rhel-8-for-x86_64-supplementary-source-rpms
sudo subscription-manager repos --disable codeready-builder-for-rhel-8-x86_64-eus-rpms
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 

# install flatpak
sudo dnf install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
killall gnome-software
rm -rf ~/.cache/gnome-software

#symlink python
sudo ln -s /usr/bin/python3.4 /usr/bin/python

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib ffmpeg
export LD_RUN_PATH=/usr/local/lib
#nginx 
./configure \
    --sbin-path=/usr/local/nginx/nginx \
    --conf-path=/usr/local/nginx/nginx.conf \
    --pid-path=/usr/local/nginx/nginx.pid \
    --with-http_ssl_module \
    --with-pcre=../pcre-8.43 \
    --with-zlib=../zlib-1.2.11 --enable-shared
    
http://cdn.geekbench.com/Geekbench-4.4.1-Linux.tar.gz



#curl
./configure --prefix=$HOME --with-ssl

#mysql
%txM.+t4hCne
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'root';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'hai2coders';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';


# install docker
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf update
sudo dnf install -y docker-ce docker-ce-cli containerd.io
docker --version
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker
sudo usermod -aG docker username
docker run hello-world

#podman
podman ps -a
podman images
docker run --name docker-nginx -p 8585:80 nginx
docker run -it -d shykes/pybuilder /bin/bash
docker stop 67519
docker start 67519 
docker inspect 67519
docker exec -it 67519a86dba5 bash
docker run -d 8585:80 --name container01 image01
docker run -p 8585:80 --name haidock
docker run --name docker-nginx haidock --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" inkscape
sudo docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" android-studio

#Dockerfile
FROM ubuntu:14.04

#ksm
systemctl stop ksmtuned

RUN apt-get update && apt-get install -y firefox

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
CMD /usr/bin/firefox

#run firefox
docker build -t firefox .
podman build -f /home/haidar/Dockerfile /home/haidar/podman -t firefox


FROM ubuntu:14.04

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

RUN apt-get update && apt-get install -y gedit

USER developer
ENV HOME /home/developer
CMD dbus-daemon --system --fork && /usr/bin/firefox



#check last status service boot slow
sudo systemctl list-units
sudo systemctl list-units --state failed 
sudo systemctl list-unit-files --type=service
sudo systemd-analyze critical-chain
sudo systemd-analyze
sudo systemd-analyze blame
#check last status service boot
sudo systemctl list-units
sudo systemctl list-units --state failed
sudo systemctl list-unit-files --type=service

mssqlpass
12Bismillah
sqlcmd -S localhost -U SA -P '<YourPassword>'
sqlcmd -S localhost -U SA -P 12Bismillah

## check ip
ip addr show

#rpm command
rpm --checksig pidgin-2.7.9-5.el6.2.i686.rpm
rpm -qpR BitTorrent-5.2.2-1-Python2.4.noarch.rpm
rpm -qip sqlbuddy-1.3.3-1.noarch.rpm
rpm -e --nodeps (no depedencies remove)
rpm -e --nodeps kernel-headers
rpm -ivh --nodeps
rpm -ivh --test PACKAGE-NAME.rpm
rpm -qi annobin
rpm -ql annobin
rpm -qf /usr/libexec/rtkit-daemon 
rpm -qdf /usr/bin/free
rpm -q --whatrequires rtkit
rpm -i --relocate /usr/sbin=/some/other/path/sbin packagename.rpm
rpm --prefix=/home/haidar/rpm bind-chroot*.rpm
rpm -Uvh --nodeps $(repoquery --location winswitch)
rpm -Uvh --nodeps mssql-server*rpm


#dnf repair
dnf clean all
rm -r /var/cache/dnf
dnf upgrade

#dnf command
dnf info nginx
dnf module disable php
dnf group	
dnf grouplist	
dnf groupinfo "Basic Web Server"
dnf groupinstall "Web Server" -y
dnf groupinstall "Development Tools" -y
dnf groupinstall "Server with GUI" -y
dnf repolist all
dnf repolist all --enabled
dnf repository-packages epel list
dnf repolist
dnf repoquery --requires nginx
dnf search --showduplicates vim #checkversion available
sudo dnf config-manager --set-disabled  rpmfusion-free-updates rpmfusion-free-updates-testing  rpmfusion-nonfree-updates rpmfusion-nonfree-updates-testing epel-modular epel epel-testing-modular epel-testing

#dnf function
dnf repoquery --requires nginx
dnf search --showduplicates vim 
dnf whatprovides libgconf-2.so.4
dnf deplist curl
dnf provides libcrypt.so.1

# remove dnf repo
rm /etc/yum.repos.d/file_name.repo


# rhel 8 only
dnf groupinfo Virtualization
dnf provides libcrypt.so.1
dnf whatprovides libgconf-2.so.4
dnf --releasever=29 --showduplicates list $pkgname
dnf deplist curl
dnf reinstall $(repoquery --requires --recursive --resolve gdm)
dnf --disablerepo=elrepo-kernel
dnf config-manager --disablerepo elrepo-kernel
dnf config-manager --disablerepo codeready-builder-for-rhel-8-x86_64-eus-rpms
dnf config-manager --disable codeready-builder-for-rhel-8-x86_64-eus-rpms
dnf config-manager --set-disabled code
dnf config-manager --set-enabled nginx
dnf --remove-repo elrepo-kernel

#annobin
-iplugindir=<path/to/dir/containing/annobin>

#list all
systemctl list-unit-files 
systemctl list-units --type=service --state=running
systemctl list-unit-files --state=enabled
systemctl list-units --state=failed

#alias
alias r='rpm -qa | grep'                                                                                             
alias sudo='sudo'                                                                                                    
alias rp='rpm -Uvh'                                                                                                  
alias rl='rpm -ql'                                                                                                   
alias up='sudo dnf update -y'
alias d='sudo dnf install'
alias dr='sudo dnf remove'
alias ds='sudo dnf search'
alias D='cd ~/Downloads'
alias v='vim'
alias Dc='cd ~/Documents'
alias p='cd ~/public_html'
alias dh='df -h'
alias bc='vim ~/.bashrc'
alias ne='sudo netstat -ntlp' 
alias dx='sudo du -hsx * | sort -rh | head -20'
alias dua='sudo du -a . | sort -n -r | head -n 20'
alias duck='sudo du -cks * | sort -rn | head -n 20'
alias n='sudo systemctl restart nginx'
alias sp='sudo systemctl restart postgresql'
alias sr='sudo systemctl restart'
alias st='sudo systemctl status'
alias sto='sudo systemctl stop'
alias sy='systemctl status'
alias s='sudo'
alias sv='sudo vim'
alias dm='sudo dmesg'
alias sl='sudo lsd -lah'
alias g='sudo tail -200 /var/log/messages'
alias jx='journalctl -xe | grep -i'
alias px='ps aux | grep -i'
alias py='python'
alias uv='uvicorn --workers 4 --log-level critical'
alias wk='wrk -t12 -c400 -d5s'
alias gc='git clone'
alias gr='grep -r'
alias pi='pip install'
alias docker='podman'
alias ya="yt-dlp -f140"
alias pp="sudo cpupower frequency-set -g performance"
alias pc="cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
alias ps="sudo cpupower frequency-set -g powersave"
alias pd="sudo cpupower frequency-set -g schedutil"


#generate ssl
openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out rsbhaktimedicare.com.crt \
            -keyout haidar.com.key


#qtcore
https://forums.gentoo.org/viewtopic-p-8336448.html?sid=527bc0cd156b3ad40d11584f1601a096

#virglrenderer
./autogen.sh --enable-dependency-tracking  --enable-debug --enable-gbm-allocation  --enable-tests --enable-shared


#setting timezone
timedatectl list-timezones
timedatectl set-timezone Asia/Jakarta

#qemu
git clone https://git.qemu.org/git/qemu.git
cd qemu
git submodule init
git submodule update --recursive
--target-list=x86_64-softmmu
aarch64-softmmu alpha-softmmu 
arm-softmmu cris-softmmu hppa-softmmu i386-softmmu 
lm32-softmmu m68k-softmmu microblazeel-softmmu 
microblaze-softmmu mips64el-softmmu mips64-softmmu 
mipsel-softmmu mips-softmmu moxie-softmmu 
nios2-softmmu or1k-softmmu ppc64-softmmu ppc-softmmu 
riscv32-softmmu riscv64-softmmu s390x-softmmu 
sh4eb-softmmu sh4-softmmu sparc64-softmmu 
sparc-softmmu tricore-softmmu unicore32-softmmu 
x86_64-softmmu xtensaeb-softmmu xtensa-softmmu 
aarch64_be-linux-user aarch64-linux-user 
alpha-linux-user armeb-linux-user arm-linux-user 
cris-linux-user hppa-linux-user i386-linux-user 
m68k-linux-user microblazeel-linux-user 
microblaze-linux-user mips64el-linux-user 
mips64-linux-user mipsel-linux-user mips-linux-user 
mipsn32el-linux-user mipsn32-linux-user 
nios2-linux-user or1k-linux-user 
ppc64abi32-linux-user ppc64le-linux-user 
ppc64-linux-user ppc-linux-user riscv32-linux-user 
riscv64-linux-user s390x-linux-user sh4eb-linux-user 
sh4-linux-user sparc32plus-linux-user 
sparc64-linux-user sparc-linux-user 
tilegx-linux-user x86_64-linux-user 
xtensaeb-linux-user xtensa-linux-user

./configure  --prefix=/usr/local --target-list=aarch64_be-linux-user,aarch64-linux-user,aarch64-softmmu,arm-softmmu,i386-softmmu,x86_64-softmmu,armeb-linux-user,arm-linux-user,i386-linux-user,x86_64-linux-user   --enable-gcrypt --enable-virglrenderer  --enable-gtk --enable-kvm --enable-usb-redir  --enable-libusb --enable-opengl 
time make -j$(nproc --ignore=1)
time make -j$(nproc)

chmod a+x /home/haidar/
chmod a+x /home/haidar/Downloads/qemu/
chomd g+x

dnf --enablerepo=virtio-win-latest upgrade virtio-win

qemu-system-x86_64 -m 4048 -soundhw hda -smp 2 -vga cirrus -hda win10 -enable-kvm -cpu IvyBridge -cdrom virtio-win-0.1.141.iso -net nic,model=virtio
qemu-system-x86_64 -m 2GB -kernel arch/x86/boot/bzImage -initrd initrd
 -device virtio net-pci,netdev=bridge
 
qemu-system-x86_64 --enable-kvm -smp 2 -m 4G -hda rhel -net nic,model=virtio -net user,hostfwd=tcp::60022-:22 -vga virtio -display gtk,gl=on

#best min sound, 
qemu-system-x86_64 --enable-kvm -cpu max -smp 2 -m 4G -hda win10 -net nic,model=virtio -net user,hostfwd=tcp::60022-:22 -vga virtio -display sdl,gl=on -soundhw hda

#rhel kvm import
--selinux-relabel
virt-customize -a rhel-8.3-x86_64-kvm.qcow2 --root-password password:bismillah --uninstall cloud-init 

net=192.168.122.0/24,dhcpstart=192.168.122.9,

qemu-system-x86_64 --enable-kvm -cpu max -smp 2 -m 4G -hda rhel-8.3-x86_64-kvm.qcow2 -device e1000,netdev=net0  -netdev user,id=net0,hostfwd=tcp::60022-:22 -vga virtio -display sdl,gl=on -soundhw hda

#arm aarch64
qemu-system-aarch64  -cpu max -smp 2 -m 4G -M virt -hda rhel-8.0-update-1-aarch64-kvm.qcow2 -netdev nic,model=virtio -device e1000,netdev=net0 -netdev user,id=mynet0,net=192.168.122.0/24,dhcpstart=192.1.122.9,hostfwd=tcp::60022-:22 -vga virtio -display sdl -soundhw hda

#active iptables for virt
iptables -A INPUT -i virbr0 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 192.168.1.0/24 -d 192.168.122.0/24 -o virbr0 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -o virbr0  -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A OUTPUT -i virbr0 -p tcp -m tcp --dport 80 -j ACCEPT

-net user

#convert qcow2 to img
qemu-img convert rhel8.3-kvm.qcow2 -O raw rhel8.3-kvm.img

#resize img

#convert Vmdk to qcow2
qemu-img convert -f vmdk -O qcow2 image.vmdk image.qcow2

#convert qcow2 to vmdk
qemu-img convert -f qcow2 -O vmdk -o subformat=streamOptimized win10 win10.vmdk
 
#dconfg
ln -s /usr/bin/gio-querymodules-64 /usr/bin/gio-querymodules

#imageMagik
$ ./configure --with-modules --enable-shared --with-perl
sudo make install
/usr/local/bin/convert logo: logo.gif
magick identify -verbose myImage.png

# xfce save terminal
xfce4-terminal --maximize --title='Neovim' -x bash -c "nvr -s; exec bash"
xfce4-terminal --tab --title='psql' -x bash -c "psql -d zzz; exec bash"
xfce4-terminal --tab --title='Cypher-shell' -x bash -c "cd /mnt/Vancouver/Programming/data/hmdb; exec bash"
xfce4-terminal --tab --title='Cycli' -x bash -c "source activate py35 && cycli -P *** -u *** -p ***; exec bash"
xfce4-terminal --tab --title='Py3' -x bash -c "source activate py35 && python; exec bash"
xfce4-terminal --tab --title='bc' -x bash -c "bc; exec bash"
xfce4-terminal --tab --title='ud' -x bash -c "pacaur -Syu; exec bash"


***
### resolve ###
./bin/resolve  --link-flags "-L/usr/lib64/libssl.so"
./bin/resolve  -Dwithout_openssl
sudo ln -s /usr/lib64/libssl.so.1.1 /usr/lib/libssl.so.10
sudo ln -s /usr/lib64/libcrypto.so.1.1 /usr/lib/libcrypto.so.10

#disable gui
sudo systemctl set-default multi-user.target

#check lib
pkg-config --list-all | grep x265
ldconfig -p | grep libjpeg

sudo dnf install gcc-c++ make yasm pkgconfig libXext-devel libXfixes-devel x264-devel zlib-devel 

#gstreamer
export ROOT_INSTALL_DIR=/opt/media
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/
./configure --prefix=$ROOT_INSTALL_DIR  --enable-gtk-doc 

#gst base
./autogen.sh --prefix=$ROOT_INSTALL_DIR

export LD_LIBRARY_PATH=/usr/local/lib
gst-launch-1.0 --version
./autogen.sh --prefix=$ROOT_INSTALL_DIR --enable-gtk-doc 
time make -j$(nproc)

gst-launch-1.0 playbin uri=file:///home/haidar/Downloads/vid/ALIOCHA\ -\ SARAH-208867442.mp4 
gst-launch-1.0 playbin uri=file:///home/haidar/Downloads/vid/The\ Stained\ Club-351995036.mp4
gst-launch-1.0 playbin uri=file://sintel_trailer-480p.webm
gst-launch-1.0 filesrc location=sintel_trailer-480p.webm !decodebin name=decoder 

gst-launch-1.0 souphttpsrc location=https://www.freedesktop.org/software/gstreamer-sdk/data/media/sintel_trailer-480p.webm ! matroskademux name=d d.video_00 ! matroskamux ! filesink location=sintel_video.mkv

gst-launch-1.0  location=sintel_trailer-480p.webm ! matroskademux name=d d.video_00 ! matroskamux 

http://www.linuxfromscratch.org/blfs/view/svn/multimedia/gstreamer10.html
pkg-config --cflags --libs gstreamer-1.0
meson  --prefix=/usr       \
       -Dbuildtype=release \
       -Dgst_debug=false   \
       -Dgtk_doc=disabled 


FileNotFoundError: [Errno 2] No such file or directory: '/home/haidar/Downloads/build/gst-build-master/orc'
FileNotFoundError: orc

#libav
git clone git://git.libav.org/libav.git
export PKG_CONFIG_PATH=/usr/lib/pkgconfig
./configure  --prefix=/usr --enable-gpl --enable-version3  --enable-libvpx --enable-libx264  --enable-shared
 
avconv -codecs
avconv -i test.mov -c:v libx264 -c:a copy test.mp4


#264
git clone git://git.videolan.org/x264.git
./configure --prefix=/usr --enable-pic --enable-shared 

#vmare
To reset your expired ESX 4.x, ESXi 4.x, ESXi 5.x or ESXi 6.x 60 day evaluation license:

rm -r /etc/vmware/license.cfg
cp /etc/vmware/.#license.cfg /etc/vmware/license.cfg
/etc/init.d/vpxa restart

#alias bashrc
alias mop=/usr/bin/mousepad
source /etc/bashrc
export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH
 
#vlc libav
pkg-config --modversion libavcodec
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

sudo subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"  --enable "rhel-ha-for-rhel-*-server-rpms"

#rhel-7-server-extras-rpms
rhel-7-server-thirdparty-oracle-java-rpms
rhel-7-server-eus-supplementary-rpms
rhel-7-server-supplementary-rpms
rhel-7-server-optional-fastrack-rpms
#rhel-7-server-rpms
rhel-7-server-eus-rpms
rhel-7-server-devtools-rpms

#adb install redhat

#dolphin-qemu install

#firefox hard refresh
Ctrl + Shift + R

#Alt + Space to activated always on top

#install unreal ungine

#centos mirror
http://mirrors.sonic.net/centos/7/os/x86_64/


#install ffmpeg
#x265
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/Downloads/build/ffmpeg-4.1.4/ffbuild/" -DENABLE_SHARED:bool=off ../../source

pkg-config --modversion x265
#x264
./configure --enable-shared --enable-static #easier
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/Downloads/build/ffmpeg-4.1.4/ffbuild" --bindir="$HOME/bin" --enable-static

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export PKG_CONFIG_PATH="$HOME/path/to/your/x264/lib/pkgconfig"


 --disable-static --enable-shared --libdir=/usr/local/lib64   --incdir=/usr/include/ffmpeg 
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig
#ffmpeg --enable-libdc1394 --enable-libopencore-amrnb --enable-libsoxr --enable-libvo-amrwbenc  --enable-avresample 
./configure --prefix=/usr --bindir=/usr/bin --datadir=/usr/share/ffmpeg --mandir=/usr/share/man --arch=x86_64 --optflags='-O2 -g -no-pie -pipe -Wall  -fPIC -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --extra-libs="-lpthread -lm"  --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic' --extra-cflags="-fPIC"  --extra-ldflags='-Wl,-z,relro ' --enable-pic  --disable-static --enable-shared --enable-version3 --enable-bzlib --disable-crystalhd --enable-gnutls --enable-ladspa --enable-libass --enable-libcdio --enable-libdav1d --enable-libaom --enable-libfdk-aac --enable-nonfree  --disable-indev=jack --enable-libfreetype --enable-libgsm --enable-libmp3lame --enable-openal --enable-libopenjpeg --enable-libopus --enable-libpulse  --enable-libxvid --enable-libspeex --enable-libtheora  --enable-libfreetype --enable-libvorbis --enable-libv4l2 --enable-libx264 --enable-parser=h264 --enable-decoder=h264 --enable-encoder=rawvideo,libx264 --enable-libx265  --enable-avfilter --enable-postproc --enable-pthreads --enable-avcodec --enable-avformat --enable-gpl --disable-debug --disable-stripping --shlibdir=/usr/lib64 --enable-runtime-cpudetect

mv /lib64/libavcodec.so /lib64/libavcodec.so
mv /lib/libavcodec.so /lib/libavcodec.so_bak

time make -j$(nproc)


alias ffmpeg=/usr/bin/ffmpeg

ffmpeg -encoders
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" ./configure --prefix=/usr --enable-opencl --disable-static --enable-libx265   --enable-libx264   --enable-libmp3lame --extra-libs=-lpthread --extra-libs=-lm --enable-gpl  --enable-libfdk_aac --enable-libfreetype --enable-libopus --enable-libvpx --enable-nonfree  --enable-libass   --enable-libfreetype --enable-libtheora  --enable-libvorbis --enable-libvpx --enable-version3  --enable-opengl --enable-pic  --enable-shared 

sudo mv ~/bin/{ffmpeg,ffprobe,ffplay} /usr/local/bin
sudo mv ~/bin/* /usr/local/bin

#ffmpegbefore
ffmpeg -version
ffmpeg version 4.2 Copyright (c) 2000-2019 the FFmpeg developers
built with gcc 9.1.0 (GCC)
configuration: --prefix=/usr --bindir=/usr/bin --datadir=/usr/share/ffmpeg --incdir=/usr/include/ffmpeg --libdir=/usr/lib64 --mandir=/usr/share/man --arch=x86_64 --optflags='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic' --extra-cflags="-fPIC" --extra-ldflags='-Wl,-z,relro ' --enable-version3 --enable-bzlib --disable-crystalhd --enable-gnutls --enable-ladspa --enable-libass --enable-libcdio --enable-libfdk-aac --enable-nonfree --disable-indev=jack --enable-libfreetype --enable-libgsm --enable-libmp3lame --enable-openal --enable-libopenjpeg --enable-libopus --enable-libpulse --enable-libspeex --enable-libtheora --enable-libvorbis --enable-libv4l2 --enable-libx264 --enable-libx265 --enable-avfilter --enable-postproc --enable-pthreads --disable-static --enable-shared --enable-gpl --disable-debug --disable-stripping --shlibdir=/usr/lib64 --enable-runtime-cpudetect
libavutil      56. 31.100 / 56. 22.100
libavcodec     58. 54.100 / 58. 35.100
libavformat    58. 29.100 / 58. 20.100
libavdevice    58.  8.100 / 58.  5.100
libavfilter     7. 57.100 /  7. 40.101
libswscale      5.  5.100 /  5.  3.100
libswresample   3.  5.100 /  3.  3.100
libpostproc    55.  5.100 / 55.  3.100


#bad
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig"  
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" ./configure \
  --prefix="$HOME/Downloads/build/ffmpeg-4.1.4/ffbuild/" \
  --pkg-config-flags="--static" \
  --extra-libs=-lpthread \
  --extra-libs=-lm \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-libfdk_aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree \
  --extra-ldflags="-ldl" 
  --enable-shared
  
  
  --extra-cflags="-I$HOME/Downloads/build/ffmpeg-4.1.4/ffbuild/include" \
  --extra-ldflags="-L$HOME/Downloads/build/ffmpeg-4.1.4/ffbuild/lib, -ldl" 
  
#aom
cmake .. -DBUILD_SHARED_LIBS=1 -DENABLE_NASM=on ..

#vlc
PKG_CONFIG_PATH="/usr/lib/pkgconfig"
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" ./configure

#easyly install ubuntu launchpad
#instal py setup.py
python3 setup.py install 
pip install . 
sudo python3 -m pip install psutil
sudo python2 -m pip install psutil
sudo python3 -m pip install --upgrade pip

#alien
wget -c https://sourceforge.net/projects/alien-pkg-convert/files/release/alien_8.95.tar.xz
alien -r -g -v php7.2_7.2.3-1ubuntu1_all.deb 
sed -i 's#%dir "/"##' php7.2-7.2.3/php7.2-7.2.3-2.spec
sed -i 's#%dir "/usr/bin/"##' php7.2-7.2.3/php7.2-7.2.3-2.spec
cd php7.2-7.2.3/
rpmbuild --target=noarch --buildroot /home/haidar/Downloads/app/php7.2-7.2.3/ \
         -bb php7.2-7.2.3-2.spec

#vokoscreen

Requires:
  - Qt5 >= 5.7
  - gstreamer-plugins-bad
  - alsa
  - libX11
  - libv4l2
  - libv4lconvert
  - libmp3lame0
  - xdg-utils
  - lsof
  - ffmpeg >= 1.1.0
  - pulseaudio
- pulsaudio-utils
- clone git repository: "git clone https://github.com/vkohaupt/vokoscreen.git"
- change into the vokoscreen-<version> directory
- run "qmake <option>"
- run "make"

#configure flags
./configure CFLAGS='-lz' CXXFLAGS='-lz'
make CFLAGS='-lz' CXXFLAGS='-lz'

#wordnet
./configure CFLAGS="-DUSE_INTERP_RESULT"

#baseos repo
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/package_manifest/chap-baseos-repository



###### install pcmanfm build libfm pcmanfm #########
sudo dnf install intltool gtk2-devel -y

# Download (HTTP): https://downloads.sourceforge.net/pcmanfm/libfm-1.3.2.tar.xz
# Installation of libfm-extra
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --with-extra-only \
            --with-gtk=no     \
            --disable-static  &&
make
sudo make install

# install menu-cache
# Download (HTTP): https://downloads.sourceforge.net/lxde/menu-cache-1.1.0.tar.xz
tar xvf menu-cache-1.1.0.tar.xz
cd menu-cache-1.1.0/
aria2c https://www.linuxfromscratch.org/patches/blfs/svn/menu-cache-1.1.0-consolidated_fixes-1.patch

patch -Np1 -i ./menu-cache-1.1.0-consolidated_fixes-1.patch
patch -Np1 -i ../menu-cache-1.1.0-consolidated_fixes-1.patch

./configure --prefix=/usr    \
            --disable-static &&
make
sudo make install
# Installation of libfm
aria2c https://downloads.sourceforge.net/pcmanfm/libfm-1.3.2.tar.xz
tar xvf libfm-1.3.2.tar.xz
cd libfm-1.3.2/

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-static  &&
make
sudo make install 

# install pcmanfm
aria2c https://downloads.sourceforge.net/pcmanfm/pcmanfm-1.3.1.tar.xz

# pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

tar xvf pcmanfm-1.3.1.tar.xz 
cd pcmanfm-1.3.1/
./configure --prefix=/usr     \
            --sysconfdir=/etc &&
make
sudo make install
# lxmenu-data
git clone git@github.com:lxde/lxmenu-data.git
./autogen.sh
./configure --prefix=/usr --sysconfdir=/etc && make
sudo make install

# menulibre
aria2c https://github.com/bluesabre/menulibre/releases/download/menulibre-2.2.3/menulibre-2.2.3.tar.gz
cd menulibre-2.2.3
sudo pip install distutils-extra-python
sudo python3 setup.py install


#### done PCManFM ####


#pkg
flatpak, snap, ppa , apt, appimage, build from source

#ask serverfault stackoverflow or other
#Install Menu Cache by running the following commands:
./configure --prefix=/usr --disable-static 

pkg-config
./configure CFLAGS="-MENU_CACHE_CFLAGS,-rpath=/usr/local/lib/

export PATH=/usr/local/WordNet-3.0/bin:$PATH

#add lib to /etc/ This solved the issue Just add /usr/local/lib to /etc/ld.so.conf (unless it's already in there; only put it once), then run ldconfig.
nano /etc/ld.so.conf.d/local_build.conf 


#custom menu gnome-terminal -e "your command" --geometry=25x77
gnome-terminal -e "tmux"

# download intel opencl driver l_opencl_p_18.1.0.015.tgz

#list user
cat /etc/passwd

#add ssh key
ssh-copy-id username@remote_host

#intel driver 01.org
-intel media driver
-libva utils
-libva
PKG_CONFIG_PATH=/usr/loca/lib/pkgconfig/ ./autogen.sh


dmesg | grep virgl

#mesa manual from source
./autogen.sh --prefix=/usr/local/ --enable-texture-float --with-gallium-drivers="i915 --with-egl-platforms=drm,x11 --enable-glx-tls --enable-shared-glapi --enable-glx --enable-driglx-direct --enable-gles1 --enable-gles2 --enable-gbm --enable-openmax --enable-xa --enable-osmesa --with-radeonsi-llvm-compiler --enable-sysfs --enable-vdpau --enable-xvmc --enable-openmax --enable-nine

./configure \
    --prefix=/usr/local/ \
    --enable-driglx-direct \
    --enable-gles1 \
    --enable-gles2 \
    --enable-glx-tls \
    --with-egl-platforms='drm x11 wayland' \
    --with-dri-drivers="i915 i965 nouveau" \
    --with-gallium-drivers="nouveau swrast radeonsi"
    

GALLIUM_DRV="i915,nouveau,r600,radeonsi,svga,swrast,virgl"
DRI_DRIVERS="i965,nouveau"
    
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

meson configure build/ -Dprefix=/usr/local   -Dglx=true -Dgles1=true -Dgles2=true             -Dbuildtype=release                  -Ddri-drivers="i915, i965,nouveau"          -Dgallium-drivers="nouveau,swrast,radeonsi,virgl"       -Dgallium-nine=false                 -Dglx=dri                            -Dosmesa=gallium        -Dvalgrind=false 
     
ninja -C build/      
make -j4
sudo make install

export LIBGL_DRIVERS_PATH=/usr/local/lib64/dri/


dnf builddep mesa

#test opencl
OpenCL_LIBPATH=/opt/intel/opencl/linux/compiler/lib -DOpenCL_INCPATH=/etc/OpenCL/vendors/ cmake ../opencl-testsuite
 cmake ../opencl-testsuite -DOpenCL_INCPATH=/etc/OpenCL/vendors/ 


#virtualization qemu arm
qemu-system-arm \
  -M versatilepb \
  -cpu arm1176 \
  -m 256 \
  -M versatilepb \
  -hda /home/haidar/Downloads/raspbian/2019-07-10-raspbian-buster-lite.img \
  -net nic \
  -net user,hostfwd=tcp::5022-:22 \
  -dtb /home/haidar/Downloads/qemu-rpi/versatile-pb.dtb \
  -kernel /home/haidar/Downloads/qemu-rpi/kernel-qemu-4.19.50-buster \
  -append 'root=/var/lib/libvirt/images/raspbianArm.qcow2 panic=1' \
  -no-reboot \
  -display gtk,gl=off \
   -vga none \

#virtualization
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_virtualization/getting-started-with-virtualization-in-rhel-8_configuring-and-managing-virtualization

#webconsole virt
https://www.redhat.com/en/blog/managing-virtual-machines-rhel-8-web-console

#move toIf you copy your ISO image to (and access it from there) all the problems will go away.
/var/lib/libvirt/images 

#new virt
virt-install --name win10 --memory 2048 --vcpus 1 --disk size=14 --os-variant win10 --cdrom /home/haidar/Downloads/app/17763.107.101029-1455.rs5_release_svc_refresh_CLIENT_LTSC_EVAL_x64FRE_en-us.iso

#steam install flatpak
dnf install glibc.i686

#setting timezone
timedatectl list-timezones
timedatectl set-timezone Asia/Jakarta


#davinci resolve
ocl-icd
beignet


#aria2 example
aclocal
automake
make

#bad problem gui gnome
killall -3 gnome-shell

SOLVED: found a way.
Changing /etc/libvirt/qemu.conf to make things work.
Uncomment user/group to work as root.
Then restart libvirtd


#checkpath
namei -om /path/to/check

#mysql8
#set the complete "forgiving" mode
mysql> SET GLOBAL sql_mode='';
ALTER USER 'yourusername'@'localhost' IDENTIFIED WITH mysql_native_password BY 'youpassword';


# alternatively you can set sql mode to the following
mysql> SET GLOBAL sql_mode='STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION';

# The user for QEMU processes run by the system instance. It can be
# specified as a user name or as a user id. The qemu driver will try to
# parse this value first as a name and then, if the name doesn't exist,
# as a user id.
#
# Since a sequence of digits is a valid user name, a leading plus sign
# can be used to ensure that a user id will not be interpreted as a user
# name.
#
# Some examples of valid values are:
#
#       user = "qemu"   # A user named "qemu"
#       user = "+0"     # Super user (uid=0)
#       user = "100"    # A user named "100" or a user with uid=100
#
user = "root"

# The group for QEMU processes run by the system instance. It can be
# specified in a similar way to user.
group = "root"

# Whether libvirt should dynamically change file ownership
# to match the configured user/group above. Defaults to 1.
# Set to 0 to disable file ownership changes.
#dynamic_ownership = 1

[root@dev1 ~]# service libvirtd restart


#able install on macbook pro
https://access.redhat.com/discussions/4322181


#rhelcontrib
https://www.gtk.org/development.php

Program received signal SIGSEGV, Segmentation fault.
0x00000000064a7d29 in std::rethrow_exception(std::__exception_ptr::exception_ptr) ()
Missing separate debuginfos, use: dnf debuginfo-install alsa-lib-1.1.6-3.el8.x86_64 bzip2-libs-1.0.6-26.el8.x86_64 cairo-1.15.12-3.el8.x86_64 expat-2.2.5-3.el8.x86_64 fontconfig-2.13.1-3.el8.x86_64 freetype-2.9.1-4.el8.x86_64 fribidi-1.0.4-6.el8.x86_64 gdk-pixbuf2-2.36.12-2.el8.x86_64 glib2-2.56.4-1.el8.x86_64 harfbuzz-1.7.5-3.el8.x86_64 libICE-1.0.9-13.el8.x86_64 libSM-1.2.3-1.el8.x86_64 libX11-1.6.7-1.el8.x86_64 libXau-1.0.8-13.el8.x86_64 libXext-1.3.3-9.el8.x86_64 libXrender-0.9.10-7.el8.x86_64 libXxf86vm-1.1.4-9.el8.x86_64 libcroco-0.6.12-4.el8.x86_64 libdatrie-0.2.9-7.el8.x86_64 libffi-3.1-18.el8.x86_64 libgcc-8.2.1-3.5.el8.x86_64 libglvnd-1.0.1-0.9.git5baa1e5.el8.x86_64 libglvnd-glx-1.0.1-0.9.git5baa1e5.el8.x86_64 libmount-2.32.1-8.el8.x86_64 libpng-1.6.34-5.el8.x86_64 librsvg2-2.42.7-2.el8.x86_64 libselinux-2.8-6.el8.x86_64 libstdc++-8.2.1-3.5.el8.x86_64 libthai-0.1.27-2.el8.x86_64 libtool-ltdl-2.4.6-25.el8.x86_64 libuuid-2.32.1-8.el8.x86_64 libxcb-1.13-5.el8.x86_64 libxcrypt-4.1.1-4.el8.x86_64 libxml2-2.9.7-5.el8.x86_64 mesa-libGLU-9.0.0-15.el8.x86_64 numactl-libs-2.0.12-2.el8.x86_64 pcre-8.42-4.el8.x86_64 pcre2-10.32-1.el8.x86_64 pixman-0.36.0-1.el8.x86_64 xz-libs-5.2.4-3.el8.x86_64 zlib-1.2.11-10.el8.x86_64


sudo dnf install docbook-utils gettext-devel glib-devel \
            gobject-introspection-devel gperf gtk-doc gtk3-devel \
            libarchive-devel libsoup-devel \
            libstemmer-devel libuuid-devel libyaml-devel \
            meson rpm-devel sqlite-devel


#aria 
sudo dnf install kernel-devel libgcrypt-devel libxml2-devel openssl-devel gettext-devel cppunit



location ~* \.(?:manifest|appcache|html?|xml|json)$ {
    expires -1;
}

# kill cache
add_header Last-Modified $date_gmt;
add_header Cache-Control 'no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0';
if_modified_since off;
expires off;
etag off;


snap
005003b!$<1>



eversync
001002{01}s7


#kdesrc-build
using python2 alternatives
sudo alternatives --config python 
/home/haidar/Downloads/git/kdesrc-build
./kdesrc-build --include-dependencies Qt5

./kdesrc-build --print-modules --stop-on-failure  --no-src syntax-highlighting

./kdesrc-build --stop-on-failure  --no-src --include-dependencies okular
./kdesrc-build --stop-on-failure  --no-src --include-dependencies syntax-highlighting
./kdesrc-build --stop-on-failure --include-dependencies kcodecs

thanks for your help. for KDE, I need kdesrc-build so i could install almost all kde apps easily,
Dolphin installed from flatpak is flaws cannot open mounted drive, cannot use open with,etc
I need stable dolphin, kdictionary.
And yes the important thing is ocs-url 

I see RHEL 8 was amazing, able to install steam with thousands game, only is Epel ready. It's unbeatable OS   

01
0r4b1$34L99

sudo yum -y groups install "GNOME Desktop"

yum install -y epel-release
yum groupinstall -y "X Window System"
yum install -y xrdp
yum install -y gnome-classic-session gnome-terminal nautilus-open-terminal control-center liberation-mono-fonts
systemctl enable xrdp
systemctl start xrdp


#nginx & proxy reverse
2>&1 nginx -V | tr -- - '\n' | grep _module


chmod -R ug=rwX,o=rX /home/slametparsono
chcon -t httpd_sys_content_t /home/nginx/ -R
sudo usermod -aG nginx haidar

sudo gpasswd -a nginx haidar

location /dept/ {
	alias /home/public_html/indeks-kepuasan/dept/;
}

Maaf Mau tanya ada yg pernah build Golang base App from source di RHEL ?
gagal terus build snapd error gini kenapa ya kira2 ?

```
mkdir -p bin/
cp $WORK/b001/exe/a.out bin/snap-failure
rm -r $WORK/b001/
+ %gobuild_static -o bin/snap-exec github.com/snapcore/snapd/cmd/snap-exec
/var/tmp/rpm-tmp.TPfc0v: line 60: fg: no job control
error: Bad exit status from /var/tmp/rpm-tmp.TPfc0v (%build)

RPM build errors:
    Bad exit status from /var/tmp/rpm-tmp.TPfc0v (%build)
```

list go version nya

```
golang-1.11.6-1.module+el8.0.1+3226+60b863d2.x86_64
golang-bin-1.11.6-1.module+el8.0.1+3226+60b863d2.x86_64
golang-src-1.11.6-1.module+el8.0.1+3226+60b863d2.noarch
go-compilers-golang-compiler-1-20.el8.x86_64
go-toolset-1.11.6-1.module+el8.0.1+3226+60b863d2.x86_64
go-srpm-macros-2-16.el8.noarch
go-compilers-golang-compiler-1-20.el8.x86_64
```

aku pake RHEL 8 karna snapd & EPEL nya blun tersedia

ffmpeg from release
  SDL-1.2.15-14.el7.x86_64     
  libass-0.13.4-6.el7.x86_64   
  opencore-amr-0.1.3-3.el7.nux.x86_64     
  x265-libs-1.9-1.el7.nux.x86_64    
  xvidcore-1.3.2-5.el7.nux.x86_64 
  libvdpau-1.1.1-3.el7.x86_64   
  x264-libs-0.142-11.20141221git6a301b6.el7.nux.x86_64  
  fdk-aac-0.1.4-1.x86_64         
  soxr-0.1.2-1.el7.x86_64     
  libdc1394-2.2.2-3.el7.x86_64    
  vo-amrwbenc-0.1.2-1.el7.nux.x86_64    
  schroedinger-1.0.11-4.el7.x86_64      
  lame-libs-3.100-1.el7.x86_64       ffmpeg-libs-2.8.15-2.el7.nux.x86_64                                                                                                            openal-soft-1.16.0-3.el7.x86_64                                                                                                                 libavdevice-2.8.15-2.el7.nux.x86_64        
  ffmpeg-2.8.15-2.el7.nux.x86_64                                                                                                                          ffmpeg-devel-2.8.15-2.el7.nux.x86_64                                                                                                                      


Removed:
  qt5-devel-5.11.1-2.el8.noarch                            libinput-devel-1.12.3-3.el8.x86_64                        libmng-2.0.3-7.el8.x86_64                                
  qt5-qt3d-5.11.1-4.el8.x86_64                             qt5-qt3d-devel-5.11.1-4.el8.x86_64                        qt5-qtbase-static-5.11.1-5.el8.x86_64                    
  qt5-qtconnectivity-5.11.1-2.el8.x86_64                   qt5-qtconnectivity-devel-5.11.1-2.el8.x86_64              qt5-qtdeclarative-static-5.11.1-3.el8.x86_64             
  qt5-qtimageformats-5.11.1-2.el8.x86_64                   qt5-qtlocation-5.11.1-2.el8.x86_64                        qt5-qtlocation-devel-5.11.1-2.el8.x86_64                 
  qt5-qtmultimedia-5.11.1-2.el8.x86_64                     qt5-qtmultimedia-devel-5.11.1-2.el8.x86_64                qt5-qtsensors-5.11.1-2.el8.x86_64                        
  qt5-qtsensors-devel-5.11.1-2.el8.x86_64                  qt5-qtserialport-5.11.1-3.el8.x86_64                      qt5-qtserialport-devel-5.11.1-3.el8.x86_64               
  qt5-qttools-static-5.11.1-5.el8.x86_64                   qt5-qtwayland-5.11.1-2.el8.x86_64                         qt5-qtwayland-devel-5.11.1-2.el8.x86_64                  
  qt5-qtwebchannel-5.11.1-2.el8.x86_64                     qt5-qtwebchannel-devel-5.11.1-2.el8.x86_64                qt5-qtwebsockets-5.11.1-2.el8.x86_64                     
  qt5-qtwebsockets-devel-5.11.1-2.el8.x86_64               qt5-qtx11extras-5.11.1-2.el8.x86_64                       qt5-qtx11extras-devel-5.11.1-2.el8.x86_64                
  qt5-qtxmlpatterns-devel-5.11.1-2.el8.x86_64             



