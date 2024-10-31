#!/bin/bash

# Define a directory for storing logs
log_dir="/sistemas/logs"

# Create the log directory if it does not exist
mkdir -p "$log_dir"

# Define a timestamp format for the log files
#timestamp=$(date +"%Y%m%d_%H%M%S")
timestamp=$(date +"%Y%m%d")

# Get the list of all container names
container_names=$(docker ps -a --format "{{.Names}}")

# Loop through each container name
for container_name in $container_names; do
    # Define the log file name with timestamp
    #log_file="${container_name}_${timestamp}.log"
    log_file="${log_dir}/${container_name}_${timestamp}.log"

    # Fetch the logs and save them to the log file
    echo "Fetching logs for container: $container_name"
    #docker logs "$container_name" > "$log_file"
    #docker logs "$container_name" >> "$log_file"
    docker logs "$container_name" --since 10m >> "$log_file"

    # Optionally, print a message indicating completion for each container
    echo "Logs for $container_name saved to $log_file"
done
