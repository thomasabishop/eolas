#!/bin/bash

# If there are images in img/ that are not being used by the Zettelkasten, delete them
find /home/thomas/repos/eolas/img -type f | while read filename; do
		pwd    
		rg "${filename##*/}" ../ --type markdown >/dev/null 2>&1
    if [ "$?" -eq 1 ]; then
        echo "Deleted unused image: ${filename##*/}"
        # rm $filename
    fi
done
