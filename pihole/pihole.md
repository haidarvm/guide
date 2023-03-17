cd /etc/rc3.d
ln -s ../init.d/dnscrypt-proxy S50dnscrypt-proxy
/etc/init.d/dnscrypt-proxy stop                         
/etc/init.d/dnscrypt-proxy start