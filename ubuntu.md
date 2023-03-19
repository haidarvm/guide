# install latest ubuntu server
https://mirror.repository.id/ubuntu-cd/18.04.6/ubuntu-18.04.6-live-server-amd64.iso
https://mirror.repository.id/ubuntu-cd/jammy/ubuntu-22.04-beta-live-server-amd64.iso

#rename mirror ubuntu apt source list
sudo sed -i 's|http://us.archive.ubuntu.com|http://download.nus.edu.sg|g' /etc/apt/sources.list

sudo sed -i 's|https://mirror.amscloud.co.id|http://archive.ubuntu.com|g' /etc/apt/sources.list.d/original.list

sudo sed -i 's|http://archive.ubuntu.com|https://mirror.amscloud.co.id|g' /etc/apt/sources.list.d/original.list

sudo sed -i 's|http://mirrors.tuna.tsinghua.edu.cn|http://archive.ubuntu.com|g' /etc/apt/sources.list

sudo sed -i 's|http://mirror.0x.sg|http://mirrors.tuna.tsinghua.edu.cn|g' /etc/apt/sources.list

sudo sed -i 's|http://deb.debian.org|http://mirror.dewabiz.com|g' /etc/apt/sources.list

sudo sed -i 's|http://archive.ubuntu.com|http://mirrors.tuna.tsinghua.edu.cn|g' /etc/apt/sources.list


sudo sed -i 's|http://mirrors.tuna.tsinghua.edu.cn|http://ports.ubuntu.com/|g' /etc/apt/sources.list
sudo sed -i 's|http://ports.ubuntu.com/|http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports|g' /etc/apt/sources.list

# extras
sudo apt-get install ubuntu-restricted-extras

# locale
sudo locale-gen en_US
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales
sudo update-locale LANG=en_US.UTF-8

# install php8.1
sudo apt install php8.1-fpm php8.1-cli php8.1-mysql  php8.1-gd php8.1-mbstring php8.1-xml php8.1-curl php8.1-zip php8.1-fpm php8.1-readline

# default php
sudo apt install php7.4-fpm php7.4-cli php7.4-mysql  php7.4-gd php7.4-mbstring php7.4-xml php7.4-curl php7.4-zip php7.4-fpm php7.4-readline


# install mariadb
sudo apt-get install software-properties-common
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.biznetgio.com/mariadb/repo/10.5/ubuntu focal main'

sudo apt install mariadb-server
sudo systemctl restart mariadb.service 
sudo mysql_secure_installation

# change keyboard layout
sudo dpkg-reconfigure keyboard-configuration

# checksum download
echo "25d483341ccd0d522a6660b00db933787c86c47b42f1845bcf997127f4b61e9d ubuntu-19.04-live-server-amd64.iso" | shasum -a 256 --check

# broken sound
rm -r ~/.config/pulse; pulseaudio -k

# remove ppa
sudo add-apt-repository --remove ppa:mozillateam/ppa

# upgrade grub2

# add user to nginx www-data
sudo usermod -aG www-data yourUserName
sudo gpasswd -a www-data haidar

#install docker
sudo apt install docker.io
sudo apt install docker-compose
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
reboot
docker pull mysql:latest

# remove firefox snap
sudo snap remove firefox

# install firefox official
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update
sudo apt install firefox

# install firefox from source
wget -O ~/Firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64"
sudo tar xjf ~/Firefox.tar.bz2 -C /opt/
sudo mv /usr/lib/firefox/firefox /usr/lib/firefox/firefox_backup
sudo ln -s /opt/firefox/firefox /usr/lib/firefox/firefox

# install lxde ubuntu server
sudo apt update
sudo apt install lxde

# make new swap file
touch /media/swapfile.img
dd if=/dev/zero of=/media/fasthdd/swapfile.img bs=1024 count=4M
mkswap /media/swapfile.img
# Add this line to /etc/fstab
/media/swapfile.img swap swap sw 0 0
swapon /media/swapfile.img
cat /proc/swaps
grep 'Swap' /proc/meminfo

# resize swap one command
size="4G" && file_swap=/swapfile_$size.img && sudo touch $file_swap && sudo fallocate -l $size /$file_swap && sudo mkswap /$file_swap && sudo swapon -p 20 /$file_swap


# nginx 
# ubuntu php
# pass PHP scripts to FastCGI server
#
location ~ \.php$ {
		include snippets/fastcgi-php.conf;
#
#       # With php-fpm (or other unix sockets):
		fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
#       # With php-cgi (or other tcp sockets):
#       fastcgi_pass 127.0.0.1:9000;
}




# install with php8.1 odrej
sudo apt-get install ca-certificates apt-transport-https software-properties-common wget curl lsb-release -y
curl -sSL https://packages.sury.org/php/README.txt | sudo bash -x
sudo apt update

# remove apt 
sudo add-apt-repository --remove ppa:

# sudo no pass
sudo visudo

%YOUR_USERNAME_HERE ALL=(ALL) NOPASSWD: ALL

# nginx php-fpm config
index index.php index.html;
location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/run/php/php7.4-fpm.sock;
}


## ubuntu bionic install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
