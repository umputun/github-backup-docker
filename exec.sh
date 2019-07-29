#!/bin/sh

TIME_ZONE=${TIME_ZONE:=UTC}
echo "timezone=${TIME_ZONE}"
cp /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime
echo "${TIME_ZONE}" >/etc/timezone

echo "$(date) - start backup scheduler"
while :; do
    DATE=$(date +%Y%m%d-%H%M%S)

    for u in $(echo $GITHUB_USER | tr "," "\n"); do
        echo "$(date) - execute backup for ${u}, ${DATE}"
        github-backup ${u} --token=$TOKEN --all --output-directory=/srv/var/${DATE}/${u} --private --gists
    done

    echo "$(date) - cleanup"

    HEAD_COUNT=$(($(ls -d /srv/var/*/ | wc -l) - ${MAX_BACKUPS}));
    rm -rf $(ls -d /srv/var/*/ | head -n $HEAD_COUNT);

    echo "$(date) - sleep for 1 day"
    sleep 1d
done
