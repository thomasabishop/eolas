#!/bin/bash

#============================================================================#
# FILE: auto_save.sh																												 #
# USAGE: auto_save.sh																												 #
# DESCRIPTION: Automatically pulls and commits changes to remote after:      #
# running cleanup scripts																										 #
# generating Neuron zettelkasten static site and writing to neuron/					 #
#============================================================================#

USER=thomas
export XDG_RUNTIME_DIR=/run/user/1000
source /home/thomas/.env

tidy_filenames="/home/thomas/repos/eolas/scripts/tidy_filenames.sh"
# purge_images="/home/thomas/repos/eolas/scripts/purge_images.sh"

cd /home/thomas/repos/eolas

echo "Checking for changes..."
git pull >/dev/null 2>&1
changes_exist="$(git status --porcelain | wc -l)"

# If no changes, exit. Else commit and push with timestamp
if [ "$changes_exist" -eq 0 ]; then
		echo "No changes, exiting"
    exit 0
fi

echo "Standardising file-names..."
source ${tidy_filenames}

# echo "Removing unused images..."
# source ${purge_images}


/home/thomas/repos/neuron-zk-generator/dist/app 


echo "Changes exist. Updating remote..."
git pull >/dev/null 2>&1
git add .
git commit -q -m "Autosave: $(date +"%Y-%m-%d %H:%M:%S")"
git push

/home/thomas/repos/slack-notifier/src/index.js 'eolas' '✅ Eolas: auto-save executed'	

