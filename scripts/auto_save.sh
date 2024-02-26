#!/bin/bash

# Automatically commits/pull changes to the remote ZK repository.

tidy_filenames="${EOLAS_DIR}/scripts/tidy_filenames.sh"
purge_images="${EOLAS_DIR}/scripts/purge_images.sh"

cd $EOLAS_DIR 

echo "Standardising file-names..." 
source ${tidy_filenames}

echo "Removing unused images..."
source ${purge_images}

echo "Checking for changes..."
git pull >/dev/null 2>&1

changes_exist="$(git status --porcelain | wc -l)"

# If no changes, exit. Else commit and push with timestamp
if [ "$changes_exist" -eq 0 ]; then
    echo "No changes, exiting"
    exit 0
fi

echo "Updating remote..."
git pull >/dev/null 2>&1
git add .
git commit -q -m "Autosave: $(date +"%Y-%m-%d %H:%M:%S")"
git push
