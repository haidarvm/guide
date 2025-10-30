# server
QT_QPA_PLATFORM=wayland deskflow

 /usr/bin/deskflow-server -f --debug INFO --name haidarhostname --enable-crypto --address :24800 -c /home/haidar/.config/Deskflow/deskflow-server.conf --tls-cert /home/haidar/.config/Deskflow/tls/deskflow.pem

 QT_QPA_PLATFORM=wayland /usr/bin/deskflow -f --debug INFO --name haidarhostname --enable-crypto --address :24800 -c /home/haidar/.config/Deskflow/deskflow-server.conf --tls-cert /home/haidar/.config/Deskflow/tls/deskflow.pem
 
 QT_QPA_PLATFORM=wayland deskflow
  QT_QPA_PLATFORM=wayland  /usr/bin/deskflow -f --debug INFO --name haidarhostname --enable-crypto --address :24800 -c /home/haidar/.config/Deskflow/deskflow-server.conf --tls-cert /home/haidar/.config/Deskflow/tls/deskflow.pem
 
# deskflow client
deskflow-client -f --debug INFO --name haidarhostnamelaptop --enable-crypto --sync-language 192.168.1.28:24800
