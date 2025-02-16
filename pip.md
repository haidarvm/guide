# install

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# downlod pip
sudo apt install python3-pip
pip3 --version

sudo pip install --upgrade youtube_dl


# compile 

./configure \
  --prefix=/usr/local/php7.4 \
  --with-config-file-path=/usr/local/etc/php7.4 \
  --with-config-file-scan-dir=/usr/local/etc/php7.4/conf.d \
  --enable-fpm \
  --enable-mysqlnd \
  --with-mysqli=mysqlnd \
  --with-pdo-mysql=mysqlnd \
  --with-mysql-sock=/tmp/mysql.sock \
  --with-curl \
  --with-openssl \
  --with-zlib \
  --with-bz2 \
  --with-iconv \
  --with-mcrypt \
  --with-mhash \
  --with-xmlrpc \
  --with-xsl \
  --with-pear \
  --with-gd \
  --with-jpeg-dir=/usr/local \
  --with-png-dir=/usr/local \
  --with-freetype-dir=/usr/local \
  --with-gettext \
  --with-readline \
  --with-libedit \
  --with-re2c
