#!/bin/bash

echo "  *********************************************************************************"
echo "  *                                                                               *"
echo "  *                      Welcome to the Data Portfolio installer                  *"
echo "  *                                                                               *"
echo "  *********************************************************************************"

export version=$1

if [ -z "$1" ]; then
    echo "[WARNING] No version supplied: setting default value to SNAPSHOT"
    version="SNAPSHOT"
fi

if docker compose version >/dev/null 2>&1; then
  echo "Found Docker Compose v2. Ok, continue.."
else
  echo "ERROR: Docker Compose v1 detected. Please use docker compose v2. This is needed for the cron image build command." >&2
  exit 1
fi

echo "Shutting down DATA PORTFOLIO..."
docker compose down

echo "DATA PORTFOLIO stopped"

echo "Remove symbolic link..."
echo "rm /data/data-portfolio"
rm /data/data-portfolio

echo "Create directory for release $version..."

echo "mkdir -p /data/data-portfolio_${version}"
mkdir -p /data/data-portfolio_${version}

echo "Create new symbolic link..."

echo "ln -s  /data/data-portfolio_${version} /data/data-portfolio"
ln -s  /data/data-portfolio_${version} /data/data-portfolio

echo "Copy the configuration files in the proper folder..."

echo "cp -R data/data-portfolio/* /data/data-portfolio_${version}/"
cp -R data/data-portfolio/* /data/data-portfolio_${version}/

echo "Pull images..."
docker compose pull

echo "DATA PORTFOLIO environment ready!"
