##install from img
wget https://cloud-images.ubuntu.com/releases/16.04/release/ubuntu-16.04-server-cloudimg-amd64-disk1.img
qemu-img convert -O qcow2 ubuntu-16.04-server-cloudimg-amd64-disk1.img ubuntu-16.04-server-cloudimg-amd64-disk1.qcow2


#resize
qemu-img resize ubuntu-16.04-server-cloudimg-amd64-disk1.qcow2 +50G