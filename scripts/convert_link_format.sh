#!/bin/bash

find /home/thomas/repos/eolas/zk/ -type f -name "*.md" | while read file; do
    sed -i -r 's/\[([^\]]+)\]\(\/[^)]+\)/[[\1]]/g' "$file"
done


