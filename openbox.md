# keyboard snap
<keyboard>
   <keybind key="W-space">
      <action name="Execute">
        <command>rofi -show run </command>
      </action>
  </keybind>
  <keybind key="W-Left">
    <action name="Unmaximize" />
    <action name="MoveResizeTo">
      <x>0</x>
      <y>0</y>
      <width>50%</width>
      <height>100%</height>
    </action>
  </keybind>

  <keybind key="W-Right">
    <action name="Unmaximize" />
    <action name="MoveResizeTo">
      <x>-0</x>
      <y>0</y>
      <width>50%</width>
      <height>100%</height>
    </action>
  </keybind>

  <keybind key="W-Up">
    <action name="Unmaximize" />
    <action name="MoveResizeTo">
      <x>0</x>
      <y>0</y>
      <width>100%</width>
      <height>50%</height>
    </action>
  </keybind>

  <keybind key="W-Down">
    <action name="Unmaximize" />
    <action name="MoveResizeTo">
      <x>0</x>
      <y>-0</y>
      <width>100%</width>
      <height>50%</height>
    </action>
  </keybind>
</keyboard>



# Set wallpaper
vi ~/.config/openbox/autostart
#(sleep 1s && nitrogen --restore) &
(sleep 1s && sh ~/.fehbg) &

xrandr --size 1366x768 &

# A panel for good times
tint2 &
