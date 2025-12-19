FROM alpine:latest

# scarica supercronic
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.29/supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=cd48d45c4b10f3f0bfdd3a57d054cd05ac96812b \
    SUPERCRONIC=supercronic-linux-amd64

RUN apk add --no-cache curl \
    && wget -q "$SUPERCRONIC_URL" -O "$SUPERCRONIC" \
    && echo "$SUPERCRONIC_SHA1SUM  $SUPERCRONIC" | sha1sum -c - \
    && chmod +x "$SUPERCRONIC" \
    && mv "$SUPERCRONIC" /usr/local/bin/supercronic

WORKDIR /cron
COPY job.sh crontab entrypoint.sh ./

RUN chmod +x /cron/job.sh /cron/entrypoint.sh

ENTRYPOINT ["/cron/entrypoint.sh"]