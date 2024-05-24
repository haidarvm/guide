# python2
apt-get install python-dev libmysqlclient-dev
sudo apt install python-MySQLdb
pip install mysqlclient


# python3
python3 -m pip install 
pip install -U setuptools

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

alias uv='uvicorn --workers 4 --log-level'
uvicorn da:app --workers 4 --log-level critical
uvicorn --workers 4 --log-level critical dao:app 

wrk -t12 -c400 -d10s http://localhost:8088
