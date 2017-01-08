#!/bin/bash

# Backup
/usr/sbin/mondoarchive -Oi -L -N -s 5000m -d /os_backup -E /os_backup -p `hostname`-`date +%Y-%m-%d`

# Delete old iso image
/usr/sbin/tmpwatch -m 48 /os_backup
