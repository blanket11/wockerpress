#!/bin/bash

# ====================================================================================================
# Configure the SSL server certificate settings for the local development environment.

# Load the .env
. .env

# Execute a batch of SSL server certificate configuration commands.
docker exec -it "${PROJECT_NAME}_wordpress" sh -c "sed -i -e 's/\/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/\/etc\/ssl\/private\/localhost+1.pem/g' /etc/apache2/sites-available/default-ssl.conf &&
sed -i -e 's/\/etc\/ssl\/private\/ssl-cert-snakeoil.key/\/etc\/ssl\/private\/localhost+1-key.pem/g' /etc/apache2/sites-available/default-ssl.conf &&
a2ensite default-ssl &&
a2enmod ssl"

# Restart the local server to reflect the changes.
docker-compose restart
