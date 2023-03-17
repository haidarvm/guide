-- wordpress chmod php
find . -type d -exec chmod 755 {} \;  # Change directory permissions rwxr-xr-x
find . -type f -exec chmod 640 {} \;  # Change file permissions rw-r--r--





UPDATE wpw4_users SET user_pass= MD5('l5i062RzK1OB4dC') WHERE ID = 1;


wp user update 1 --user_pass=l5i062RzK1OB4dC