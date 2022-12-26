#!/bin/bash

# This script returns a random topic for me to revise

# Choose source directories...
DIRS_TO_PARSE="../Computer_Architecture ../Electronics_and_Hardware ../Operating_Systems ../Programming_Languages/Shell ../Logic"

# Return array of all files belonging to source dirs...
for ele in $DIRS_TO_PARSE; do
    FILE_MATCHES+=( $(find $ele -name "*.md" -type f) )
done

# Generate a random integer between 0 and the match array length...
RANDOM_FILE_INDEX=$(( $RANDOM % ${#FILE_MATCHES[@]} + 0 ))

# Return file matching that index...
echo "Revise this topic: ${FILE_MATCHES[$RANDOM_FILE_INDEX]}"
