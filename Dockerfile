FROM alpine:latest

RUN apk add --no-cache --update mysql-client py-pip && pip install s3cmd

COPY backup-script /bin/backup-script
COPY entrypoint /bin/entrypoint
RUN chmod +x /bin/backup-script
RUN chmod +x /bin/entrypoint

ENV SCHEDULE "* * * * *"
ENV MYSQL_HOST 127.0.0.1
ENV MYSQL_USER root
ENV AWS_OBJECT_PATH "backup.sql"

CMD ["/usr/sbin/crond", "-f"]
ENTRYPOINT ["/bin/entrypoint"]
