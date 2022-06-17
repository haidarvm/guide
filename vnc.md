# install
sudo dnf install tigervnc-server tigervnc

# new vnc user
useradd vncuser1
passwd vncuser1

su - vncuser1
vncpasswd

echo 'session=gnome' > ~/.vnc/config

# add user mapping
echo ':1=vncuser1' >> /etc/tigervnc/vncserver.users

# create systemd
cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service

# firewall
firewall-cmd --permanent --zone=public --add-port 5901/tcp
firewall-cmd  --reload

# enable vnc service
systemctl enable vncserver@:1.service
systemctl start vncserver@:1.service
systemctl status vncserver@\:1.service




## ubuntu based
sudo apt install tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension tigervnc-viewer

$ vncserver
$ ls -l ~/.vnc 