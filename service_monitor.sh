#!/bin/bash

# Associative array for previous statuses of services
declare -A prev_statuses

# Function to check service status and send a Rocket.Chat message
check_status() {
  local service_name="$1"
  local current_status=$(systemctl is-active "$service_name" 2>/dev/null)
  local prev_status="${prev_statuses["$service_name"]}"

  if [[ "$current_status" && "$current_status" != "$prev_status" && "$prev_status" != "unknown" ]]; then

    # Prepare message payload with service status change details
    TIME="$(date +"%Y/%m/%d %H:%M:%S")"
    MESSAGE="$TIME - '"$service_name"' service changed from '"$prev_status"' to '"$current_status"'"

    WEBHOOK="http://localhost:3000/hooks/663a1accbbcc52c0188b0096/X63YXmFKbsmC6EDESavANZrRdYKSaeLeM94ag75fyiowgK9K"

    # Send message via curl (error suppressed)
    curl -s -o /dev/null -X POST -H 'Content-Type: application/json' -d "{\"text\": \"${MESSAGE}\" }" ${WEBHOOK} 
    fi

    prev_statuses["$service_name"]="$current_status"

}

# Initialize previous statuses
for service in $(systemctl list-units --type=service --no-pager --no-legend | cut -d '.' -f1); do
  prev_statuses["$service"]="unknown"
done

# Loop to check statuses
while true; do
  for service_name in "${!prev_statuses[@]}"; do
    check_status "$service_name"
  done
  sleep 0
done
