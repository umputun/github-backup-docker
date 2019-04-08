# github-backup-docker [![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/umputun/github-backup/)

Dockerized version of [python-github-backup](https://github.com/josegonzalez/python-github-backup) with extra automation. This container makes a backup daily and keeps up to defined number of backups.

## Install and run

1. Generate github [access token](https://github.com/settings/tokens)
2. Get provided `docker-compose.yml`. If needed change the mapping for `volumes` and `MAX_BACKUPS` number
3. Change TZ (see the [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones))
4. Set both `GITHUB_USER` and `GITHUB_ACCESS_TOKEN` (in environment or directly in `docker-compose.yml`)
5. Run `docker-compose up -d` to initiate daily backup 

## Build

1. Clone this repo
2. run `docker-compose build`
