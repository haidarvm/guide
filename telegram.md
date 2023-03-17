# use rpm fusion
# running multiple Telegram
./Telegram -many -workdir /home/fucek/Telegram/first &>/dev/null &
./Telegram -many -workdir /home/fucek/Telegram/second &>/dev/null &

# create sh
#!/bin/bash
/home/haidar/Telegram/Telegram -many -workdir /home/script/Telegram/first &>/dev/null &
/home/haidar/Telegram/Telegram -many -workdir /home/script/Telegram/second &>/dev/null &

# create t1.desktop
Actions=SecondAccount;

[Desktop Action FirstAccount]
Name=Telegram first
Exec=/home/haidar/Telegram/Telegram -many -workdir /home/script/Telegram/first


[Desktop Action SecondAccount]
Name=Telegram first
Exec=/home/haidar/Telegram/Telegram -many -workdir /home/script/Telegram/second