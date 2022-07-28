#!/bin/sh

TIME_ZONE=${TIME_ZONE:=UTC}
echo "timezone=${TIME_ZONE}"
cp /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime
echo "${TIME_ZONE}" >/etc/timezone

echo "$(date) - start backup scheduler"
while :; do
    DATE=$(date +%Y%m%d-%H%M%S)

	if [ -z "$GITHUB_USER" ]
	  then
      echo "No Github users defined."
    else
      for u in $(echo $GITHUB_USER | tr "," "\n"); do
        echo "$(date) - execute backup for User ${u}, ${DATE}"
        github-backup ${u} --token=$TOKEN --all --output-directory=/srv/var/${DATE}/${u} --private --gists
      done
  fi

	if [ -z "$GITHUB_ORG" ]
	  then
          echo "No Github organization defined."
    else
      for o in $(echo $GITHUB_ORG | tr "," "\n"); do
        echo "$(date) - execute backup for Organization ${u}, ${DATE}"
        github-backup ${o} --organization --token=$TOKEN --all --output-directory=/srv/var/${DATE}/${o} --private --gists
      done
	fi

	if [ -z "$GITHUB_USER" ] && [ -z "$GITHUB_ORG" ]
    then
      echo "No entities (user, organization) defined. No backup performed."
    else
      echo "Backup performed."
  fi
    
    echo "$(date) - cleanup"

    ls -d1 /srv/var/* | head -n -${MAX_BACKUPS} | xargs rm -rf

    echo "$(date) - sleep for 1 day"
    sleep 1d
done
