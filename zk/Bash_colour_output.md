---
tags: [shell]
created: Sunday, November 17, 2024
---

# Bash colour output'

Define colours:

```sh
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NO_COLOR='\033[0m'
```

Interpolate in string:

```sh
echo -e "${BLUE}INFO Uploading graph file...${NO_COLOR}"
```

Note: must end with the blank colour otherwise everything subsequent will be in
blue.
