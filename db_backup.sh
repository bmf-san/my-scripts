#!/bin/sh

# Permission
umask 077

# Save Period
period=7

# Save Dir
dirpath='/db_backup'

# Define File Name
filename=`date +%y%m%d`

# Backup
mysqldump --opt --all-databases --events --default-character-set=binary -u YOUR_USER_NAME --password=YOUR_PASSWORD | gzip > $dirpath/$filename.sql.gz

# Remove Old Backup Files
oldfile=`date --date "$period days ago" +%y%m%d`
rm -f $dirpath/$oldfile.sql.gz
