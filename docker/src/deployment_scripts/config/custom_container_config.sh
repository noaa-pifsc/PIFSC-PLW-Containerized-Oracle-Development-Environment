#!/bin/sh

# define any database/apex credentials necessary to deploy the database schemas and/or applications


# define PLW schema credentials
DB_PICLIB_USER="PICLIB"
DB_PLW_PASSWORD="[CONTAINER_PW]"

# define PLW connection string
PICLIB_CREDENTIALS="$DB_PICLIB_USER/$DB_PLW_PASSWORD@${DBHOST}:${DBPORT}/${DBSERVICENAME}"

# define the PLW database folder path
PLW_FOLDER_PATH="/usr/src/PLW/SQL"

# PLW app username
DB_PLW_USER="PUB_RPTS"

# define PLW app connection string
PLW_CREDENTIALS="$DB_PLW_USER/$DB_PLW_PASSWORD@${DBHOST}:${DBPORT}/${DBSERVICENAME}"