@echo off

:: Stop the container
docker-compose down
:: Pull the required image
docker pull gbuatdsquare/uemp:latest

for %%x in (%*) do (
    :: Refresh database
    if "%%x"=="--db-refresh" docker volume rm docker_mysql
    :: Refresh projects
    if "%%x"=="--projects-refresh" docker volume rm docker_projects
)

:: Launch the container
docker-compose up
