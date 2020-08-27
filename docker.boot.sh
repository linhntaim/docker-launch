#!/bin/bash
# Variable
PROJECT_NAME="$@"
echo "### PROJECT_NAME=${PROJECT_NAME}"
# MySQL
### Set directory's permission; without it, service cannot start
chown -R mysql:mysql /var/lib/mysql
### Start service
service mysql start
### Create database
NONE_EXISTED=$(mysql -s -N -e "SELECT schema_name FROM information_schema.schemata where schema_name = '${PROJECT_NAME}';")
if [[ -z "${NONE_EXISTED}" ]]; then
mysql -e "CREATE DATABASE ${PROJECT_NAME};"
### Create new user for database
mysql -e "CREATE USER '${PROJECT_NAME}'@'localhost' IDENTIFIED BY '${PROJECT_NAME}';"
### Make sure user can handle all actions on the database
mysql -e "GRANT ALL ON *.* TO '${PROJECT_NAME}'@'localhost';" #
### Apply the change of user permissions
mysql -e "FLUSH PRIVILEGES;"
### Create database structure and data by script
mysql -e "USE ${PROJECT_NAME};SOURCE /dsquare/docker/database.sql;"
fi
# Laravel
### Install packages
composer install --working-dir=/dsquare/${PROJECT_NAME}
### Replace application environment
cp /dsquare/${PROJECT_NAME}/.env.docker /dsquare/${PROJECT_NAME}/.env
### Require permissions for Laravel app
chmod -R 777 /dsquare/${PROJECT_NAME}/bootstrap/cache
chmod -R 777 /dsquare/${PROJECT_NAME}/storage
### Make sure Laravel schedule is ready to run
echo "* * * * * php /dsquare/${PROJECT_NAME}/artisan schedule:run >> /dev/null 2>&1" >> /etc/crontab
# sendmail
### Start service
##service sendmail start
# Supervisor
### Configuration to run Laravel queue
### cp /dsquare/docker/.supervisor.conf /etc/supervisor/conf.d/${PROJECT_NAME}.conf
### Start service
##  service supervisor start
# PHP
### Start service
service php7.3-fpm start
# NGINX configuration
### Replace the configuration to run application
cp /dsquare/docker/.nginx.conf /etc/nginx/sites-available/default
### Make sure the NGINX run in foreground; without it, docker container will stop running
echo "daemon off;" >> /etc/nginx/nginx.conf
### Start service
service nginx start


