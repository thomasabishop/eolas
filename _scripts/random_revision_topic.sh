#!/bin/bash

DIRS_TO_PARSE="../Algorithms ../Computer_Architecture ../Databases"

for ele in $DIRS_TO_PARSE; do
    find $ele -name "*.md" -type f >> list_of_files.list
done


#find ../ -name "*.md" -type f > list_of_files.list
