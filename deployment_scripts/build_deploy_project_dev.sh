#! /bin/sh

# load the project configuration script to set the runtime variable values
. ./sh_script_config/project_config.sh

# change directory to the working directory for the remote scenario
root_directory="/c"

cd $project_directory/docker

# build and execute the docker container for the development scenario
docker-compose -f docker-compose-dev.yml up -d  --build

# notify the user that the container has finished executing
echo "The dev docker container has finished building and is running"

read
