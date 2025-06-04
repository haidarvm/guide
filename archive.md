#tar.gz
tar -xvzf community_images.tar.gz


#is faster than, tar -xf file.tar
dd bs=4M conv=fsync if=file.tar | tar -xf -

# 
dd command is for taking input faster, pipe "|" is for giving that input to tar, tar -xf is telling it to extract data,  "-" is to tell input is from stdin


#zip
zip archive.zip archive.sql

zip -r archivefile3.zip /home/joe/papers

zip -r compressed_filename.zip foldername foldername2 foldername3

#zip no compress
zip -0 -r mydir.zip mydir

#compress to gz (z)                          
tar -cf archive.tar file1 file2 file3
tar -cvzf tarballname.tar.gz itemtocompress
tar -cvzf pcimahpindai.tar.gz pcimah

#no compress
tar -cvf myfolder.tar myfolder

#extract tar
tar -xf archive.tar -C /target/directory

# compress exclude
zip -r myarchive.zip dir1 -x dir1/ignoreDir1/**\* dir1/ignoreDir2/**\*

#atau di bash nya arahin ke root dulu
cd /root

cd /home/haidar/Documents/
sudo tar -zcvpf rootall.tar.gz  /root

tar -C /root/ -cvf rootall2.tar selecteddir

tar -C /root -cvf rootall.tar.gz .

tar -xvzf rootall.tar.gz  --strip-components=1

tar -C /home/haidar/Documents/ -cvf rootall.tar.gz .

#gz
gunzip -k file.gz

#tar.bz2
tar xjvf archive.tar.bz2

#extract rar
unrar x files.rar

#extract tar
tar -xvf yourfile.tar
tar -C /myfolder -xvf yourfile.tar

#extrac bz2
bzip2 -d your-filename-here.bz2

#extract to 
tar -xf /home/haidar/Documents/distFG.tar -C /root/

#backup 

#decompress
7z e archive.zip

#uncompres tar.xz
tar -xvf backup.tar.xz


# unzip to path
unzip file.zip -d /path/to/destination


#Part zip
zip -r -s 4G folder.zip folder.zip 

zip -s 0 folder.zip --out unsplitfolder05jun.zip

unzip unsplitberitains05jun.zip

#to iso
dd if=/dev/sr0 of=TellMeMoreDu.iso

tar - Tape ARchiver
And the options:
x - extract
v - verbose output (lists all files as they are extracted)
j - deal with bzipped file
f - read from a file, rather than a tape device

"tar --help" will give you more options and info


https://play.google.com/store/apps/details?id=com.lufandev.fespcurvecalculator
