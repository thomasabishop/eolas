#!/bin/bash

# Automatically pull and commit changes to remote after generating Neuron static
# site

# USER=thomas
# export XDG_RUNTIME_DIR=/run/user/1000
# source /home/thomas/.env

SLACK_NOTIFIER="${HOME}/repos/utilities/slack_notifier.sh"
NEURON_GENERATOR="${HOME}/repos/neuron-zk-generator/dist/neuron-zk-generator"

cd "${HOME}/repos/eolas"

echo "Checking for changes..."
git pull >/dev/null 2>&1
changes_exist="$(git status --porcelain | wc -l)"

# If no changes, exit. Else commit and push with timestamp
if [ "$changes_exist" -eq 0 ]; then
	echo "No changes, exiting"
	exit 0
fi

# Run Neuron generator
$NEURON_GENERATOR

echo "Changes exist. Updating remote..."
git pull >/dev/null 2>&1
git add .
git commit -q -m "Autosave: $(date +"%Y-%m-%d %H:%M:%S")"
git push

$SLACK_NOTIFIER "eolas" 'success' 'eolas: auto-save executed'
