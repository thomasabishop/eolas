#!/bin/bash

DIRS_TO_PARSE="../Algorithms ../Computer_Architecture ../Databases"

for ele in $DIRS_TO_PARSE; do
    FILE_MATCHES+=( $(find $ele -name "*.md" -type f) )
done

RANDOM_FILE_INDEX=$(( $RANDOM % ${#FILE_MATCHES[@]} + 0 ))

echo "Revise this topic: ${FILE_MATCHES[$RANDOM_FILE_INDEX]}"
