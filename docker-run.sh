#!/bin/bash
# Stop the container
docker-compose down
# Pull the required image
docker pull gbuatdsquare/uemp:latest
# Refresh database
if [[ $@ =~ "--db-refresh" ]]
then
    docker volume rm docker_mysql
fi
# Refresh projects
if [[ $@ =~ "--projects-refresh" ]]
then
    docker volume rm docker_projects
fi
# Launch the container
docker-compose up
