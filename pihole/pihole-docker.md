# install via docker
git clone https://github.com/pi-hole/docker-pi-hole.git

cp docker-compose.yml.example docker-compose.yml.

# add port 5300 on .yml
# https://github.com/pi-hole/docker-pi-hole/blob/master/README.md

services:
  pihole:
    container_name: pihole
    image: pihole/pihole:latest
    # For DHCP it is recommended to remove these ports and instead add: network_mode: "host"
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "67:67/udp"
      - "80:80/tcp"
      - "5300:5300/tcp"
    environment:
      TZ: 'America/Chicago'
      # WEBPASSWORD: 'set a secure password here or it will be random'
    # Volumes store your data between container upgrades
    volumes:
      - './etc-pihole:/etc/pihole'
      - './etc-dnsmasq.d:/etc/dnsmasq.d'
    #   https://github.com/pi-hole/docker-pi-hole#note-on-capabilities
    cap_add:
      - NET_ADMIN
    restart: unless-stopped # Recommended but not required (DHCP needs NET_ADMIN) 

# run docker
docker-compose up -d

# go to docker pihole bash
docker exec -it pi-hole bash

# install dnscrypt-proxy set auto start
sudo apt install dnscrypt-proxy

# set port to 5300 example in dnscrcypt-proxy.toml
listen_addresses = ['127.0.0.1:5300']

# set few server only on dnscrypt-proxy.toml
server_names = ['dnswarden-asia-uncensor-dcv4', 'saldnssg01-conoha-ipv4','quad9-dnscrypt-ip4-filter-pri','sgp-dn53']


# sudo pihole change pass