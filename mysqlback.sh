#!/bin/bash
#----------------------------------------
# OPTIONS
# 0 */6  * * * sh /home/haidarvm/script/mysqlback.sh > /var/log/db-backup.log 1>&1
# @daily sh /scripts/mysql-backup.sh >> /var/log/mysql-backup.log 2>&1
#----------------------------------------
USER='root'       # MySQL User
PASSWORD='Bismillah' # MySQL Password
DAYS_TO_KEEP=30    # 0 to keep forever
GZIP=1            # 1 = Compress
BACKUP_PATH='/home/haidarvm/backup/mysql'
#----------------------------------------

# Create the backup folder
if [ ! -d $BACKUP_PATH ]; then
  mkdir -p $BACKUP_PATH
fi

# Get list of database names
databases=`mariadb -u $USER -p$PASSWORD -e "SHOW DATABASES;" | tr -d "|" | grep -v Database`

for db in $databases; do

  if [ $db == 'information_schema' ] || [ $db == 'performance_schema' ] || [ $db == 'mysql' ] || [ $db == 'sys' ]; then
    echo "Skipping database: $db"
    continue
  fi
  
  date=$(date +"%d-%m-%y_%H-%M")
  if [ "$GZIP" -eq 0 ] ; then
    echo "Backing up database: $db without compression"      
    mariadb-dump -u $USER -p$PASSWORD --databases $db > $BACKUP_PATH/$date-$db.sql
  else
    echo "Backing up database: $db with compression"
    mariadb-dump -u $USER -p$PASSWORD --databases $db | gzip -c > $BACKUP_PATH/$date-$db.gz
  fi
done

# Delete old backups
if [ "$DAYS_TO_KEEP" -gt 0 ] ; then
  echo "Deleting backups older than $DAYS_TO_KEEP days"
  find $BACKUP_PATH/* -mtime +$DAYS_TO_KEEP -exec rm {} \;
fi

systemctl restart mariadb
