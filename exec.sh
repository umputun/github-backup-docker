#!/bin/sh

echo "$(date) - start backup scheduler"
while :; do
    DATE=$(date +%Y%m%d)
    echo "$(date) - execute backup for ${DATE}"
    github-backup ${GITHUB_USER} --token=$TOKEN --all --output-directory=/srv/var/${DATE} --private

    echo "$(date) - cleanup"
    find /srv/var/ -mtime +${MAX_BACKUPS} -exec rm -fv {} \;
    find /srv/var/ -type d -exec rmdir {} \;

    echo "$(date) - sleep for 1 day"
    sleep 1d
done
