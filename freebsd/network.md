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

# run hostap manually
ifconfig rtlwn0 list caps
ifconfig wlan1 list caps
ifconfig wlan1 down
ifconfig wlan1 destroy
ifconfig wlan1 create wlandev rtwn0 wlanmode hostap
ifconfig wlan1 inet 192.168.8.1/24
ifconfig wlan1 inet 192.168.8.1/24 ssid bismillah up

# run hostap
d hostapd -dd /usr/local/etc/hostapd.conf

# install hostapd
pkg install hostapd

# run hostap rtwn0 auto /etc/rc.conf
wlans_rtwn0="wlan1"
create_args_wlan1="wlanmode hostap"
ifconfig_wlan1="inet 192.168.8.1 netmask 255.255.255.0"
hostapd_enable="YES"
gateway_enable="YES"
dnsmasq_enable="YES"

# create hotspot conf /etc/hostapd.conf
interface=wlan1
ssid=FreeBSDhaiDarAP
auth_algs=1
wpa=2
wpa_passphrase=bismillah234
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP
ctrl_interface=/var/run/hostapd
ctrl_interface_group=wheel

# /usr/local/etc/dnsmasq.conf :
interface=wlan1
dhcp-range=192.168.8.10,192.168.8.100,12h
dhcp-option=3,192.168.8.1
dhcp-option=6,8.8.8.8,1.1.1.1


# /etc/pf.conf
ext_if="re0"        # your internet-facing interface
int_if="wlan1"      # your Wi-Fi AP
set skip on lo      # don't filter loopback
nat on $ext_if from $int_if:network to any -> ($ext_if)
pass in on $int_if from $int_if:network to any
pass out all keep state

