import os
import re


def trim_markdown_links(filepath):
    with open(filepath, "r") as file:
        content = file.read()

    # Regular expression to match Markdown links
    pattern = r"\[([^\]]+)\]\(([^)]+)\)"
    links = re.findall(pattern, content)

    # For each link, extract the filename and replace the link
    for text, link in links:
        link_filename = os.path.basename(link)
        content = content.replace(f"[{text}]({link})", f"[{text}]({link_filename})")

    # Write the modified content back to the file
    with open(filepath, "w") as file:
        file.write(content)


def process_directory(directory):
    for filename in os.listdir(directory):
        if filename.endswith(".md"):
            trim_markdown_links(os.path.join(directory, filename))


# Usage
# process_directory('/path/to/your/directory')

# Usage
process_directory("/home/thomas/repos/eolas/zk")
