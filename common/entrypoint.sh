#!/bin/bash
cd /server

#######
#   APPLY ENVIRONMENT VARIABLES TO THE SERVER.CFG (LEGACY CONFIGURATION)
#######

# If the configuration exists
if [ -f server.cfg ]; then
    # Get all environment variables starting with SAMP_
    ENV_SAMP_VARS=$(env | grep '^SAMP_')

    # Create a temporary copy of server.cfg
    cp server.cfg /tmp/server.cfg.tmp

    # Loop through each environment variable
    while IFS= read -r ENV_VAR; do
        # Temporarily change Internal Field Separator to '=' to split the variable into name and value
        IFS='=' read -r VAR_NAME VAR_VALUE <<< "$ENV_VAR"

        # Remove the SAMP_ prefix and convert the rest to lowercase
        VAR_NAME=$(echo "$VAR_NAME" | sed 's/^SAMP_//g' | tr '[:upper:]' '[:lower:]')

        # Check if the variable is already in the server configuration
        if grep -q "^$VAR_NAME" /tmp/server.cfg.tmp; then
            # If it is, replace the value
            sed -i "s/^$VAR_NAME.*/$VAR_NAME $VAR_VALUE/g" /tmp/server.cfg.tmp
        else
            # If it isn't, add it to the end of the file
            echo "$VAR_NAME $VAR_VALUE" >> /tmp/server.cfg.tmp
        fi
    done <<< "$ENV_SAMP_VARS"

    # Write the content of the temporary file back to the server.cfg
    cat /tmp/server.cfg.tmp > server.cfg
    # Remove the temporary file
    rm /tmp/server.cfg.tmp
fi

#######
#   APPLY ENVIRONMENT VARIABLES TO THE open.mp LAUNCHING COMMAND
#######

# Initialize an empty array to store the environment variables
OMP_CLI_ARGS=()

# Get all environment variables starting with OMP_
ENV_OPENMP_VARS=$(env | grep '^OMP_')

# Loop through each environment variable
while IFS= read -r ENV_VAR; do
    # Temporarily change Internal Field Separator to '=' to split the variable into name and value
    IFS='=' read -r VAR_NAME VAR_VALUE <<< "$ENV_VAR"
    
    # Remove the OMP_ prefix, convert double _ to . and convert the rest to lowercase
    VAR_NAME=$(echo "$VAR_NAME" | sed 's/^OMP_//g' | sed 's/__/\./g' | tr '[:upper:]' '[:lower:]')
    
    # Add VAR_NAME=VAR_VALUE to the array
    OMP_CLI_ARGS+=("$VAR_NAME=$VAR_VALUE")

done <<< "$ENV_OPENMP_VARS"

#######
#   RUN THE SERVER
#######

# Either run the Dockerfile CMD or the open.mp server
if [ $# -gt 0 ]; then
    echo -e "\nAlternative launching method: $@"
    sh -c "$@"
else
    SAFE_ARGS=()
    for arg in "${OMP_CLI_ARGS[@]}"; do
        if [[ "$arg" == *password=* ]]; then
            # Extract the key part and mask the value
            key="${arg%%=*}"
            SAFE_ARGS+=("-c" "$key=***")
        else
            SAFE_ARGS+=("-c" "$arg")
        fi
    done
    echo -e "\nLaunching open.mp server with the following environment variables as CLI arguments (please note values with spaces or quotes do not work): ${SAFE_ARGS[*]}"
    
    # Build the actual command arguments with -c before each argument
    ACTUAL_ARGS=()
    for arg in "${OMP_CLI_ARGS[@]}"; do
        ACTUAL_ARGS+=("-c" "$arg")
    done
    ./omp-server "${ACTUAL_ARGS[@]}"
fi

# Save the exit code of whatever we ran
EXIT_CODE=$?

exit $EXIT_CODE
