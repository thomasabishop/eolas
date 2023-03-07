#!/bin/bash

# This script returns a random topic for me to revise

# It is aliased to cs-revise in .zshrc

# Choose source directories...
directories_to_parse="./Computer_Architecture ./Databases ./Electronics_and_Hardware ./Operating_Systems ./Programming_Languages/Shell ./Logic"

# Return array of all files belonging to source dirs...
for ele in $directories_to_parse; do
    file_matches+=( $(find $ele -name "*.md" -type f) )
done

# Generate a random integer between 0 and the match array length...
random_file_index=$(( $RANDOM % ${#file_matches[@]} + 0 ))

# Return file matching that index...
echo "Revise this topic: ${file_matches[$random_file_index]}"
