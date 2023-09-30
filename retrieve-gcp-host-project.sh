#!/bin/bash

# Fetch the full hostname
FULL_HOSTNAME=$(curl -s "http://metadata.google.internal/computeMetadata/v1/instance/hostname" -H "Metadata-Flavor: Google")

# Extract the project name from the FULL_HOSTNAME
PROJECT_NAME=$(echo "$FULL_HOSTNAME" | awk -F'.' '{print $(NF-1)}')

# Output to inputs.yml
echo "projectname: $PROJECT_NAME" > inputs.yml
