# install flatpak
sudo dnf install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
killall gnome-software
rm -rf ~/.cache/gnome-software


flatpak list

flatpak run

flatpak run org.inkscape.Inkscape

flatpak search gimp

flatpak install flathub org.gimp.GIMP 

flatpak uninstall 

flatpak update

# check version