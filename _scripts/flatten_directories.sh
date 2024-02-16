#!/bin/bash
directories_to_parse="../Computer_Architecture ../Databases ../Electronics_and_Hardware ../Operating_Systems ../Programming_Languages ../DevOps"

directory="/home/thomas/repos/eolas-bak"

mapfile -t directories < <(find "$directory" -type d)
file_matches=()

# Return array of all files belonging to source dirs...
for ele in ${directories[@]}; do
    file_matches+=( $(find $ele -name "*.md" -type f) )
done

echo ${file_matches[1]}

