# use config file
openvpn --config client.ovpn


restorecon -R -v ~/.cert
restorecon -r -v /etc/openvpn

# start
sudo systemctl start openvpn-client@client.service
