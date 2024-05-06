#!/bin/bash

# Path to the file to write warnings
WARNING_FILE=./statuse_services.txt

# Associative array to store previous statuses of services
declare -A prev_statuses

# Function to check if a service status has changed and write warning if it has
check_status() {
    local service_name=$1 
    local current_status=$(systemctl is-active "$service_name" 2>/dev/null)
    local prev_status=${prev_statuses["$service_name"]}

    if [ -n "$current_status" ] && [ "$current_status" != "$prev_status" ]; then
        if [ "$prev_status" != "unknown" ]; then
            echo "$(date +"%Y/%m/%d %H:%M:%S")" - "$service_name service status changed from $prev_status to $current_status" >> "$WARNING_FILE"
        fi
        prev_statuses["$service_name"]="$current_status"
    fi
}

# Initialize previous statuses for all services
for service in $(systemctl list-units --type=service --no-pager --no-legend | cut -d '.' -f1); do
##for service in $(systemctl list-units --type=service --no-pager --no-legend | awk '{print $1}'); do
    prev_statuses["$service"]="unknown"
done

# Loop indefinitely
while true; do
    # Check status for each service
    for service_name in "${!prev_statuses[@]}"; do
        check_status "$service_name"
    done

    # Sleep for 3 second before next check
    sleep 0
done
