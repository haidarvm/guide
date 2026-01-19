pkg install desktop-installer
desktop-installer
desktop-installer
pkg install xorg drm-kmod
pkg install gnome lightdm lightdm-gtk-greeter
sysrc lightdm_enable="YES"
sysrc gnome_enable="YES"
vim /usr/local/etc/lightdm/lightdm.conf
pw groupmod video -m haidar
pkg install xf86-video-qxl
pkg delete xf86-video-scfbmkdir -p /usr/local/etc/X11/xorg.conf.d
vim /usr/local/etc/X11/xorg.conf.d/20-qxl.conf
Section "Device"
    Identifier "QXL"
    Driver "qxl"
EndSection