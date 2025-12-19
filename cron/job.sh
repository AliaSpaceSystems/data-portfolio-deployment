#!/bin/sh
curl -X GET http://data-portfolio-be:3000/datasources/update-db || echo "Cron job 'datasources/update-db' failed at $(date)"
