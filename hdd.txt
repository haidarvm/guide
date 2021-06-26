sudo du -hsx * | sort -rh | head -10

#count total size folder
du -sh bench

#get hdd info
sudo cfdisk /dev/sdb

sudo parted -l

#woeusb
woeusb

sudo woeusb --tgt-fs NTFS -d /home/haidar/Documents/backup/iso/Win10_20H2_EnglishInternational_x64.iso /dev/sdc

# hdd health check
