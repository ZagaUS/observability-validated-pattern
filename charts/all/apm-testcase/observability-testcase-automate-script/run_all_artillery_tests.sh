#!/bin/bash

# Directory containing your Artillery scripts
SCRIPT_DIR="scripts"

# Ensure PROTOCOL and CLUSTER_URL are set with defaults
export PROTOCOL="${PROTOCOL:-http}"
export CLUSTER_URL="${CLUSTER_URL:-apps.rosa-8grhg.ssnp.p1.openshiftapps.com}"

# Loop through each .yaml file in the directory
for script in "$SCRIPT_DIR"/*.yaml; do
  if [ -f "$script" ]; then
    # Extract the service name from the YAML file name (e.g., order-srv-1.yaml -> order-srv-1)
    SERVICE_NAME=$(basename "$script" .yaml)
    
    # Construct the target URL dynamically based on the service name
    export TARGET_URL="${PROTOCOL}://$SERVICE_NAME.$CLUSTER_URL"
    
    # Debugging: Print the TARGET_URL to ensure it's set correctly
    echo "Running Artillery script: $script"
    echo "Using target URL: $TARGET_URL"
    
    # Check if TARGET_URL is empty or undefined
    if [ -z "$TARGET_URL" ]; then
      echo "Error: TARGET_URL is not set correctly!"
      exit 1  # Exit with error if the target URL is not set
    fi

    # Run the Artillery script with the dynamically set TARGET_URL
    artillery run "$script"
    echo "Finished running: $script"
  else
    echo "No .yaml files found in $SCRIPT_DIR"
  fi
done

echo "Test case automation"

# # Define the port on which the server will listen
PORT=8000

# Start the server and listen for incoming connections
while true; do
  (echo -ne "HTTP/1.1 200 OK\r\n"; cat) | nc -l -p $PORT
done

exit 0
