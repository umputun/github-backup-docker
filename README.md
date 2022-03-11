# github-backup-docker [![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/umputun/github-backup/)

Dockerized version of [python-github-backup](https://github.com/josegonzalez/python-github-backup) with extra automation. This container makes a backup daily and keeps up to defined number of backups.

## Install and run

1. Generate github [access token](https://github.com/settings/tokens). Give it a `repo` scope with full access to repositories.
2. Get provided `docker-compose.yml`. If needed change the mapping for `volumes` and `MAX_BACKUPS` number
3. Change TZ (see the [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones))
4. Set both `GITHUB_USER` and `GITHUB_ACCESS_TOKEN` (in environment or directly in `docker-compose.yml`). If you have a multiple organizations, you can list them in a `GITHUB_USER` variable separating names by a comma.
5. Run `docker-compose up -d` to initiate daily backup 

## Prepared images

- [docker hub](https://hub.docker.com/r/umputun/github-backup-docker/tags)
- [github packages](https://github.com/umputun/github-backup-docker/pkgs/container/github-backup-docker)

## Build from the source

1. Clone this repo
2. run `docker-compose build`
