---
tags:
  - shell
---

## Kill a process running on a port

For example a local server.

```bash
sudo lsof -t -i:8000
# List files and proces ID (-t) and internet connections (-i) on port number

$ 7890
# Gives you process id

sudo kill -9 7890
# Kill the process that is running there
```
