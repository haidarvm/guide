sudo dnf install perl-App-cpanminus
sudo cpanm Linux::DesktopFiles
gmrun
obmenu generator

#update grub2
sudo grub2-mkconfig -o /etc/grub2-efi.cfg

#disable selinux
sudo setenforce 0

# open config
vi /etc/selinux/config
SELINUX to disabled


# remi
dnf install https://rpms.remirepo.net/fedora/remi-release-35.rpm