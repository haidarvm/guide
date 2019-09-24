# remove ppa
sudo add-apt-repository --remove ppa:whatever/ppa


# add mirror auto
deb mirror://mirrors.ubuntu.com/mirrors.txt vivid main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt vivid-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt vivid-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt vivid-security main restricted universe multiverse


# permit ssh root login
# nano /etc/ssh/sshd_config
PermitRootLogin yes

#detach 
udisks --unmount /dev/sdb1 && udisks --detach /dev/sdb

# completion bash
nano /etc/bash.bashrc
