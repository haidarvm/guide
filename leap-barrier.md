input-leaps --name PC-Name

~/.config/input-leap/default.conf
[server]
name = PC-Name
trusted_clients = laptop-name
listen = 0.0.0.0:5000

[client]
name = laptop-name
address = 192.168.1.100  # IP of laptop



input-leapc --name laptop-name 192.168.1.90:5000