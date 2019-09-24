#sync && echo 3 > /proc/sys/vm/drop_caches && free -m

sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches' && free -m
