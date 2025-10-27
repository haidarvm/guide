sudo dnf install perl-App-cpanminus
sudo cpanm Linux::DesktopFiles
gmrun
obmenu generator

#update grub2
sudo grub2-mkconfig -o /etc/grub2-efi.cfg

# verbose grub
sudo vim /etc/default/grub 
## remove rhgb silent

# dnf install gui
systemctl set-default graphical.target
systemctl enable lightdm.service
 
# alternatives config 

# dnf5 command
dnf info postgresql-server



# change fedora mirror add sg singapore
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch&country=SG
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch&country=SG

# install rpmfusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# no at 42 sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install rpmfusion non free
sudo dnf install rpmfusion-free-release-tainted
sudo dnf install rpmfusion-nonfree-release-tainted

# go to root
sudo su -

# fedora cloud change password qcow2
virt-customize -a Fedora-Cloud-Base-42.x86_64.qcow2 --root-password password:bismillah

# make sudo
usermod -aG wheel haidarvm

#disable selinux
sudo setenforce 0

# go to sudo without passwd
sudo su -i

# relabel clear old definition
sudo dnf upgrade selinux-policy selinux-policy-targeted
sudo fixfiles onboot
sudo touch /.autorelabel
sudo reboot


# repair fedora chroot
sudo umount -R /mnt/fedora 2>/dev/null
sudo vgchange -ay
sudo mount /dev/fedora/root /mnt/fedora
sudo mkdir -p /mnt/fedora/boot
sudo mount /dev/nvme0n1p1 /mnt/fedora/boot
sudo mount -t proc /proc /mnt/fedora/proc
sudo mount -t sysfs /sys /mnt/fedora/sys
for dir in /dev /proc /sys /run; do
  sudo mount --rbind $dir /mnt/fedora$dir
done
sudo mount --make-rslave /mnt/fedora/dev
sudo mount -t devpts devpts /mnt/fedora/dev/pts
sudo chroot /mnt/fedora /bin/bash

# unmount chroot
sudo umount /mnt/fedora/dev/pts
sudo umount /mnt/fedora/dev
sudo umount /mnt/fedora/proc
sudo umount /mnt/fedora/sys
sudo umount /mnt/fedora/run
 sudo umount /dev/mapper/fedora-root 


# install gui
dnf groupinstall "Cinnamon Desktop"

# open config
vi /etc/selinux/config
SELINUX to disabled

# alias
alias r='rpm -qa | grep'
alias rp='sudo rpm -Uvh'
alias up='sudo dnf5 update -y'
alias d='sudo dnf5 install'
alias ds='sudo dnf5 search'
alias dr='sudo dnf5 remove'
alias D='cd ~/Downloads'
alias v='vim'
alias Dc='cd ~/Documents'
alias js='journalctl -t setroubleshoot'
alias gru='sudo grub2-mkconfig -o /etc/grub2-efi.cfg'

# remi
dnf install https://rpms.remirepo.net/fedora/remi-release-35.rpm
dnf install https://rpms.remirepo.net/fedora/remi-release-35.rpm

# remove wildcard
sudo dnf remove 'libreoffice-*'
sudo dnf remove 'liberation-*'

# check latest remove packages
sudo dnf history info last

# resize xfs lvm2
xfs_growfs /dev/mapper/fedora-root

# enable wayland screenshare
Make sure you have enabled pipewire screenshare in chrome://flags.

Make sure you dont run fullscreen apps to share, else you might need to disable fullscreen unredirect

# install anydesk
sudo dnf install gtkglext-libs
wget -c 'https://download.anydesk.com/linux/anydesk_6.2.0-1_x86_64.rpm' -P /tmp
# if upgrade
sudo rpm -Uvh --nodeps /tmp/anydesk_6.2.0-1_x86_64.rpm
# if fresh install
sudo rpm -ivh --nodeps /tmp/anydesk_6.2.0-1_x86_64.rpm
