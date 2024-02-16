#!/bin/bash

# This script automatically commits/pull changes to the remote repository with a generic commit message.

# It is aliased to `cs-update` in .zshrc

notes_path="/home/thomas/repos/eolas"
space_to_underscore="/home/thomas/repos/eolas/_scripts/space_to_underscore_filename.sh"
clean_image_directory="/home/thomas/repos/eolas/_scripts/clean_image_directory.sh"

cd "$notes_path"

# Loop through directories and convert spaces in filenames to underscores
source ${space_to_underscore}
source ${clean_image_directory}

git pull >/dev/null 2>&1

changes_exist="$(git status --porcelain | wc -l)"

# If no changes, exit. Else commit and push with timestamp
if [ "$changes_exist" -eq 0 ]; then
    echo "No changes"
    exit 0
fi

git pull >/dev/null 2>&1
git add .
git commit -q -m "Autosave: $(date +"%Y-%m-%d %H:%M:%S")"
git push
