FROM alpine:3.9

RUN apk add --update --no-cache tzdata git python py-pip tzdata
RUN pip install github-backup && github-backup -v
COPY exec.sh /srv/exec.sh
RUN chmod +x /srv/exec.sh
CMD ["/srv/exec.sh"]
