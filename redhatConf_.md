####### FIRST INSTALLATION ########
https://play.google.com/store/apps/details?id=com.haidarvm.ecommerce
+62 838-2933-6744


#link
https://developers.redhat.com/blog/2016/03/31/no-cost-rhel-developer-subscription-now-available/

#download new
https://haidarvm.com/rhel-8.0-update-3-x86_64-kvm.qcow2

#step one enable ssh press i then :wq
vi /etc/ssh/sshd_config

#edit at bottom 
PasswordAuthentication yes
systemctl restart sshd


#add subscription
subscription-manager register --auto-attach

#enable autocomplete
dnf install bash-completion

#create new user
sudo useradd -m -c "haidarvm" haidarvm -s /bin/bash 

#make sudo
usermod -aG wheel haidarvm

#createswapfile https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-centos-7


#install firewall iptables
sudo dnf install -y firewalld
sudo systemctl enable firewalld
sudo systemctl restart firewalld.service 

#firewall
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --zone=public --add-port=5500/tcp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload
firewall-cmd --zone=public --add-port=369/tcp --permanent
sudo firewall-cmd --list-all


firewall-cmd --zone=public --add-service=mysql --permanent

####### END INSTALLATION ########

### tigervnc ###

#### nginx #### gpasswd
gpasswd -a nginx haidarvm
chmod g+x /home/haidarvm
chmod g+x /home/haidarvm/public_html
systemctl restart nginx.service
systemctl restart php-fpm.service
sudo usermod -a -G nginx haidarvm
chgrp nginx /home/haidarvm/public_html
chmod g+rwxs /home/haidarvm/public_html

sudo chown -R nginx: /home/
sudo chown -R www-data:"$USER" /webdirectory

chcon -R -t httpd_sys_rw_content_t /home/haidarvm
chcon -R -t httpd_sys_content_rw_t /home/haidarvm/wp-content/uploads/
chcon -R -t httpd_sys_content_rw_t /home/client/didikpos/public_html/wp-content/uploads/
chcon -R -t httpd_sys_rw_content_t /home/client/didikpos/public_html/wp-content/uploads/
restorecon -R /home/client/didikpos/public_html/wp-content/uploads/


chcon -R -t httpd_sys_rw_content_t /home/client/kkijabar/public_html/wp-content/uploads/



restorecon -R /home
setsebool -P httpd_can_network_connect 1
setsebool -P httpd_read_user_content 1
setsebool -P httpd_unified 1
restorecon -R -v /var/run/nginx*


### git nginx ###


### git user ###


#### certbot ####
wget https://dl.eff.org/certbot-auto
sudo mv certbot-auto /usr/local/bin/certbot-auto
sudo chown root /usr/local/bin/certbot-auto
sudo chmod 0755 /usr/local/bin/certbot-auto

sudo /usr/local/bin/certbot-auto --nginx

sudo /usr/local/bin/certbot-auto --nginx --verbose --debug --email haidarvm@gmail.com -d haidarvm.com -d www.haidarvm.com -d ali.haidarvm.com

# copy paste list software
setxkbmap

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
yum groupinstall "X Window System" Desktop
yum groupinstall "X Window System" "KDE Desktop"

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
firewall-cmd --permanent --add-port=8787/tcp --add-port=8787/tcp
firewall-cmd --reload

#sendmail
chmod 0600 /var/spool/mail/*
echo "Subject: sendmail test" | sendmail -v haidarvm@gmail.com


#epel
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm


#install rpm fusion
gstreamer-plugins-ffmpeg gstreamer-plugins-good gstreamer-plugins-good-extras gstreamer-plugins-bad-free gstreamer-plugins-ugly gstreamer1-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} gstreamer1-plugin-mpg123

startx
#
systemctl set-default graphical

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

yum install https://www.elrepo.org/elrepo-release-8.0-2.el8.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel info kernel-ml
dnf config-manager --enable elrepo-kernel
dnf config-manager --disable elrepo-kernel
yum --enablerepo=elrepo-kernel install kernel-ml
yum remove  kernel-{devel,tools,tools-libs}
yum -y --enablerepo=elrepo-kernel install kernel-ml-{devel,headers,tools,tools-libs}
yum install kernel-ml kernel-ml-{devel,tools,tools-libs} grub2-tools
yum install -y dkms gcc redhat-lsb-languages
# rpm -Uvh kernel-headers-2.6.18-194.el5.x86_64.rpm


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
sha256sum boot.iso
https://developers.redhat.com/download-manager/content/origin/files/sha256/2d/2d4fac3cdf416975d8335933bee3c88729bfd3d0537da427a36a1db60a4d955e/rhel-server-7.7-x86_64-boot.iso
https://developers.redhat.com/products/rhel/download
download.devel.redhat.com/composes/latest-RHEL7/compose/server/x86_64/os

#enable extra repos
sudo subscription-manager repos
sudo subscription-manager list --available
sudo subscription-manager repos --list-enabled

sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-source-rpms
sudo subscription-manager repos --enable rhel-8-for-x86_64-rt-source-rpms
sudo subscription-manager repos --enable rhel-8-for-x86_64-supplementary-source-rpms


dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 


#first install
subscription-manager register --auto-attach
subscription-manager register
subscription-manager auto-attach
subscription-manager subscribe

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




#running kernel
5.2.8-1.el8.elrepo.x86_64 
5.2.8-1.el8.elrepo.x86_64

mssqlpass
12Bismillah
sqlcmd -S localhost -U SA -P '<YourPassword>'
sqlcmd -S localhost -U SA -P 12Bismillah

#check ip
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

#dnf command
dnf info nginx
dnf module disable php
dnf group	
dnf grouplist	
dnf groupinfo "Basic Web Server"
dnf groupinstall "Web Server" -y
dnf groupinstall "Server with GUI" -y
dnf repolist all
dnf repository-packages epel list
dnf repolist
dnf groupinfo Virtualization
dnf provides libcrypt.so.1
dnf whatprovides libgconf-2.so.4
dnf --releasever=29 --showduplicates list $pkgname
dnf deplist curl
dnf reinstall $(repoquery --requires --recursive --resolve gdm)
dnf config-manager --disablerepo elrepo-kernel
dnf config-manager --set-disabled
dnf config-manager --set-enabled 
dnf --remove-repo elrepo-kernel

#annobin
-iplugindir=<path/to/dir/containing/annobin>

#list all
systemctl list-unit-files 
systemctl list-units --type=service --state=running
systemctl list-unit-files --state=enabled
systemctl list-units --state=failed


#qtcore
https://forums.gentoo.org/viewtopic-p-8336448.html?sid=527bc0cd156b3ad40d11584f1601a096

#virglrenderer
./autogen.sh --enable-dependency-tracking  --enable-debug --enable-gbm-allocation  --enable-tests --enable-shared


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
virt-customize -a rhel-8.0-x86_64-kvm.qcow2 --root-password password:bismillah --uninstall cloud-init 

net=192.168.122.0/24,dhcpstart=192.168.122.9,

qemu-system-x86_64 --enable-kvm -cpu max -smp 2 -m 4G -hda rhel-8.0-x86_64-kvm.qcow2 -device e1000,netdev=net0  -netdev user,id=net0,hostfwd=tcp::60022-:22 -vga virtio -display sdl,gl=on -soundhw hda

#arm aarch64
qemu-system-aarch64  -cpu max -smp 2 -m 4G -M virt -hda rhel-8.0-update-1-aarch64-kvm.qcow2 -netdev nic,model=virtio -device e1000,netdev=net0 -netdev user,id=mynet0,net=192.168.122.0/24,dhcpstart=192.1.122.9,hostfwd=tcp::60022-:22 -vga virtio -display sdl -soundhw hda

#active iptables for virt
iptables -A INPUT -i virbr0 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 192.168.1.0/24 -d 192.168.122.0/24 -o virbr0 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -o virbr0  -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A OUTPUT -i virbr0 -p tcp -m tcp --dport 80 -j ACCEPT

-net user

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

#xfce save terminal
xfce4-terminal --maximize --title='Neovim' -x bash -c "nvr -s; exec bash"
xfce4-terminal --tab --title='psql' -x bash -c "psql -d zzz; exec bash"
xfce4-terminal --tab --title='Cypher-shell' -x bash -c "cd /mnt/Vancouver/Programming/data/hmdb; exec bash"
xfce4-terminal --tab --title='Cycli' -x bash -c "source activate py35 && cycli -P *** -u *** -p ***; exec bash"
xfce4-terminal --tab --title='Py3' -x bash -c "source activate py35 && python; exec bash"
xfce4-terminal --tab --title='bc' -x bash -c "bc; exec bash"
xfce4-terminal --tab --title='ud' -x bash -c "pacaur -Syu; exec bash"

#resolve
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


#pkg
flatpak, snap, ppa , apt, appimage, build from source

#ask serverfault stackoverflow or other
#build libfm pcmanfm
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
	alias /home/haidarvm/public_html/indeks-kepuasan/dept/;
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



Hey, why didn't Jesus tell you that sperm and eggs don't carry dna? That made you look really stupid