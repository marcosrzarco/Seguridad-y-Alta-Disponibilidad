#!/bin/bash
backup_destination="vagrant@hostb:/home"
backup_filename="backup-$(date +\%Y\%m\%d).tar.gz"
tar -czf "$backup_filename" /home /etc
rsync -avz "$backup_filename" "$backup_destination"