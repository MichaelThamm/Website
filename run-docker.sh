#!/bin/bash

# Delete the containers from previous builds
docker rm $(docker stop $(docker ps -aqf "name=demo"))

# Build Docker image
docker build -t demo/website:local .
# Run the Docker container in detached mode to allow access to port 5000
docker run --name demo -d -p 5000:5000 demo/website:local
# Set the local webpage location
url="http://localhost:5000"
# Start webpage in native Linux
xdg-open $url
# Start webpage in Windows via WSL
cmd.exe /C start "" "$url"