FROM alpine:3.8

MAINTAINER Anton Lebedev <mailbox@lebster.me>

RUN apk add --no-cache bash curl lftp

COPY mirror.sh /

RUN chmod +x /mirror.sh

# Add crontab file in the cron directory
COPY crontab /crontab

# Apply cron job
RUN crontab /crontab

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["crond", "-f", "-L -"]
