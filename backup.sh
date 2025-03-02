#!/bin/bash

# "set -e" causes the script to exit immediately if a command fails.
# "set -u" treats unset variables as an error and exits immediately.
set -eu


# Optionally, you can trap errors to provide a custom message or do cleanup
trap 'echo "ERROR: Script failed at line $LINENO. Exiting."; exit 1' ERR


SOURCE_DIR="/path/to/source/folder"
BACKUP_DIR="/path/to/backup/folder"
DATE=$(date +%Y-%m-%d)
TAR_FILE="backup-$DATE.tar.gz"


mkdir -p "$BACKUP_DIR"


# Create the archive and place it in BACKUP_DIR
tar -czvf "$BACKUP_DIR/$TAR_FILE" -C "$SOURCE_DIR" .


# Overwrite a "latest" backup file if you want
cp -f "$BACKUP_DIR/$TAR_FILE" "$BACKUP_DIR/backup-latest.tar.gz"


echo "Backup completed successfully on $DATE!"
