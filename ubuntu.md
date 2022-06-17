# install latest ubuntu server
https://mirror.repository.id/ubuntu-cd/18.04.6/ubuntu-18.04.6-live-server-amd64.iso
https://mirror.repository.id/ubuntu-cd/jammy/ubuntu-22.04-beta-live-server-amd64.iso


# extras
sudo apt-get install ubuntu-restricted-extras

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
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

* ## install firefox
sudo apt install firefox

# install lxde ubuntu server
sudo apt update
sudo apt install lxde

# resize swap
size="4G" && file_swap=/swapfile_$size.img && sudo touch $file_swap && sudo fallocate -l $size /$file_swap && sudo mkswap /$file_swap && sudo swapon -p 20 /$file_swap



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
