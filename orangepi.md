# use etcher
chmod +x balenaEtcher-1.7.9-x64.AppImage


# download OS
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-Zero-2.html


# product details
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-2.html

# timezone
dpkg-reconfigure tzdata


#orangepiEnv.txt
verbosity=7
console=display
monitor=hdmi
edid=1
hpd=0
;disp_mode=1920x1080p60
disp_mode=1366x768
rootdev=UUID=6a7a9d8d-b920-444a-af8f-fb5cf92213dd
rootfstype=ext4 



# example 
/etc/apt/sources.list
# ===================================

deb http://ports.ubuntu.com/ focal main restricted universe multiverse
#deb-src http://ports.ubuntu.com/ focal main restricted universe multiverse

deb http://ports.ubuntu.com/ focal-security main restricted universe multiverse
#deb-src http://ports.ubuntu.com/ focal-security main restricted universe multiverse

deb http://ports.ubuntu.com/ focal-updates main restricted universe multiverse
#deb-src http://ports.ubuntu.com/ focal-updates main restricted universe multiverse

deb http://ports.ubuntu.com/ focal-backports main restricted universe multiverse
#deb-src http://ports.ubuntu.com/ focal-backports main restricted universe multiverse



/etc/apt/sources.list.d/armbian.list
# ===================================

deb http://apt.armbian.com/region/EU/ focal main focal-utils focal-desktop