# config
armbian-config

# change IP armbian /etc/network/interface
allow-hotplug eth0
auto eth0
iface eth0 inet static
        address 192.168.1.76
        gateway 192.168.1.1
        
# restart
sudo systemctl restart networking