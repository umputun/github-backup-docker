#!/bin/sh

echo "$(date) - start backup scheduler"
while :; do
    DATE=$(date +%Y%m%d-%H%M%S)
    echo "$(date) - execute backup for ${DATE}"
    github-backup ${GITHUB_USER} --token=$TOKEN --all --output-directory=/srv/var/${DATE} --private

    echo "$(date) - cleanup"
    find /srv/var/ -mtime +${MAX_BACKUPS} -exec rm -fv {} \; 2>/dev/null
    find /srv/var/ -type d -exec rmdir {} \; 2>/dev/null

    echo "$(date) - sleep for 1 day"
    sleep 1d
done
