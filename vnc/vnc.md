# install
sudo dnf install tigervnc-server tigervnc

# debian based
sudo apt install tightvncserver

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

# armbian
sudo apt install x11vnc
x11vnc -auth /home/haidar/.Xauthority -display :0 -forever -nopw


#fedora 40
sudo dnf install libXfont pixman
sudo fc-cache -f

# firewall
# firewall-cmd --permanent --zone=public --add-port 5901/tcp
#sudo firewall-cmd --permanent --service vnc-server 
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.17" service name=vnc-server accept' --permanent
firewall-cmd  --reload

# shared vnc
sudo dnf install tigervnc
doas pkg install tigervnc-server
vncpasswd ~/.vnc/passwd
x0vncserver -display :0 -rfbauth ~/.vnc/passwd -rfbport 5903 -SecurityTypes VncAuth,TLSNone -NeverShared=0 -AlwaysShared=1

# low quality



# enable vnc service
systemctl enable vncserver@:1.service
systemctl start vncserver@:1.service
systemctl status vncserver@\:1.service


# excape fullscreen
F8

## debian based
sudo apt install tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension tigervnc-viewer


# run
vncserver -localhost no -geometry 1440x900 -depth 24

# list
vncserver -list

# kill
vncserver -kill :1

ls -l ~/.vnc 

