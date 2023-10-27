#!/bin/bash
DATE=$(date +"%Y%m%d%H%M%S") 
restic -r /home backup /home /etc --tag backup_$DATE
rsync -avz /backup/homeetc$DATE.tar.gz vagrant@hostc:/home