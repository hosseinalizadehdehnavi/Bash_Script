#!/bin/bash

# Threshold percentage for root directory usage
THRESHOLD=85

# Get the current usage of the root directory
root_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

# Check if the root directory usage exceeds the threshold
if [ "$root_usage" -gt "$THRESHOLD" ]; then
    truncate -s 0 /var/lib/docker/containers/**/*-json.log
    docker system prune -a -f
fi
