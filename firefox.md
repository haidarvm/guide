# disable https redirect

The solution that worked for me:

    Go to about:config
    Look for network.stricttransportsecurity.preloadlist and set it to false
    Enjoy

If the above STILL DOES NOT WORK, try setting browser.fixup.fallback-to-https to false from about:config



# change tab
Ctrl + Tab
Ctrl + Shift + Tab

# close tab
Ctrl + W

# close windows
Ctrl + Shift W

# new window
Ctrl + W

# new Private Window
Ctrl + Shift + P


# repair woe usb
sudo touch /etc/ld.so.conf.d/gtk3.conf
echo '/usr/lib64/gtk-3.0/modules' | sudo tee /etc/ld.so.conf.d/gtk3.conf
sudo ldconfig