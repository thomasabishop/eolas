#!/bin/bash

find /home/thomas/repos/computer_science/img -type f | while read filename; do
    rg "${filename##*/}" ../ --type markdown >/dev/null 2>&1
    if [ "$?" -eq 1 ]; then
        echo "Deleted unused image: ${filename##*/}"
        rm $filename
    fi
done


