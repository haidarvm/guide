sudo du -hsx * | sort -rh | head -10

#count total size folder
du -sh .

#get hdd info
sudo cfdisk /dev/sdb

sudo parted -l

#woeusb
woeusb

sudo woeusb --tgt-fs NTFS -d /home/haidar/Documents/backup/iso/Win10_20H2_EnglishInternational_x64.iso /dev/sdc

# hdd health check

# move multiple folder
mv -t DESTINATION file1 file2 file3


# auto mount fstab
UUID=aaa9aa3a-79d4-4d5d-aaf0-374de39b74d3 /media/haidar/fedora_localhost-live btrfs defaults  0  1
UUID=aa88ba34-bdb5-4eda-a973-401d68c5547d /media/other         xfs     defaults        1 2

# check before restart
mount -a
mount -fav


# mount readonly sdcard
hdparm -r0 /dev/sda

mount -orw,remount /dev/sda1
sudo mount -o rw /dev/sda1 /media/sandiskmicro