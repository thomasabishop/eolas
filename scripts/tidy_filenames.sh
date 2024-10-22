#!/bin/bash

# Convert hypens in file names to underscores

main() {
    find . -depth -name '*.md' | while read fname; do
		new_fname=$(echo "$fname" | tr " -"  "_")
        if [ -e "$new_fname" ]; then
					continue 
					echo "No filename change needed"
        else
            echo "Creating new file $new_fname to replace $fname"
            mv "$fname" "$new_fname"
        fi
    done
}

# Run and pipe errors and feedback to logfile

# &>/dev/null
main
