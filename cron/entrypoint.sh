#!/bin/sh

sleep 10
/cron/job.sh

exec supercronic /cron/crontab
