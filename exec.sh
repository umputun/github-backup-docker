#!/bin/sh

TIME_ZONE=${TIME_ZONE:="UTC"}
ARGS=${ARGS:="--repositories --private --gists"}
SLEEP=${SLEEP:="1d"}
echo "args=${ARGS}"
echo "timezone=${TIME_ZONE}"
echo "sleep=${SLEEP}"
cp /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime
echo "${TIME_ZONE}" >/etc/timezone

echo "$(date) - start backup scheduler"
while :; do
    DATE=$(date +%Y%m%d-%H%M%S)

    for u in $(echo $GITHUB_USER | tr "," "\n"); do
        echo "$(date) - execute backup for ${u}, ${DATE}"
        github-backup ${u} --token=$TOKEN --output-directory=/srv/var/${u} ${ARGS}
    done

    echo "$(date) - sleep for ${SLEEP}"
    sleep "${SLEEP}"
done
