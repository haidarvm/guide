# change password
sudo dnf install libguestfs-tools guestfs-tools
virt-customize -a bionic-server-cloudimg-amd64.img --root-password password:<pass>
