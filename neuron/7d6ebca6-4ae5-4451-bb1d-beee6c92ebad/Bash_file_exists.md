---
tags: [shell]
created: Sunday, November 17, 2024
---

# Bash file exists

```sh
FILE_PATH="$PWD/foo/bar.json"
if [ ! -f "$FILE_PATH" ]; then
	echo -e "ERROR Graph file ( $FILE_PATH ) does not exist. Exiting."
	exit 0
fi
```
