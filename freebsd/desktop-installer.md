pkg install desktop-installer
desktop-installer
desktop-installer
pkg install drm-kmod mesa-dri xorg
pkg install gnome lightdm lightdm-gtk-greeter
sysrc kld_list+="drm"
sysrc lightdm_enable="YES"
sysrc gnome_enable="YES"
vim /usr/local/etc/lightdm/lightdm.conf
pw groupmod video -m haidar


