#!/bin/bash

# Automatically commits/pull changes to the remote repository with a generic commit message.

# ZK_PAT="/home/thomas/repos/eolas"
tidy_filenames="/home/thomas/repos/eolas/scripts/tidy_filenames.sh"
purge_images="/home/thomas/repos/eolas/scripts/purge_images.sh"

cd $EOLAS_DIR 

source ${tidy_filenames}
source ${purge_images}

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
