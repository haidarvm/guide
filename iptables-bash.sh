# select user
#!/usr/bin/env bash

read -p "Enter Your new IP:: "  new_ip
iptables -A INPUT -i enp0s3 -p tcp --dport 22 --source $new_ip -j ACCEPT
iptables -A INPUT -s $new_ip/32 -p tcp -m tcp --dport 5999 -j ACCEPT
iptables -A INPUT -s $new_ip/32 -p tcp -m tcp --dport 1521 -j ACCEPT
iptables -A INPUT -s $new_ip/32 -p tcp -m tcp --dport 7080 -j ACCEPT
iptables -A INPUT -s $new_ip/32 -p tcp -m tcp --dport 8088 -j ACCEPT
