#!/bin/sh

echo "running the custom database and/or application deployment scripts"


	# change the directory to the PLW folder path so the SQL scripts can run without alterations
	cd ${PLW_FOLDER_PATH}

	# create the PLW schema(s)
sqlplus -s /nolog <<EOF
@dev_container_setup/create_docker_schemas.sql
$SYS_CREDENTIALS
EOF

	echo "Create the PLW data objects"

	# execute the PLW database deployment scripts
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_dev.sql
$PICLIB_CREDENTIALS
EOF

	echo "the PLW data objects were created"



	echo "Create the PLW app objects"

	# execute the PLW database deployment scripts
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_PLW_dev.sql
$PLW_CREDENTIALS
EOF

	echo "the PLW app objects were created"


	echo "SQL scripts executed successfully!"

echo "custom deployment scripts have completed successfully"
