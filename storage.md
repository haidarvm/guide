# check last 10 most usage
sudo du -hsx * | sort -rh | head -10

du -hsx * | sort -rh | head -10

sudo du -ah . | sort -n -r | head -n 20
sudo du -cksh * | sort -rn | head -n 20

#count total size folder
du -sh .

# check nvme version
lshw -class disk  
hwinfo --disk

#get hdd info
sudo cfdisk /dev/sdb

sudo parted -l


lsblk 

#fedora 
sudo dd if=/path/to/fedora.iso of=/dev/sdX bs=4M status=progress && sync

# dd if of
sudo dd if=Clover-5159-X64.iso of=/dev/sda bs=1M status=progress

sudo dd if=FreeBSD-13.1-RELEASE-amd64-memstick.img of=/dev/da0 bs=1M conv=sync

#rsync backup everything
rsync -avxHAX --progress / /new-disk/
rsync -avxHAX --progress / /new-disk/

# mount iso



#rsync
rsync -avzh /root/rpmpkgs /tmp/backups/
rsync -avzh 'Kali Linux amd64 1' /media/haidar/kali
rsync -avzh '/media/haidar/Lubuntu 18.04.5 LTS i386' /media/haidar/lubuntu
rsync -avzh '/home/haidar/Documents/backup/iso/ubuntu-20.04.1-live-server-amd64.iso' /media/haidar/livehaidar
rsync -avzh '/media/haidar/GParted-live/' /media/haidar/gparted

#woeusb
woeusb

sudo woeusb --tgt-fs NTFS -d /home/haidar/Documents/backup/iso/Win10_20H2_EnglishInternational_x64.iso /dev/sdc

# hdd health check
sudo smartctl -a /dev/sda | less

# check bad block 
sudo badblocks -v /dev/sda -s

# move multiple folder
mv -t DESTINATION file1 file2 file3



# auto mount fstab
UUID=aaa9aa3a-79d4-4d5d-aaf0-374de39b74d3 /media/haidar/fedora_localhost-live btrfs defaults  0  1
UUID=aa88ba34-bdb5-4eda-a973-401d68c5547d /media/other         xfs     defaults        1 2

# check before restart
mount -a
mount -fav

# check health speed
sudo hdparm -t /dev/sda

# mount readonly sdcard
hdparm -r0 /dev/sda

mount -orw,remount /dev/sda1
sudo mount -o rw /dev/sda1 /media/sandiskmicro

# remove entry boot uefi
sudo dnf install efibootmgr
sudo modprobe efivars
sudo efibootmgr
sudo efibootmgr -b 1 -B

# copy sdcard
sudo fdisk -l
sudo umount /dev/mmcblk0 || /dev/sda1
sudo dd if= of=~/sd-card-copy.img bs=1M status=progress
sudo dd if=/dev/sdb of=~/Downloads/haidar.img bs=1m status=progress
# insert new one
sudo fdisk -l
sudo umount /dev/mmcblk0
# to write
sudo dd if=~/sd-card-copy.img of=/dev/mmcblk0 bs=1M status=progress
