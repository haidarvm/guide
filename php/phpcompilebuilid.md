./configure --prefix=/usr/local/lsws/lsphp85 --enable-litespeed --with-mysqli --with-zlib --enable-gd --enable-shmop --enable-sockets --enable-sysvsem --enable-sysvshm --enable-mbstring --with-iconv --with-pdo-mysql --enable-ftp --with-zip --with-curl --enable-soap --enable-xml --with-openssl --enable-bcmath --with-zstd

make -j$(nproc)
sudo make install

with brotli
dnf install brotli-devel
sudo pecl install brotli
#add
extension=brotli.so 