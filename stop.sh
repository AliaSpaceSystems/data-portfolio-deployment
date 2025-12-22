#!/bin/bash

echo "  *********************************************************************************"
echo "  *                                                                               *"
echo "  *                           Welcome to DATA PORTFOLIO!                          *"
echo "  *                                                                               *"
echo "  *********************************************************************************"

echo "  Shutting down DATA PORTFOLIO..."

docker compose down || { echo "docker compose command not found. Trying with docker compose instead.."; docker-compose down; }

return_code=$?

if [ $return_code -eq 0 ]; then
    
    echo "  Application stopped"
    echo "  You can check the application status by means of the following command:"
    echo "  docker ps"

else
    echo "  Application stoppping error!"
fi
