# github-backup-docker [![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/umputun/github-backup/)

Dockerized version of [python-github-backup](https://github.com/josegonzalez/python-github-backup) with extra automation. This container makes a backup daily and keeps up to defined number of backups.

## Install and run

1. Get provided `docker-compose.yml`. If needed change the mapping for `volumes` and `MAX_BACKUPS` number
2. Set both `GITHUB_USER` and `GITHUB_ACCESS_TOKEN` (in environment or directly in `docker-compose.yml`)
3. Run `docker-compose up -d` to initiate daily backup 

## Build

1. Clone this repo
2. run `docker-compose build`
