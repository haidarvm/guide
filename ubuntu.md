# extras
sudo apt-get install ubuntu-restricted-extras

# install php
sudo apt install php-fpm php-cli php-pgsql php-mysql php-json php-gd php-mbstring php-xml php-curl php-zip php-fpm php-readline

# install mariadb
sudo apt-get install software-properties-common
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.biznetgio.com/mariadb/repo/10.5/ubuntu focal main'

sudo apt install mariadb-server
sudo systemctl restart mariadb.service 
sudo mysql_secure_installation


# checksum download
echo "25d483341ccd0d522a6660b00db933787c86c47b42f1845bcf997127f4b61e9d *ubuntu-19.04-live-server-amd64.iso" | shasum -a 256 --check

**done
# broken sound
rm -r ~/.config/pulse; pulseaudio -k

# remove ppa
sudo add-apt-repository --remove ppa:mozillateam/ppa

# upgrade grub2


# install with php odrej

