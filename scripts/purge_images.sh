##!/bin/bash

# If there are images in img/ that are not being used by the Zettelkasten, delete them
find "${EOLAS_PATH}/img" -type f | while read filename; do
    # Search for the image in the markdown files in the EOLAS_DIR directory
    search_result=$(rg "${filename##*/}" "${EOLAS_PATH}/zk" --type markdown)
    
    # If the image is not found in any file
    if [ -z "$search_result" ]; then
        echo "Deleted unused image: ${filename##*/}"
        # rm $filename
    else
       echo "Nothing to purge. All images currently in use." 
    fi
done

