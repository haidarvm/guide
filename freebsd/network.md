

# buy usb wifi
https://www.tokopedia.com/aquarius-id/tp-link-tp-link-tl-wn725n-nano-usb-wireless-network-adapter-150mbps?extParam=fcity%3D165%26ivf%3Dfalse%26keyword%3Dtp+link+wn725n%26search_id%3D202407010230560C4304C997EBD824EK62%26src%3Dsearch%26whid%3D15596748


# ntpd
doas service ntpd restart
doas ntpdate -v -b in.pool.ntp.org

# connect wifi
wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf 


# check if support hostap
doas usbconfig | grep rtl
ifconfig wlan0 list caps

# create hotspot hostap 
ifconfig wlan1 create wlandev rtwn0 wlanmode hostap
doas service hostapd start

# run hostap
ifconfig rtlwn0 list caps
ifconfig wlan0 list caps
ifconfig wlan1 down
ifconfig wlan1 destroy
ifconfig wlan1 create wlandev rtwn0 wlanmode hostap
ifconfig wlan1 inet 192.168.8.1/24
ifconfig wlan1 inet 192.168.8.1/24 ssid bismillah up

# /usr/local/etc/dnsmasq.conf :
interface=wlan1
dhcp-range=192.168.8.10,192.168.8.100,12h
dhcp-option=3,192.168.8.1
dhcp-option=6,8.8.8.8,1.1.1.1

# /etc/rc.conf
pf enable