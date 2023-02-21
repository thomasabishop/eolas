#!/bin/bash

# This script automatically commits/pull changes to the remote repository with a generic commit message.

# It is aliased to `cs-update` in .zshrc

notes_path="/Users/thomasbishop/prepos/computer_science"
# SPACE_TO_UNDERSCORE="/home/thomas/repos/computer_science/_scripts/space_to_underscore_filename.sh"
# CLEAN_IMAGE_DIRECTORY="/home/thomas/repos/computer_science/_scripts/clean_image_directory.sh"

cd "$notes_path"

# Loop through directories and convert spaces in filenames to underscores
# source ${SPACE_TO_UNDERSCORE}
# source ${CLEAN_IMAGE_DIRECTORY}

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
