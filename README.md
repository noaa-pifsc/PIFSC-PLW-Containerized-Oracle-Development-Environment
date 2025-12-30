# PIFSC PLW Oracle Developer Environment

## Overview
The PIFSC Library Website (PLW) Containerized Oracle Developer Environment (CODE) project was developed to provide a custom CODE for the PLW.  This repository can be forked to extend the existing functionality to any data systems that depend on the PLW for both development and testing purposes.  

## Resources
-   ### PLW CODE Version Control Information
    -   URL: https://github.com/noaa-pifsc/PIFSC-PLW-Containerized-Oracle-Development-Environment
    -   Version: 1.0 (git tag: PLW_CODE_v1.0)
    -   Upstream repository:
        -   CODE Version Control Information:
            -   URL: https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment
            -   Version: 1.3 (git tag: CODE_v1.3)

## Dependencies
\* Note: all dependencies are implemented as git submodules in the [modules](./modules) folder
-   ### PLW Version Control Information
    -   folder path: [modules/PLW](./modules/PLW)
    -   Version Control Information:
        -   URL: <git@picgitlab.nmfs.local:PIFSC/pifsc-library-website.git>
        -   Application: 1.4 (Git tag: PIFSC_library_website_v1.4)
-   ### Container Deployment Scripts (CDS) Version Control Information
    -   folder path: [modules/CDS](./modules/CDS)
    -   Version Control Information:
        -   URL: <git@github.com:noaa-pifsc/PIFSC-Container-Deployment-Scripts.git>
        -   Scripts: 1.1 (Git tag: pifsc_container_deployment_scripts_v1.1)

## Prerequisites
-   See the CODE [Prerequisites](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#prerequisites) for details

## Repository Fork Diagram
-   See the CODE [Repository Fork Diagram](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#repository-fork-diagram) for details

## Runtime Scenarios
-   See the CODE [Runtime Scenarios](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#runtime-scenarios) for details

## Automated Deployment Process
-   ### Prepare the project
    -   Recursively clone (use --recurse-submodules option) the [PLW CODE repository](#plw-code-version-control-information) to a working directory
    -   (optional) Update the [.env](./secrets/.env) custom environment variables accordingly for the PLW app
-   ### Build and Run the Containers 
    -   See the CODE [Build and Run the Containers](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#build-and-run-the-containers) for details
    -   #### PLW Database Deployment
        -   [create_docker_schemas.sql](https://picgitlab.nmfs.local/PIFSC/pifsc-library-website/-/blob/master/SQL/dev_container_setup/create_docker_schemas.sql?ref_type=heads) is executed by the SYS schema to create the PLW schema and grant the necessary privileges
        -   [deploy_dev.sql](https://picgitlab.nmfs.local/PIFSC/pifsc-library-website/-/blob/master/SQL/automated_deployments/deploy_dev.sql?ref_type=heads) is executed with the PICLIB schema to deploy the objects to the PICLIB schema
        -   [deploy_PLW_dev.sql](https://picgitlab.nmfs.local/PIFSC/pifsc-library-website/-/blob/master/SQL/automated_deployments/deploy_PLW_dev.sql?ref_type=heads) is executed with the PUB_RPTS schema to deploy the objects to the PUB_RPTS schema

## Customization Process
-   ### Implementation
    -   \*Note: this process will fork the PLW CODE parent repository and repurpose it as a project-specific CODE
    -   Fork [this repository](#plw-code-version-control-information)
    -   See the CODE [Implementation](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#implementation) for details 
-   ### Upstream Updates
    -   See the CODE [Upstream Updates](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#upstream-updates) for details

## Container Architecture
-   See the CODE [container architecture documentation](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file/-/blob/main/README.md?ref_type=heads#container-architecture) for details
-   ### PLW CODE Customizations:
    -   [docker/.env](./docker/.env) was updated to define an appropriate APP_SCHEMA_NAME value and remove the TARGET_APEX_VERSION since there is no Apex app or Apex dependencies for the PLW CODE project
    -   [custom_deployment_functions.sh](./deployment_scripts/functions/custom_deployment_functions.sh) was updated to add the PLW docker-compose.yml file and the [secrets/.env](./secrets/.env) file.  It was also updated to remove the [CODE-ords.yml](./docker/CODE-ords.yml) configuration file
    -   [custom-docker-compose.yml](./docker/custom-docker-compose.yml) was updated to implement file-based secrets, PLW and CODE-specific mounted volume overrides 
    -   [custom_db_app_deploy.sh](./docker/src/deployment_scripts/custom_db_app_deploy.sh) was updated to deploy the PLW database and application schemas
    -   [custom_container_config.sh](./docker/src/deployment_scripts/config/custom_container_config.sh) was updated to define DB credentials and mounted volume file paths for the PLW SQL scripts
    -   Multiple files were added in the [secrets](./secrets) folder to specify secret values (e.g. [plw_pass.txt](./secrets/plw_pass.txt) to specify the PLW database password)
        -   [secrets/.env](./secrets/.env) was updated to specify PLW-specific and CODE-specific environment variables

## Connection Information
-   See the CODE [connection information documentation](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file/-/blob/main/README.md?ref_type=heads#connection-information) for details
-   ### PLW Database Connection Information
    -   Connection information can be found in [create_docker_schemas.sql](https://picgitlab.nmfs.local/PIFSC/pifsc-library-website/-/blob/master/SQL/dev_container_setup/create_docker_schemas.sql?ref_type=heads)

## License
See the [LICENSE.md](./LICENSE.md) for details

## Disclaimer
This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.