#!/bin/bash
#BismillAh
cd /var/www/html/guide
/usr/bin/git add -A 
/usr/bin/git commit -am "Daily update"
/usr/bin/git push 

#*/25 * * * *  XDG_RUNTIME_DIR=/run/user/$(id -u) /var/www/html/guide/autoCommitPush.sh
