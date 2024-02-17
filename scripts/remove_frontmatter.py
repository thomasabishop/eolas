# Remove 'title' and 'categories' from Yaml frontmatter of old entries
import os
import re

# Define the directory
directory = "/home/thomas/repos/eolas-bak/zk"

# Define the regex patterns
title_pattern = re.compile(r"title:.*\n")
categories_pattern = re.compile(r"categories:.*\n(\s*-.*\n)*")

# Iterate over all files in the directory
for filename in os.listdir(directory):
    # Check if the file is a markdown file
    if filename.endswith(".md"):
        # Open the file
        with open(os.path.join(directory, filename), "r+") as file:
            # Read the file content
            content = file.read()
            # Remove the 'title' and 'categories' sections
            content = title_pattern.sub("", content)
            content = categories_pattern.sub("", content)
            # Seek to the beginning of the file
            file.seek(0)
            # Write the modified content back to the file
            file.write(content)
            # Truncate the file to remove any remaining old content
            file.truncate()
