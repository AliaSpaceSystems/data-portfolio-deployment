#!/bin/bash

echo "  *********************************************************************************"
echo "  *                                                                               *"
echo "  *                           Welcome to DATA PORTFOLIO!                          *"
echo "  *                                                                               *"
echo "  *********************************************************************************"

echo "  Starting DATA PORTFOLIO..."

docker compose up -d || { echo "docker compose command not found. Trying with docker compose instead.."; docker-compose up -d; }

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
