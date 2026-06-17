#!/bin/bash

echo "This is the PLW pre client_server hook"

# load the PLW runtime configuration file
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../config/plw_runtime_config.sh"