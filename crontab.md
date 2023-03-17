# running every 2 hours
0 */2 * * * sh /home/haidar/scripts/mysql-backup-all.sh > /var/log/mysql-backup.log 2>&1