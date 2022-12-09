#!/bin/bash

# This script runs as a cron job in half-hour intervals to automatically commit changes to the remote repository

NOTES_PATH="${HOME}/repos/computer_science"
SPACE_2_UNDRSCR="${HOME}/repos/bash_scripts/space_to_underscore_filename.sh"

cd "$NOTES_PATH"

# Loop through directories and convert spaces in filenames to underscores
source ${SPACE_2_UNDRSCR}
git pull
CHANGES_EXIST="$(git status --porcelain | wc -l)"

# If no changes, exit. Else commit and push with timestamp
if [ "$CHANGES_EXIST" -eq 0 ]; then
    exit 0
fi

git pull
git add .
git commit -q -m "Autosave: $(date +"%Y-%m-%d %H:%M:%S")"
git push -q
