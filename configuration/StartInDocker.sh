#!/bin/bash

# Change dir into the project root
cd ..
# Delete the containers from previous builds
docker rm $(docker stop $(docker ps -qf "name=Flask-Docker"))

# Build Docker image
docker build -t michaelthamm/github-projects:Flask-Docker -f ./Dockerfile .
# Run the Docker container in detached mode to allow access to port 5000
docker run --name Flask-Docker -d -p 5000:5000 michaelthamm/github-projects:Flask-Docker
# Set the local webpage location
url="http://localhost:5000"
# Start webpage in native Linux
#xdg-open $url
# Start webpage in Windows via WSL
cmd.exe /C start "" "$url"