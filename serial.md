#read
tail -f /dev/ttyUSB0

#read serial
stty -F /dev/ttyUSB0 cs8 9600 ignbrk -brkint -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke noflsh -ixon -crtscts

#read simple
stty -F /dev/ttyUSB0 9600


#permission denied
sudo chmod 666 /dev/ttyUSB0

#write
cat testfile.txt > /dev/ttyUSB0
