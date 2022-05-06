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
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
reboot
docker pull mysql:latest

# snap install
sudo snap install winbox
snap find browser
snap list


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
