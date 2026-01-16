#!/bin/bash
# Kill any existing conky processes to avoid duplicates
killall conky
# Wait 15 seconds for Fedora's desktop to load
sleep 15
# Start conky with your specific config
conky -p 10 -c "~/guide/conky.conf"
exit
