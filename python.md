# python2
apt-get install python-dev libmysqlclient-dev
sudo apt install python-MySQLdb
pip install mysqlclient


# python3
python3 -m pip install 


# build
tar xvf python.tar.xz
./configure --enable-optimizations --prefix=/usr/local --with-ensurepip=install
make
sudo make altinstall

#apidaora
pip3.12 install 'uvicorn[standard]'
pip3.12 install apidaora
pip install 'uvicorn[standard]'
pip install apidaora