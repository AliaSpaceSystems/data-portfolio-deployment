#!/bin/bash

echo "  *********************************************************************************"
echo "  *                                                                               *"
echo "  *                           Welcome to DATA PORTFOLIO!                          *"
echo "  *                                                                               *"
echo "  *********************************************************************************"

echo "  Shutting down DATA PORTFOLIO..."

if docker compose version >/dev/null 2>&1; then
  echo "Found Docker Compose v2. Ok, continue.."
else
  echo "ERROR: Docker Compose v1 detected. Please use docker compose v2. This is needed for the cron image build command." >&2
  exit 1
fi

docker compose down

return_code=$?

if [ $return_code -eq 0 ]; then
    
    echo "  Application stopped"
    echo "  You can check the application status by means of the following command:"
    echo "  docker ps"

else
    echo "  Application stoppping error!"
fi
