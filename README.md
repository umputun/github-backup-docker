# github-backup-docker [![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/umputun/github-backup/)

Dockerized version of [python-github-backup](https://github.com/josegonzalez/python-github-backup) with extra automation. This container makes a backup daily and keeps up to defined number of backups.

## Install and run

1. Generate github [access token](https://github.com/settings/tokens). Give it a `repo` scope with full access to repositories.
2. Get provided `docker-compose.yml`. If needed change the mapping for `volumes` and `MAX_BACKUPS` number
3. Change TZ (see the [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones))
4. Set `TOKEN` (in environment or directly in `docker-compose.yml`)
5. Set `GITHUB_USER` (Github user accounts) and/or `GITHUB_ORG` (Github Organizations; make sure the user token has access to the organization). If you have multiple users/organizations, you can list thme separating names by a comma.
6. Run `docker-compose up -d` to initiate daily backup 

## Customize Backup Options

The underlying [python-github-backup](https://github.com/josegonzalez/python-github-backup) library [has a lot of options](https://github.com/josegonzalez/python-github-backup#usage) to customize what is backed up from github. 

We can customize this by using the `BACKUP_OPTIONS` environment variable. By default, the container will backup everything and uses `--private --all --gist`. That will backup the repositories, issues, pull requests, labels, etc.

If you wanted to customize this to only backup the repository code (including private repositories), you could define the following on your `docker-compose.yml` file's environment:

```
BACKUP_OPTIONS=--private --repositories
```

## Prepared images

- [docker hub](https://hub.docker.com/r/umputun/github-backup-docker/tags)
- [github packages](https://github.com/umputun/github-backup-docker/pkgs/container/github-backup-docker)

## Build from the source

1. Clone this repo
2. run `docker-compose build`
