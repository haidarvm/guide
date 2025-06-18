#!/bin/sh

set -e

# Variables
CONF_DIR="/usr/local/etc/openvpn"
EASYRSA_DIR="/usr/local/share/easy-rsa"
SERVER_CN="server"
CLIENT_CN="client"
VPN_SUBNET="10.8.0.0"
VPN_MASK="255.255.255.0"

# Install OpenVPN and EasyRSA
pkg install -y openvpn easy-rsa

# Setup EasyRSA
mkdir -p /usr/local/etc/easy-rsa
cp -R ${EASYRSA_DIR}/* /usr/local/etc/easy-rsa
cd /usr/local/etc/easy-rsa

./easyrsa init-pki
echo | ./easyrsa build-ca nopass
./easyrsa gen-dh
./easyrsa gen-req $SERVER_CN nopass
./easyrsa sign-req server $SERVER_CN
./easyrsa gen-req $CLIENT_CN nopass
./easyrsa sign-req client $CLIENT_CN

# Copy certs and keys
mkdir -p ${CONF_DIR}/keys
cp pki/ca.crt pki/dh.pem pki/issued/${SERVER_CN}.crt pki/private/${SERVER_CN}.key ${CONF_DIR}/keys

# Generate server.conf
cat > ${CONF_DIR}/server.conf <<EOF
port 1194
proto udp
dev tun
ca keys/ca.crt
cert keys/${SERVER_CN}.crt
key keys/${SERVER_CN}.key
dh keys/dh.pem
server ${VPN_SUBNET} ${VPN_MASK}
persist-key
persist-tun
keepalive 10 120
topology subnet
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 1.1.1.1"
user nobody
group nobody
status openvpn-status.log
log-append /var/log/openvpn.log
verb 3
EOF

# Enable OpenVPN
sysrc openvpn_enable=YES
sysrc openvpn_if="tun"

# Start service
service openvpn start

echo
echo "✅ OpenVPN server installed and running!"
echo "Client files are in: /usr/local/etc/easy-rsa/pki"
