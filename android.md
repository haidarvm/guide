# add adb location on .bashrc 
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

source .bashrc

# list package with adb shell
pm list packages -s | grep xiaomi

# remove apps
pm uninstall -k --user 0 com.xiaomi.mipicks
pm uninstall -k --user 0 com.google.android.apps.doc

# set auth token
cat ~/.emulator_console_auth_token 
telnet localhost 5554
auth <auth_token>

# set fake gps
telnet localhost 5554

geo fix long lat    
geo fix 107.59629983899048 -6.947333791711412
geo fix -121.45356, 46.51119 4392

adb -s #{device_name} emu geo fix #{longitude} #{latitude}

# install apk from source 
# simply drag and drop or
adb install /home/haidar/Downloads/haidar.apk


# check curret Acitivity
adb shell dumpsys activity top


-6.947333791711412, 107.59629983899048


# list avd
emulator -list-avds

# run from terminal
/home/{username}/Android/sdk/emulator
./emulator -list-avds
./emulator @avdName

# or
emulator -avd @name-of-your-emulator



