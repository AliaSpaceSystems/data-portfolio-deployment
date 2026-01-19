#!/bin/bash

echo "  *********************************************************************************"
echo "  *                                                                               *"
echo "  *                           Welcome to DATA PORTFOLIO!                          *"
echo "  *                                                                               *"
echo "  *********************************************************************************"

echo "  Starting DATA PORTFOLIO..."

set -e

if docker compose version >/dev/null 2>&1; then
  echo "Found Docker Compose v2. Ok, continue.."
else
  echo "ERROR: Docker Compose v1 detected. Please use docker compose v2. This is needed for the cron image build command." >&2
  exit 1
fi

docker compose up --build -d

return_code=$?

if [ $return_code -eq 0 ]; then
    echo "  Application started"

    echo "  You can check the application status by means of the following command:"
    echo "  docker ps"

    echo "  You can check the application logs by means of the following commands:"
    echo "  docker logs -f data-portfolio"    
else
    echo "  Application launching error!"
fi
