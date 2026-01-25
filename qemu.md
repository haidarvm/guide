##install from img
wget https://cloud-images.ubuntu.com/releases/16.04/release/ubuntu-16.04-server-cloudimg-amd64-disk1.img
qemu-img convert -O qcow2 ubuntu-16.04-server-cloudimg-amd64-disk1.img ubuntu-16.04-server-cloudimg-amd64-disk1.qcow2


#resize
qemu-img resize ubuntu-16.04-server-cloudimg-amd64-disk1.qcow2 +50G

#password
virt-customize -a debian-13-genericcloud-amd64-20260112-2355.qcow2 --root-password password:YourNewPassword

#genericcloud set ip
ip addr add 192.168.122.50/24 dev enp1s0
ip route add default via 192.168.122.1
ip link set enp1s0 up


# resize fedora xfs llvm
sgdisk -e /dev/vda
growpart /dev/vda 4
sudo pvresize /dev/vda4
sudo lvextend -l +100%FREE /dev/mapper/systemVG-LVRoot -r
xfs_growfs /