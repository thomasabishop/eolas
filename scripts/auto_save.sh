#!/bin/bash

# Automatically commits/pull changes to the remote ZK repository.

tidy_filenames="/home/thomas/repos/eolas/scripts/tidy_filenames.sh"
purge_images="/home/thomas/repos/eolas/scripts/purge_images.sh"

cd /home/thomas/repos/eolas

echo "Standardising file-names..."
source ${tidy_filenames}

echo "Removing unused images..."
# source ${purge_images}

echo "Checking for changes..."
git pull >/dev/null 2>&1

changes_exist="$(git status --porcelain | wc -l)"

# If no changes, exit. Else commit and push with timestamp
if [ "$changes_exist" -eq 0 ]; then
    echo "No changes, exiting"
    exit 0
fi

echo "Changes exist. Updating remote..."
git pull >/dev/null 2>&1
git add .
git commit -q -m "Autosave: $(date +"%Y-%m-%d %H:%M:%S")"
git push

notify-send "Auto-save complete" "Zettelkasten changes committed to remote repository"
