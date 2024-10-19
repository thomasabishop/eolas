#!/bin/bash

# Replace all instances of `img` in Markdown image links with `_img` (to reflect new directory structure)

find /home/thomas/repos/eolas/ -type f -name "*.md" | while
read file; do
    sed -i 's/\/_img\//\/img\//g' $file
done



