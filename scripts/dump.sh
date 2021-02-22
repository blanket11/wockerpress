#!/bin/bash

# ====================================================================================================
# Dump the SQL of Local

# Load the .env
. .env

# Execute the command to dump the SQL of Local to the /sql directory.
docker exec -it "${PROJECT_NAME}_db" sh -c "mysqldump -u wordpress -pwordpress wordpress > /sql/dump.sql --no-tablespaces" >&/dev/null
