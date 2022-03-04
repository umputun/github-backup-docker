FROM alpine:3.15

RUN apk add --update --no-cache tzdata git python3 py-pip tzdata
RUN pip3 install github-backup && github-backup -v
COPY exec.sh /srv/exec.sh
RUN chmod +x /srv/exec.sh
CMD ["/srv/exec.sh"]
