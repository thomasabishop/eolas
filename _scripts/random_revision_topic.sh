#!/bin/bash

DIRS_TO_PARSE="../Algorithms ../Computer_Architecture ../Databases"

for ele in $DIRS_TO_PARSE; do
    MATCHES+=( $(find $ele -name "*.md" -type f) )
done

for i in ${MATCHES[@]}
do
    echo $i
done

# Next steps:
#     - Generate random number
#     - Specify the range of the random number from 0 to length of $MATCHES
#     - Return that index
