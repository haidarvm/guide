# set auth token
/Users/XXXXX/.emulator_console_auth_token 
telnet localhost 5554
auth <auth_token>

# set fake gps
telnet localhost 5554

geo fix long lat    
geo fix 107.690169 -6.931892 
geo fix -121.45356, 46.51119 4392

./adb -s #{device_name} emu geo fix #{longitude} #{latitude}


# install apk from source 
# simply drag and drop or
adb install /home/haidar/Downloads/haidar.apk
