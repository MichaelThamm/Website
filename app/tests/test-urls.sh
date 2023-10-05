#!/bin/bash

# Parse index.html and extract all href attributes starting with https://
links=$(grep -o 'href="https://[^"]*' ./app/templates/index.html | sed 's/href="//')

# Function to check if a given status code is acceptable
is_acceptable_status() {
    case "$1" in
        200|403|999) return 0 ;;
        *) return 1 ;;
    esac
}

# Loop through each https:// link and check existence with curl
for link in $links; do
    response=$(curl -sL -w "%{http_code}" "$link" -o /dev/null)
    if is_acceptable_status "$response"; then
        echo "Link $link exists (HTTP $response)"
    else
        echo "Link $link does not exist or has an unacceptable status code (HTTP $response)"
        exit 1
    fi
done
