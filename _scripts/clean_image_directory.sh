#!/bin/bash

# If there are images in _img/ that are not being used in the workspace, delete them
find /home/thomas/repos/eolas/_img -type f | while read filename; do
    rg "${filename##*/}" ../ --type markdown >/dev/null 2>&1
    if [ "$?" -eq 1 ]; then
        echo "Deleted unused image: ${filename##*/}"
        rm $filename
    fi
done
