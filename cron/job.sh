#!/bin/sh

LOCK=/tmp/update-db.lock

URL="${BACKEND_URL}/datasources/update-db"

# lock
exec 9>"$LOCK" || exit 1
flock -n 9 || exit 0

i=1
while [ $i -le $MAX_RETRIES ]; do
  echo "call $URL $(date)"

  if timeout $TIMEOUT curl -fsS "$URL"; then
    echo "call ok $(date)"
    exit 0
  fi

  echo "retry $i failed $(date)"
  i=$((i+1))
  sleep 5
done

echo "job failed after $MAX_RETRIES retries $(date)"
exit 1