#!/bin/bash

	# define the database scripts mapping using the pipe character as a delimiter
	# The elements should contain encoded values with the "|" character as the delimiter: sql path (within container)|sql script file|User Secret Name|Password Secret Name|Script Password Secrets (this can be one or more optional pipe-delimited secret names when a password is injected into the script - examples include a CREATE USER command) 

	# create schemas script - executed as SYSDBA
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/PLW/modules/PLW/SQL|@dev_container_setup/create_docker_schemas.sql|oracle_admin_user|oracle_pwd|piclib_db_password_secret|plw_db_password_secret")

	# create PICLIB data schema objects
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/PLW/modules/PLW/SQL|@automated_deployments/deploy_dev.sql|piclib_db_username_secret|piclib_db_password_secret")

	# create PUB_RPTS schema objects
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/PLW/modules/PLW/SQL|@automated_deployments/deploy_PLW_dev.sql|plw_db_username_secret|plw_db_password_secret")

	# define the array of non-sensitive environment variable names that are exported for use in the container
	CUSTOM_ENV_VARS+=("CONTAINER_APP_PORT")

	# define the array of compose files that are used by the individual projects (specify the path relative to the core/build directory

	# add the secrets for PRI to the code-db-ords-deploy container
	COMPOSE_FILES+=("../../projects/PLW/build/plw_secrets.yml")
	
	# add the PRI application container
	COMPOSE_FILES+=("../../projects/PLW/modules/PLW/container_application_deployment/docker-compose.yml")

	# Override and define additional properties for the PRI application container
	COMPOSE_FILES+=("../../projects/PLW/build/custom_plw.yml")
	
	# add the secrets
	# Example:
	SECRET_MAPPING_ARR+=(
		["piclib_db_username_secret"]="DB_PICLIB_USER"
		["piclib_db_password_secret"]="DB_PICLIB_PASSWORD"
		["plw_db_username_secret"]="DB_PLW_USER"
		["plw_db_password_secret"]="DB_PLW_PASSWORD"
		)