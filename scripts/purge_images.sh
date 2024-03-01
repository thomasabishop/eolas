##!/bin/bash

# If there are images in img/ that are not being used by the Zettelkasten, delete them

# Loop through /img directory
find "/home/thomas/repos/eolas/img" -type f | while read filename; do
		# Check each .md file in ZK for image   
		search_result=$(rg "${filename##*/}" "${EOLAS_PATH}/zk" --type markdown)
    # If the image is not found in any file, delete it
    if [ -z "$search_result" ]; then
				echo "Deleted unused image: ${filename##*/}"
        rm $filename
    fi
done

